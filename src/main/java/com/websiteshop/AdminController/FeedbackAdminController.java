package com.websiteshop.AdminController;

import java.io.IOException;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.websiteshop.dao.FeedbackDAO;
import com.websiteshop.entity.Account;
import com.websiteshop.entity.Comment;
import com.websiteshop.entity.Feedback;
import com.websiteshop.service.AccountService;
import com.websiteshop.service.FeedbackService;
import com.websiteshop.service.ProductService;

@Controller
@RequestMapping("admin/feedbacks")
public class FeedbackAdminController {
	@Autowired
	FeedbackService feedbackService;

	@Autowired
	FeedbackDAO fdao;

	@Autowired
	AccountService accountService;

	@Autowired
	ProductService productService;

	@GetMapping("")
	public String search(ModelMap model,
			@RequestParam(name = "username", required = false) String username,
			@RequestParam("page") Optional<Integer> page,
			@RequestParam("size") Optional<Integer> size) {
		int currentPage = page.orElse(1);
		int pageSize = size.orElse(5);
		Pageable pageable = PageRequest.of(currentPage - 1, pageSize, Sort.by("feedbackId").descending());
		Page<Feedback> resultPage = null;

		if (username != null && StringUtils.hasText(username)) {
			resultPage = fdao.findByAccountUsername(username, pageable);
			model.addAttribute("username", username);
			long totalSize = fdao.countByAccountUsername(username);
			model.addAttribute("totalSize", totalSize);
		} else {
			resultPage = fdao.findAll(pageable);
			List<Feedback> feedbackList = feedbackService.findAll();
			int totalSize = feedbackList.size();
			model.addAttribute("totalSize", totalSize);
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
			List<Integer> pageNumbers = IntStream.rangeClosed(start, end)
					.boxed()
					.collect(Collectors.toList());
			model.addAttribute("pageNumbers", pageNumbers);
		}

		model.addAttribute("feedbackPage", resultPage);
		return "admin/feedbacks/list";
	}

	@GetMapping("delete/{feedbackId}")
	public ModelAndView delete(ModelMap model, @PathVariable("feedbackId") Long feedbackId) throws IOException {

		Optional<Feedback> opt = feedbackService.findById(feedbackId);

		if (opt.isPresent()) {
			feedbackService.delete(opt.get());
			model.addAttribute("message", "Bình luận đã được xóa!");
		} else {
			model.addAttribute("message", "Không tìm thấy bình luận!");
		}

		return new ModelAndView("forward:/admin/feedbacks", model);
	}
}
