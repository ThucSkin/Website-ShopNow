package com.websiteshop.AdminController;

import java.io.IOException;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.util.StringUtils;
import com.websiteshop.model.ListStatusDao;
import com.websiteshop.dao.OrderDAO;
import com.websiteshop.entity.Order;
import com.websiteshop.model.AccountDto;
import com.websiteshop.model.OrderDto;
import com.websiteshop.model.ListStatus;
import com.websiteshop.service.AccountService;
import com.websiteshop.service.OrderDetailService;
import com.websiteshop.service.OrderService;

@Controller
@RequestMapping("admin/orders")
public class OrderAdminController {
	@Autowired
	OrderService orderService;

	@Autowired
	OrderDAO odao;
	@Autowired
	AccountService accountService;

	@Autowired
	OrderDetailService orderDetailService;

	void All_Size_Order(Model model) {
		List<Order> list = orderService.findAll();
		int totalSize = list.size();
		model.addAttribute("totalSize", totalSize);
	}

	ListStatusDao ls = new ListStatusDao();

	@ModelAttribute("list_status")
	public List<ListStatus> getListStatus() {
		return ls.getAll().stream().map(item -> {
			ListStatus dto = new ListStatus();
			BeanUtils.copyProperties(item, dto);
			return dto;
		}).collect(Collectors.toList());
	}

	@PostMapping("updateStatus")
	public ModelAndView updateStatusOrder(ModelMap model, @ModelAttribute("LISTSTATUS") ListStatus status,
			BindingResult result) {

		Order order = orderService.findById(status.getOrderId());
		if (order == null) {
			return new ModelAndView("forward:/admin/orders/list", model);
		}
		order.setStatus(status.getStatus());
		try {
			orderService.save(order);
			model.addAttribute("message", "Đã cập nhật trạng thái");

			return new ModelAndView("redirect:/admin/orders/list", model);
		} catch (Exception e) {
			return new ModelAndView("redirect:/admin/orders/list", model);
		}
	}

	@ModelAttribute("orders")
	public List<OrderDto> getOrder() {
		return orderService.findAll().stream().map(item -> {
			OrderDto dto = new OrderDto();
			BeanUtils.copyProperties(item, dto);
			return dto;
		}).collect(Collectors.toList());
	}

	@ModelAttribute("accounts")
	public List<AccountDto> getAccounts() {
		return accountService.findAll().stream().map(item -> {
			AccountDto dto = new AccountDto();
			BeanUtils.copyProperties(item, dto);
			return dto;
		}).collect(Collectors.toList());
	}

	@GetMapping("list")
	public String search(ModelMap model,
			@RequestParam(name = "name", required = false) String name,
			@RequestParam("page") Optional<Integer> page,
			@RequestParam("size") Optional<Integer> size) {

		model.addAttribute("LISTSTATUS", new ListStatus());
		int currentPage = page.orElse(1);
		int pageSize = size.orElse(5);
		Pageable pageable = PageRequest.of(currentPage - 1, pageSize, Sort.by("orderId").descending());
		Page<Order> resultPage = StringUtils.hasText(name)
				? orderService.findByNameContaining(name, pageable)
				: orderService.findAll(pageable);

		populateModel(model, resultPage);
		return "admin/orders/list";
	}

	private void populateModel(ModelMap model, Page<Order> resultPage) {
		List<Order> orders = resultPage.getContent();
		orders = orders.stream()
				.sorted(Comparator.comparingLong(Order::getOrderId).reversed())
				.collect(Collectors.toList());

		model.addAttribute("orderPage", resultPage);
		model.addAttribute("pageNumbers", calculatePageNumbers(resultPage));
		model.addAttribute("totalSize", orders.size());

		populateStatusCounters(model);
	}

	// phân trang
	private List<Integer> calculatePageNumbers(Page<Order> resultPage) {
		int totalPages = resultPage.getTotalPages();
		int currentPage = resultPage.getNumber() + 1;

		int start = Math.max(1, currentPage - 2);
		int end = Math.min(currentPage + 2, totalPages);

		if (totalPages > 5) {
			if (end == totalPages)
				start = end - 5;
			else if (start == 1)
				end = start + 5;
		}

		return IntStream.rangeClosed(start, end).boxed().collect(Collectors.toList());
	}

	// lấy kich thướt theo status
	private void populateStatusCounters(ModelMap model) {
		model.addAttribute("totalSizeStatus_confirmation", odao.findByStatus("Đang chờ xác nhận").size());
		model.addAttribute("totalSizeStatus_transported", odao.findByStatus("Đang vận chuyển").size());
		model.addAttribute("totalSizeStatus_delivered", odao.findByStatus("Đã giao hàng").size());
		model.addAttribute("totalSizeStatus_cancel", odao.findByStatus("Đã hủy").size());
	}

	@GetMapping("add")
	public String add(Model model) {
		OrderDto dto = new OrderDto();
		dto.setIsEdit(false);
		model.addAttribute("order", dto);
		return "admin/orders/addOrEdit";
	}

