package com.websiteshop.HomeController;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
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

	@GetMapping("/comments/add/{productId}")
	public String addComment(Model model, @PathVariable("productId") Product productId) {
		CommentDto commentDto = new CommentDto();
		commentDto.setProductId(productId);
		model.addAttribute("comment", commentDto);
		return "product/comment";
	}

	@PostMapping("/products/{productId}/comments")
	public String addComment(@PathVariable Long productId,
			@RequestParam String description,
			@AuthenticationPrincipal UserDetails userDetails) {
		// lấy tên người dùng từ đối tượng UserDetails
		String username = userDetails.getUsername();

		// tạo một đối tượng CommentDto mới và thiết lập các trường
		CommentDto commentDto = new CommentDto();
		commentDto.setProductId(new Product());
		commentDto.setUsername(new Account());
		commentDto.setDescription(description);
		Comment entity = new Comment();
		BeanUtils.copyProperties(commentDto, entity);
		commentService.save(entity);
		// lưu bình luận vào cơ sở dữ liệu hoặc thực hiện các xử lý khác

		// chuyển hướng người dùng đến trang hiển thị sản phẩm
		return "redirect:/product/comment/" + productId;
	}

	@PostMapping("saveOrUpdate")
	public String saveOrUpdate(Model model, HttpServletRequest request,
			@ModelAttribute("Comment") CommentDto dto, BindingResult result) {

		try {
			if (result.hasErrors()) {
				return "product/comment";
			}
			String username = request.getRemoteUser();
			dto.setUsername(dto.getUsername());
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