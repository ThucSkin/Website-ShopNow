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
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.websiteshop.entity.Category;
import com.websiteshop.model.CategoryDto;
import com.websiteshop.service.CategoryService;

@Controller
@RequestMapping("admin/categories")
public class CategoryAdminController {

	@Autowired
	CategoryService categoryService;

	@RequestMapping("")
	public String search(ModelMap model,
			@RequestParam(name = "name", required = false) String name,
			@RequestParam("page") Optional<Integer> page,
			@RequestParam("size") Optional<Integer> size) {
		int currentPage = page.orElse(1);
		int pageSize = size.orElse(5);
		Pageable pageable = PageRequest.of(currentPage - 1, pageSize, Sort.by("categoryId").descending());
		Page<Category> resultPage = null;

		if (StringUtils.hasText(name)) {
			resultPage = categoryService.findByNameContaining(name, pageable);
			model.addAttribute("name", name);
			long totalSize = categoryService.countByNameContaining(name);
			model.addAttribute("totalSize", totalSize);
		} else {
			resultPage = categoryService.findAll(pageable);
			List<Category> resultList = categoryService.findAll();
			int totalSize = resultList.size();
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

		model.addAttribute("categoryPage", resultPage);
		return "admin/category/list";
	}

	@GetMapping("add")
	public String add(Model model) {
		CategoryDto dto = new CategoryDto();
		dto.setIsEdit(false);
		model.addAttribute("category", dto);
		return "admin/category/addOrEdit";
	}

	@GetMapping("reset")
	public String reset(Model model) {
		CategoryDto dto = new CategoryDto();
		model.addAttribute("category", dto);

		return "admin/category/addOrEdit";

	}

	@PostMapping("saveOrUpdate")
	public ModelAndView saveOrUpdate(ModelMap model, @ModelAttribute("category") CategoryDto dto,
			BindingResult result) {

		Category entity = new Category();
		BeanUtils.copyProperties(dto, entity);

		try {
			categoryService.save(entity);
			model.addAttribute("message", "Loại hàng đã được lưu");
		} catch (Exception e) {
			model.addAttribute("message", "Invalid category");
		}

		return new ModelAndView("forward:/admin/categories", model);
	}

	@GetMapping("edit/{categoryId}")
	public ModelAndView edit(ModelMap model, @PathVariable("categoryId") Long categoryId) {

		Optional<Category> opt = categoryService.findById(categoryId);
		CategoryDto dto = new CategoryDto();

		if (opt.isPresent()) {
			Category entity = opt.get();
			BeanUtils.copyProperties(entity, dto);
			dto.setIsEdit(true);

			model.addAttribute("category", dto);
			return new ModelAndView("admin/category/addOrEdit", model);
		}

		model.addAttribute("message", "Loại hàng không tồn tại");

		return new ModelAndView("forward:/admin/categories", model);
	}

	@GetMapping("delete/{categoryId}")
	public ModelAndView delete(ModelMap model, @PathVariable("categoryId") Long categoryId) throws IOException {

		try {
			categoryService.deleteById(categoryId);
			model.addAttribute("message", "Loại hàng đã được xóa");
		} catch (Exception e) {
			model.addAttribute("message", "Không thể xóa loại hàng có chứa sản phẩm!");
		}

		return new ModelAndView("forward:/admin/categories", model);
	}
}
