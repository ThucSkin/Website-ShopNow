package com.websiteshop.HomeController;

import java.util.Optional;

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

import com.websiteshop.entity.Account;
import com.websiteshop.entity.Comment;
import com.websiteshop.entity.Product;
import com.websiteshop.model.AccountDto;
import com.websiteshop.model.CommentDto;
import com.websiteshop.service.AccountService;
import com.websiteshop.service.CommentService;

@Controller
@RequestMapping("/comments")
public class CommentController {
	@Autowired
	CommentService commentService;

	@GetMapping("add/{productId}")
	public String addComment(Model model,
			@PathVariable("username") Account username,
			@PathVariable("productId") Product productId) {
		CommentDto cmt = new CommentDto();
		cmt.setProduct(productId);
		cmt.setAccount(username);
		model.addAttribute("Comment", cmt);
		return "product/comment";
	}

	@PostMapping("saveOrUpdate")
	public String saveOrUpdate(Model model, HttpServletRequest request,
			@ModelAttribute("Comment") CommentDto cmt, BindingResult result) {

		try {
			if (result.hasErrors()) {
				return "product/comment";
			}

			AccountDto dto = new AccountDto();
			Account acc = AccountService.getById(dto.setUsername(null));

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