	@GetMapping("detail/{orderId}")
	public String detail(@PathVariable("orderId") Long orderId, Model model) {
		model.addAttribute("order", orderService.findById(orderId));
		return "admin/orders/detail";
	}

	@GetMapping("edit/{orderId}")
	public ModelAndView edit(ModelMap model, @PathVariable("orderId") Long orderId) {

		Optional<Order> opt = orderService.findByIdd(orderId);
		OrderDto dto = new OrderDto();

		if (opt.isPresent()) {
			Order entity = opt.get();
			BeanUtils.copyProperties(entity, dto);
			dto.setIsEdit(true);

			model.addAttribute("order", dto);
			return new ModelAndView("admin/orders/addOrEdit", model);
		}

		model.addAttribute("message", "Order is not existed");

		return new ModelAndView("redirect:/admin/orderDetails", model);
	}

	@GetMapping("reset")
	public String createOrder(Model model) {
		OrderDto p = new OrderDto();
		model.addAttribute("order", p);

		return "admin/orders/addOrEdit";

	}

	@PostMapping("saveOrUpdate")
	public ModelAndView saveOrUpdate(ModelMap model, @ModelAttribute("order") OrderDto dto, BindingResult result) {

		if (result.hasErrors()) {
			return new ModelAndView("admin/orders/addOrEdit");
		}
		Order entity = new Order();
		BeanUtils.copyProperties(dto, entity);

		orderService.save(entity);
		model.addAttribute("message", "Order is saved!");
		return new ModelAndView("forward:/admin/orderDetails", model);
	}

	@GetMapping("delete/{orderId}")
	public ModelAndView delete(ModelMap model, @PathVariable("orderId") Long orderId) throws IOException {

		Optional<Order> opt = orderService.findByIdd(orderId);

		try {
			if (opt.isPresent()) {
				// orderDetailService.deleteOrderDetailsByOrderId(orderId);
				orderService.delete(opt.get());
				model.addAttribute("message", "Đơn hàng đã bị xóa!");
			} else {
				model.addAttribute("message", "Order is not Found!");
			}
		} catch (Exception e) {
			model.addAttribute("message", "Vui lòng xóa đơn chi tiết trước khi xóa đơn hàng!");
		}

		return new ModelAndView("forward:/admin/orders/list", model);
	}

	private List<Order> sortOrdersByOrderIdDesc(List<Order> orders) {
		return orders.stream()
				.sorted(Comparator.comparingLong(Order::getOrderId).reversed())
				.collect(Collectors.toList());
	}

	private String listByStatus(Model model, String name, Optional<Integer> page, Optional<Integer> size,
			String status) {
		int currentPage = page.orElse(1);
		int pageSize = size.orElse(5);
		Pageable pageable = PageRequest.of(currentPage - 1, pageSize, Sort.by("orderId"));
		Page<Order> resultPage;

		if (StringUtils.hasText(name)) {
			resultPage = orderService.findByNameContaining(name, pageable);
			model.addAttribute("name", name);
			model.addAttribute("totalSize", orderService.countByNameContaining(name));
		} else {
			resultPage = orderService.findAll(pageable);
			List<Order> list = orderService.findAll();
			model.addAttribute("totalSize", list.size());
		}

		model.addAttribute("orderPage", resultPage);
		model.addAttribute("orders", sortOrdersByOrderIdDesc(odao.findByStatus(status)));
		model.addAttribute("pageNumbers", calculatePageNumbers(resultPage));

		// All size orders
		All_Size_Order(model);
		// get totalsize item
		model.addAttribute("totalSizeStatus_confirmation", odao.findByStatus("Đang chờ xác nhận").size());
		model.addAttribute("totalSizeStatus_transported", odao.findByStatus("Đang vận chuyển").size());
		model.addAttribute("totalSizeStatus_delivered", odao.findByStatus("Đã giao hàng").size());
		model.addAttribute("totalSizeStatus_cancel", odao.findByStatus("Đã hủy").size());

		return "/admin/orders/listByStatus";
	}

	@GetMapping("/confirmation")
	public String listConfirmation(Model model,
			@RequestParam(name = "name", required = false) String name,
			@RequestParam("page") Optional<Integer> page,
			@RequestParam("size") Optional<Integer> size) {
		return listByStatus(model, name, page, size, "Đang chờ xác nhận");
	}

	@GetMapping("/transported")
	public String transported(Model model,
			@RequestParam(name = "name", required = false) String name,
			@RequestParam("page") Optional<Integer> page,
			@RequestParam("size") Optional<Integer> size) {
		return listByStatus(model, name, page, size, "Đang vận chuyển");
	}

	@GetMapping("/delivered")
	public String delivered(Model model,
			@RequestParam(name = "name", required = false) String name,
			@RequestParam("page") Optional<Integer> page,
			@RequestParam("size") Optional<Integer> size) {
		return listByStatus(model, name, page, size, "Đã giao hàng");
	}

	@GetMapping("/cancel")
	public String cancel(Model model,
			@RequestParam(name = "name", required = false) String name,
			@RequestParam("page") Optional<Integer> page,
			@RequestParam("size") Optional<Integer> size) {
		return listByStatus(model, name, page, size, "Đã hủy");
	}

}
