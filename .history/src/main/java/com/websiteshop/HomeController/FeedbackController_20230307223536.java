package com.websiteshop.HomeController;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.websiteshop.entity.Account;
import com.websiteshop.entity.Feedback;
import com.websiteshop.model.FeedbackDto;
import com.websiteshop.service.AccountService;
import com.websiteshop.service.FeedbackService;

@Controller
public class FeedbackController {
	@Autowired
	FeedbackService feedbackService;

	@Autowired
	AccountService accountService;

	@RequestMapping("user/feedback/{username}")
	public String add(Model model, @PathVariable("username") Account username) {
		FeedbackDto dto = new FeedbackDto();
		dto.setAccount(username);
		model.addAttribute("Feedback", dto);
		return "user/feedback";
	}

	@PostMapping("user/feedback/save")
	public String save(ModelMap model,
			@ModelAttribute("feedback") FeedbackDto dto, HttpServletRequest request, BindingResult result) {

		try {
			if (result.hasErrors()) {
				return "user/feedback";
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
			// TODO: handle exception
		}
		BeanUtils.copyProperties(dto, entity);

		feedbackService.save(entity);
		model.addAttribute("message", "Cảm ơn bạn đã góp ý!");
		return "user/feedback";
	}
}
