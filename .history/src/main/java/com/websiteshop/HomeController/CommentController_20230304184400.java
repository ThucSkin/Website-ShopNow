package com.websiteshop.HomeController;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.websiteshop.entity.Account;
import com.websiteshop.entity.Comment;
import com.websiteshop.entity.Product;
import com.websiteshop.model.CommentDto;
import com.websiteshop.service.CommentService;

@Controller
@RequestMapping("/comments")
public class CommentController {
	@Autowired
	CommentService commentService;

	@GetMapping("add/{productId}")
	public String addComment(Model model, @PathVariable("productId") Product productId) {
		CommentDto dto = new CommentDto();
		dto.setProduct(productId);
		model.addAttribute("Comment", dto);
		return "product/comment";
	}

	@PostMapping("/comments")
	public String addComment(
			@RequestParam("productId") Long productId,
			@RequestParam("username") String username,
			@RequestParam("description") String description) {
		// tạo một đối tượng CommentDto mới và thiết lập các trường
		CommentDto cmt = new CommentDto();
		cmt.setProduct(new Product(productId));
		cmt.setAccount(new Account(username));
		cmt.setDescription(description);

		// lưu bình luận vào cơ sở dữ liệu hoặc thực hiện các xử lý khác
		commentService.addComment(cmt);

		// chuyển hướng người dùng đến trang hiển thị sản phẩm
		return "redirect:/products/" + productId;
	}

	@PostMapping("saveOrUpdate")
	public String saveOrUpdate(Model model, HttpServletRequest request,
			@ModelAttribute("Comment") CommentDto dto, BindingResult result) {

		try {
			if (result.hasErrors()) {
				return "product/comment";
			}
			String username = request.getRemoteUser();
			dto.setAccount(dto.getAccount());
			Comment entity = new Comment();
			BeanUtils.copyProperties(dto, entity);
			commentService.save(entity);
			model.addAttribute("message", "Cảm ơn bạn đã đánh giá sản phẩm.");
			return "product/comment";
		} catch (Exception e) {
			model.addAttribute("message", "Bạn cần phải đăng nhập trước khi bình luận.");
			return "product/comment";
		}
	}
}