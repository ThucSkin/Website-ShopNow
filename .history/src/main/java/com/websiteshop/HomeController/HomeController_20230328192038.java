package com.websiteshop.HomeController;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.websiteshop.entity.Product;
import com.websiteshop.service.ProductService;

@Controller
public class HomeController {
	@Autowired
	ProductService productService;

	// @GetMapping("/")
	// public String list(ModelMap model,
	// @RequestParam(name = "name", required = false) String name,
	// @RequestParam("page") Optional<Integer> page,
	// @RequestParam("size") Optional<Integer> size) {
	// int currentPage = page.orElse(1);
	// int pageSize = size.orElse(18);
	// Pageable pageable = PageRequest.of(currentPage - 1, pageSize);
	// Page<Product> resultPage = null;

	// if (StringUtils.hasText(name)) {
	// resultPage = productService.findByNameContaining(name, pageable);
	// model.addAttribute("name", name);
	// } else {
	// resultPage = productService.findAll(pageable);
	// }

	// int totalPages = resultPage.getTotalPages();
	// if (totalPages > 0) {
	// int start = Math.max(1, currentPage - 2);
	// int end = Math.min(currentPage + 2, totalPages);

	// if (totalPages > 3) {
	// if (end == totalPages)
	// start = end - 4;
	// else if (start == 1)
	// end = start + 4;
	// }
	// List<Integer> pageNumbers = IntStream.rangeClosed(start, end)
	// .boxed()
	// .collect(Collectors.toList());
	// model.addAttribute("pageNumbers", pageNumbers);
	// }

	// model.addAttribute("productPage", resultPage);
	// return "product/list";
	// }

	@RequestMapping("/help")
	public String help(Model model) {
		return "help/help";
	}

	@RequestMapping("/home404")
	public String f404(Model model) {
		return "admin/dist/404_home";
	}

}
