package com.websiteshop.HomeController;

import java.util.List;

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
import com.websiteshop.service.AccountService;
import com.websiteshop.service.CommentService;
import com.websiteshop.service.ProductService;

@Controller
public class CommentController {
	@Autowired
	CommentService commentService;

	@Autowired
	AccountService accountService;

	@Autowired
	ProductService productService;

	@GetMapping("/comments/add/{productId}")
	public String addComment(Model model, @PathVariable("productId") Product productId) {
		CommentDto commentDto = new CommentDto();
		commentDto.setProductId(productId);
		model.addAttribute("comment", commentDto);
		return "product/comment";
	}

	@PostMapping("/products/saveOrUpdate")
	public String addComment(
			@PathVariable Long productId,
			@ModelAttribute("Comment") CommentDto commentDto,
			@AuthenticationPrincipal UserDetails userDetails) {
		// Lấy tên người dùng từ đối tượng UserDetails
		String username = userDetails.getUsername();

		// Tìm đối tượng Account tương ứng với tên người dùng
		Account account = accountService.findByUsername(username);

		// Lấy sản phẩm từ cơ sở dữ liệu
		Product product = productService.getById(productId);

		// Thiết lập các thuộc tính cho đối tượng CommentDto
		commentDto.setUsername(account);
		commentDto.setProductId(product);

		// Tạo đối tượng Comment và lưu vào cơ sở dữ liệu
		Comment comment = new Comment();
		BeanUtils.copyProperties(commentDto, comment);
		commentService.save(comment);

		// Chuyển hướng người dùng đến trang hiển thị sản phẩm
		return "redirect:/products/" + productId;
	}

}