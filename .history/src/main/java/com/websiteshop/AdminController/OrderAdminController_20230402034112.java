package com.websiteshop.AdminController;

import java.io.IOException;
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
import com.websiteshop.model.listStatusDao;
import com.websiteshop.entity.Order;
import com.websiteshop.model.AccountDto;
import com.websiteshop.model.OrderDto;
import com.websiteshop.model.listStatus;
import com.websiteshop.service.AccountService;
import com.websiteshop.service.OrderDetailService;
import com.websiteshop.service.OrderService;

@Controller
@RequestMapping("admin/orders")
public class OrderAdminController {
	@Autowired
	OrderService orderService;

	@Autowired
	AccountService accountService;

	@Autowired
	OrderDetailService orderDetailService;

	listStatusDao ls = new listStatusDao();

	@ModelAttribute("list_status")
	public List<listStatus> getlistStatus() {
		return ls.getAll().stream().map(item -> {
			listStatus dto = new listStatus();
			BeanUtils.copyProperties(item, dto);
			return dto;
		}).collect(Collectors.toList());
	}

	@PostMapping("updateStatus")
	public ModelAndView updateStatusOrder(ModelMap model,
			@RequestParam("orderId") Long orderId, @ModelAttribute("LISTSTATUS") listStatus status,
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
	public String search(ModelMap model, @RequestParam(name = "name", required = false) String name,
			@RequestParam("page") Optional<Integer> page, @RequestParam("size") Optional<Integer> size) {

		model.addAttribute("LISTSTATUS", new listStatus());
		int currentPage = page.orElse(1);
		int pageSize = size.orElse(5);
		Pageable pageable = PageRequest.of(currentPage - 1, pageSize, Sort.by("name"));
		Page<Order> resultPage = null;

		if (StringUtils.hasText(name)) {
			resultPage = orderService.findByNameContaining(name, pageable);
			model.addAttribute("name", name);
		} else {
			resultPage = orderService.findAll(pageable);
		}

		int totalPages = resultPage.getTotalPages();
		if (totalPages > 0) {
			int start = Math.max(1, currentPage - 2);
			int end = Math.min(currentPage + 2, totalPages);

			if (totalPages > 5) {
				if (end == totalPages)
					start = end - 5;
				else if (start == 1)
					end = start + 5;
			}
			List<Integer> pageNumbers = IntStream.rangeClosed(start, end).boxed().collect(Collectors.toList());
			model.addAttribute("pageNumbers", pageNumbers);
		}

		model.addAttribute("orderPage", resultPage);
		return "admin/orders/list";
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

		return new ModelAndView("redirect:/admin/orders", model);
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
		return new ModelAndView("forward:/admin/orders", model);
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

}
