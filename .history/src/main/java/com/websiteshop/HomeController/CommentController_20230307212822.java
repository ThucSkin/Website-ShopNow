package com.websiteshop.HomeController;

import java.util.List;
import java.util.Optional;

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
@RequestMapping("/comments")
public class CommentController {
	@Autowired
	CommentService commentService;

	@Autowired
	ProductService productService;

	@Autowired
	AccountService accountService;

	@GetMapping("add/{productId}")
	public String addComment(Model model, @PathVariable("productId") Product name) {
		CommentDto dto = new CommentDto();
		dto.setProduct(name);
		model.addAttribute("Comment", dto);
		return "product/comment";
	}

	@PostMapping("saveOrUpdate")
	public String saveOrUpdate(Model model, HttpServletRequest request,
			@ModelAttribute("Comment") CommentDto dto, BindingResult result) {

		try {
			if (result.hasErrors()) {
				return "product/comment";
			}
			String username = request.getRemoteUser();
			Account account = accountService.findByUsername(username);
			dto.setAccount(account);
			Comment entity = new Comment();
			BeanUtils.copyProperties(dto, entity);
			commentService.save(entity);
			model.addAttribute("message", "Cảm ơn bạn đã đánh giá sản phẩm.");
			return "product/comment";
		} catch (Exception e) {
			model.addAttribute("message", "Bình luận theo mã!");
			return "product/comment";
		}
	}
}
