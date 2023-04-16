package com.websiteshop.AdminController;

import java.io.IOException;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.apache.coyote.http11.Http11AprProtocol;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.websiteshop.dao.OrderDAO;
import com.websiteshop.entity.OrderDetail;
import com.websiteshop.model.OrderDetailDto;
import com.websiteshop.model.OrderDto;
import com.websiteshop.model.ProductDto;
import com.websiteshop.service.OrderDetailService;
import com.websiteshop.service.OrderService;
import com.websiteshop.service.ProductService;

@Controller
@RequestMapping("admin/orderDetails")
public class OrderDetailAdminController {
	@Autowired
	OrderService orderService;

	@Autowired
	ProductService productService;

	@Autowired
	OrderDetailService orderDetailService;

	@Autowired
	OrderDAO odao;

	@ModelAttribute("orders")
	public List<OrderDto> getOrders() {
		return orderService.findAll().stream().map(item -> {
			OrderDto dto = new OrderDto();
			BeanUtils.copyProperties(item, dto);
			return dto;
		}).collect(Collectors.toList());
	}

	@ModelAttribute("products")
	public List<ProductDto> getProducts() {
		return productService.findAll().stream().map(item -> {
			ProductDto dto = new ProductDto();
			BeanUtils.copyProperties(item, dto);
			return dto;
		}).collect(Collectors.toList());
	}

	@RequestMapping("")
	public String list(Model model) {
		List<OrderDetail> list = orderDetailService.findAll();
		model.addAttribute("orderDetails", list);
		return "admin/orderdetail/list";
	}

	@GetMapping("add")
	public String add(Model model) {
		OrderDetailDto dto = new OrderDetailDto();
		dto.setIsEdit(false);
		model.addAttribute("orderDetail", dto);
		return "admin/orderdetail/addOrEdit";
	}

	@GetMapping("edit/{orderDetailId}")
	public ModelAndView edit(ModelMap model, @PathVariable("orderDetailId") Long orderDetailId) {

		Optional<OrderDetail> opt = orderDetailService.findById(orderDetailId);
		OrderDetailDto dto = new OrderDetailDto();

		if (opt.isPresent()) {
			OrderDetail entity = opt.get();
			BeanUtils.copyProperties(entity, dto);
			dto.setIsEdit(true);

			model.addAttribute("orderDetail", dto);
			return new ModelAndView("admin/orderdetail/addOrEdit", model);
		}

		model.addAttribute("message", "Đơn hàng chi tiết không tồn tại");

		return new ModelAndView("redirect:/admin/orderDetails", model);
	}

	@GetMapping("reset")
	public String createOrderDetail(Model model) {
		OrderDetailDto p = new OrderDetailDto();
		model.addAttribute("orderDetail", p);

		return "admin/orderdetail/addOrEdit";

	}

	@PostMapping("saveOrUpdate")
	public ModelAndView saveOrUpdate(ModelMap model,
			@ModelAttribute("orderDetail") OrderDetailDto dto, BindingResult result) {

		if (result.hasErrors()) {
			return new ModelAndView("admin/orderdetail/addOrEdit");
		}
		OrderDetail entity = new OrderDetail();
		BeanUtils.copyProperties(dto, entity);

		orderDetailService.save(entity);
		model.addAttribute("message", "Đơn hàng chi tiết đã được lưu!");
		return new ModelAndView("forward:/admin/orderDetails", model);
	}

	@GetMapping("delete/{orderDetailId}")
	public ModelAndView delete(ModelMap model, @PathVariable("orderDetailId") Long orderDetailId) throws IOException {

		Optional<OrderDetail> opt = orderDetailService.findById(orderDetailId);

		if (opt.isPresent()) {
			orderDetailService.deleteById(orderDetailId);
			model.addAttribute("message", "Đã xóa tất cả sản phẩm trong đơn hàng!");
		} else {
			model.addAttribute("message", "Không tìm thấy đơn hàng chi tiết");
		}

		return new ModelAndView("forward:/admin/orderDetails", model);
	}

	@GetMapping("/confirmation")
	public String listConfirmation(Model model) {
		String status = "Đang chờ xác nhận";
		model.addAttribute("orders", odao.findByStatus(status));
		return "admin/orderdetail/listConfirmation";
	}

	@GetMapping("/transported")
	public String listTransported(Model model) {
		String status = "Đang vận chuyển";
		model.addAttribute("orders", odao.findByStatus(status));
		return "admin/orderdetail/listConfirmation";
	}

	@GetMapping("/delivery")
	public String listDelivery(Model model) {
		String status = "Đã hủy";
		model.addAttribute("orders", odao.findByStatus(status));
		return "admin/orderdetail/listConfirmation";
	}

	@GetMapping("/delivered")
	public String listDelivered(Model model) {
		String status = "Đã giao hàng";
		model.addAttribute("orders", odao.findByStatus(status));
		return "admin/orderdetail/listConfirmation";
	}

}
