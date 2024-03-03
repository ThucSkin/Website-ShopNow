package com.websiteshop.AdminController;

import java.io.IOException;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import javax.validation.Valid;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.data.domain.Sort;

import com.websiteshop.entity.Account;
import com.websiteshop.entity.Category;
import com.websiteshop.entity.Order;
import com.websiteshop.entity.Product;
import com.websiteshop.model.CategoryDto;
import com.websiteshop.model.ProductDto;
import com.websiteshop.service.CategoryService;
import com.websiteshop.service.ProductService;
import com.websiteshop.service.StorageService;

@Controller
@RequestMapping("/admin/product")
public class ProductAdminController {
    @Autowired
    ProductService productService;

    @Autowired
    CategoryService categoryService;

    @Autowired
    StorageService storageService;

    @ModelAttribute("categories")
    public List<CategoryDto> getCategories() {
        return categoryService.findAll().stream().map(item -> {
            CategoryDto dto = new CategoryDto();
            BeanUtils.copyProperties(item, dto);
            return dto;
        }).collect(Collectors.toList());
    }

    @GetMapping("list")
    public String search(ModelMap model,
            @RequestParam(name = "name", required = false) String name,
            @RequestParam("page") Optional<Integer> page,
            @RequestParam("size") Optional<Integer> size) {
        int currentPage = page.orElse(1);
        int pageSize = size.orElse(5);

        Pageable pageable = PageRequest.of(currentPage - 1, pageSize, Sort.by("productId").descending());
        Page<Product> resultPage = null;

        if (StringUtils.hasText(name)) {
            resultPage = productService.findByNameContaining(name, pageable);
            model.addAttribute("name", name);
            long totalSize = productService.countByNameContaining(name);
            model.addAttribute("totalSize", totalSize);
        } else {
            resultPage = productService.findAll(pageable);
            List<Product> resultList = productService.findAll();

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

        model.addAttribute("productPage", resultPage);
        return "admin/product/list";
    }

    @RequestMapping("")
    public String list_2(ModelMap model, @RequestParam("cid") Optional<Long> cid) {
        if (cid.isPresent()) {
            List<Product> list = productService.findByCategoryId(cid.get());
            model.addAttribute("products", list);
        } else {
            List<Product> list = productService.findAll();
            model.addAttribute("products", list);
        }

        return "admin/product/list";
    }

    @GetMapping("add")
    public String add(Model model) {
        ProductDto dto = new ProductDto();
        dto.setIsEdit(false);
        model.addAttribute("product", dto);
        return "admin/product/addOrEdit";
    }

    @GetMapping("edit/{productId}")
    public ModelAndView edit(ModelMap model,
            @PathVariable("productId") Long productId) {
        Optional<Product> opt = productService.findById(productId);
        ProductDto dto = new ProductDto();
        if (opt.isPresent()) {
            Product entity = opt.get();
            BeanUtils.copyProperties(entity, dto);
            dto.setIsEdit(true);
            dto.setCategoryId(entity.getCategory().getCategoryId());
            model.addAttribute("product", dto);
            return new ModelAndView("admin/product/addOrEdit", model);
        } else if (!opt.isPresent()) {
            return new ModelAndView("/admin/dist/404", model);
        }

        return new ModelAndView("redirect:/admin/product/list", model);
    }

    @PostMapping("saveOrUpdate")
    public ModelAndView saveOrUpdate(ModelMap model,
            @ModelAttribute("product") ProductDto dto,
            BindingResult result) {

        Product entity = new Product();
        BeanUtils.copyProperties(dto, entity);

        Category category = new Category();
        category.setCategoryId(dto.getCategoryId());
        entity.setCategory(category);
        try {
            if (!dto.getImage1File().isEmpty()) {
                entity.setImage1(storageService.getStoredFilename(dto.getImage1File(),
                        dto.getImage1File().getOriginalFilename()));
                storageService.store(dto.getImage1File(), entity.getImage1());
            }
            if (!dto.getImage2File().isEmpty()) {
                entity.setImage2(storageService.getStoredFilename(dto.getImage2File(),
                        dto.getImage2File().getOriginalFilename()));
                storageService.store(dto.getImage2File(), entity.getImage2());
            }
            if (!dto.getImage3File().isEmpty()) {
                entity.setImage3(storageService.getStoredFilename(dto.getImage3File(),
                        dto.getImage3File().getOriginalFilename()));
                storageService.store(dto.getImage3File(), entity.getImage3());
            }
            if (!dto.getImage4File().isEmpty()) {
                entity.setImage4(storageService.getStoredFilename(dto.getImage4File(),
                        dto.getImage4File().getOriginalFilename()));
                storageService.store(dto.getImage4File(), entity.getImage4());
            }
            productService.save(entity);
            model.addAttribute("message", "Successed!");
        } catch (Exception e) {
            model.addAttribute("message", "Vui lòng thêm hình ảnh cho sản phẩm!");
        }

        return new ModelAndView("redirect:/admin/product/list", model);
    }

    @GetMapping("/images/{filename:.+}")
    @ResponseBody
    public ResponseEntity<Resource> serveFile(@PathVariable String filename) {
        Resource file = storageService.loadAsResource(filename);

        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" +
                        file.getFilename() + "\"")
                .body(file);
    }

    // @SuppressWarnings("deprecation")
    @GetMapping("delete/{productId}")
    public ModelAndView delete(ModelMap model, @PathVariable("productId") Long productId) throws IOException {

        try {
            Optional<Product> opt = productService.findById(productId);

            if (opt.isPresent()) {
                // if (!StringUtils.isEmpty(opt.get().getImage1())) {
                // storageService.delete(opt.get().getImage1());
                // }
                productService.delete(opt.get());
                model.addAttribute("message", "Sản phẩm đã được xóa!");
            }
        } catch (Exception e) {
            return new ModelAndView("forward:/admin/product/list", model);
        }

        return new ModelAndView("forward:/admin/product/list", model);
    }

}