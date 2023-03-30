package com.websiteshop.HomeController;

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
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.websiteshop.dao.CategoryDAO;
import com.websiteshop.dao.ProductDAO;
import com.websiteshop.entity.Product;
import com.websiteshop.service.ProductService;

@Controller
public class ProductController {
    @Autowired
    ProductService productService;
    @Autowired
    CategoryDAO dao;
    @Autowired
    ProductDAO pdao;

    @GetMapping("/")
    public String home(ModelMap model,
            @RequestParam(name = "name", required = false) String name,
            @RequestParam("page") Optional<Integer> page,
            @RequestParam("size") Optional<Integer> size) {
        int currentPage = page.orElse(1);
        int pageSize = size.orElse(18);
        Pageable pageable = PageRequest.of(currentPage - 1, pageSize);
        Page<Product> resultPage = null;

        if (StringUtils.hasText(name)) {
            resultPage = productService.findByNameContaining(name, pageable);
            model.addAttribute("name", name);
        } else {
            resultPage = productService.findAll(pageable);
        }

        int totalPages = resultPage.getTotalPages();
        if (totalPages > 0) {
            int start = Math.max(1, currentPage - 2);
            int end = Math.min(currentPage + 2, totalPages);

            if (totalPages > 3) {
                if (end == totalPages)
                    start = end - 4;
                else if (start == 1)
                    end = start + 4;
            }
            List<Integer> pageNumbers = IntStream.rangeClosed(start, end)
                    .boxed()
                    .collect(Collectors.toList());
            model.addAttribute("pageNumbers", pageNumbers);
        }

        model.addAttribute("productPage", resultPage);
        return "product/list";
    }

    @RequestMapping("/product/list")
    public String list(Model model, @RequestParam("cid") Optional<Long> cid) {

        if (!cid.isPresent()) {
            List<Product> list = productService.findByCategoryId(cid.get());
            model.addAttribute("item", list);
            return "product/list_search";
        }
        return "redirect:/home404";
    }

    @RequestMapping("/product/detail/{productId}")
    public String detail(Model model, @PathVariable("productId") Long id) {
        try {
            Product item = productService.findById(id).get();
            model.addAttribute("item", item);
            model.addAttribute("cates", dao.findAll());
        } catch (Exception e) {
            return "redirect:/home404";
        }

        return "product/detail";
    }

    @GetMapping("/product/search")
    public String search(ModelMap model, @RequestParam(name = "name", required = false) String name) {
        List<Product> list = null;

        if (StringUtils.hasText(name)) {
            list = productService.findByNameContaining(name);
        } else {
            list = productService.findAll();
        }
        model.addAttribute("items", list);
        return "product/list";
    }

    @GetMapping("/view/page")
    public String viewPage(Model model,
            @RequestParam(name = "name", required = false) String name,
            @RequestParam("page") Optional<Integer> page) {

        Pageable pageable = PageRequest.of(page.orElse(0), 30, Sort.by("name"));
        Page<Product> pageProduct = null;
        if (StringUtils.hasText(name)) {
            pageProduct = productService.findByNameContaining(name, pageable);
        } else {
            pageProduct = productService.findAll(pageable);
        }
        model.addAttribute("items", pageProduct);
        return "product/list";
    }

    @GetMapping("/search/paginated")
    public String searchPaginated(ModelMap model,
            @RequestParam(name = "name", required = false) String name,
            @RequestParam("page") Optional<Integer> page,
            @RequestParam("size") Optional<Integer> size) {

        int currentPage = page.orElse(1);
        int pageSize = size.orElse(12);
        Pageable pageable = PageRequest.of(currentPage, pageSize, Sort.by("name"));
        Page<Product> resultPage = null;

        if (StringUtils.hasText(name)) {
            resultPage = productService.findByNameContaining(name, pageable);
            model.addAttribute("name", name);
        } else {
            resultPage = productService.findAll(pageable);
        }

        int totalPages = resultPage.getTotalPages();
        if (totalPages > 0) {
            int start = Math.max(1, currentPage - 2);
            int end = Math.min(currentPage + 2, totalPages);

            if (totalPages > 12) {
                if (end == totalPages)
                    start = end - 12;
                else if (start == 1)
                    end = start + 12;
            }
            List<Integer> pageNumbers = IntStream.rangeClosed(start, end)
                    .boxed()
                    .collect(Collectors.toList());

            model.addAttribute("pageNumbers", pageNumbers);
        }
        model.addAttribute("productPage", resultPage);

        return "product/list";
    }

    @RequestMapping("/product/list/hotsale")
    public String hotSale(Model model) {
        String hot = "hot-icon.gif";
        model.addAttribute("item", pdao.findByHotSale(hot));
        return "product/list_search";
    }

    @RequestMapping("/price/duoi-2-trieu")
    public String price1(Model model) {
        model.addAttribute("item", pdao.findByUnitPrice(0, 2000000));
        return "product/list_search";
    }

    @RequestMapping("/price/tu-2-4-trieu")
    public String price2(Model model) {
        model.addAttribute("item", pdao.findByUnitPrice(2000000, 4000000));
        return "product/list_search";
    }

    @RequestMapping("/price/tu-4-7-trieu")
    public String price3(Model model) {
        model.addAttribute("item", pdao.findByUnitPrice(4000000, 7000000));
        return "product/list_search";
    }

    @RequestMapping("/price/tu-7-13-trieu")
    public String price4(Model model) {
        model.addAttribute("item", pdao.findByUnitPrice(7000000, 13000000));
        return "product/list_search";
    }

    @RequestMapping("/price/tu-13-20-trieu")
    public String price6(Model model) {
        model.addAttribute("item", pdao.findByUnitPrice(13000000, 20000000));
        return "product/list_search";
    }

    @RequestMapping("/price/tren-20-trieu")
    public String price5(Model model) {
        model.addAttribute("item", pdao.findByUnitPrice(20000000, 500000000));
        return "product/list_search";
    }

    @RequestMapping("/dtdd-iphone")
    public String iphone(Model model) {
        model.addAttribute("item", pdao.findByTheFirm("iphone"));
        return "product/list_search";
    }

    @RequestMapping("/dtdd-samsum")
    public String samsum(Model model) {
        model.addAttribute("item", pdao.findByTheFirm("samsum"));
        return "product/list_search";
    }

    @RequestMapping("/dtdd-oppo")
    public String oppo(Model model) {
        model.addAttribute("item", pdao.findByTheFirm("oppo"));
        return "product/list_search";
    }

    @RequestMapping("/dtdd-xiaomi")
    public String xiaomi(Model model) {
        model.addAttribute("item", pdao.findByTheFirm("xiaomi"));
        return "product/list_search";
    }

    @RequestMapping("/dtdd-nokia")
    public String nokia(Model model) {
        model.addAttribute("item", pdao.findByTheFirm("nokia"));
        return "product/list_search";
    }

    @RequestMapping("/dtdd-realme")
    public String realme(Model model) {
        model.addAttribute("item", pdao.findByTheFirm("realme"));
        return "product/list_search";
    }

    @RequestMapping("/dtdd-ram-2-GB")
    public String ram2gb(Model model) {
        model.addAttribute("item", pdao.findByRAM("/ 2GB"));
        return "product/list_search";
    }

    @RequestMapping("/dtdd-ram-3-GB")
    public String ram3gb(Model model) {
        model.addAttribute("item", pdao.findByRAM("/ 3GB"));
        return "product/list_search";
    }

    @RequestMapping("/dtdd-ram-4-GB")
    public String ram4gb(Model model) {
        model.addAttribute("item", pdao.findByRAM("/ 4GB"));
        return "product/list_search";
    }

    @RequestMapping("/dtdd-ram-6-GB")
    public String ram6gb(Model model) {
        model.addAttribute("item", pdao.findByRAM("/ 6GB"));
        return "product/list_search";
    }

    @RequestMapping("/dtdd-ram-8-GB")
    public String ram8gb(Model model) {
        model.addAttribute("item", pdao.findByRAM("/ 8GB"));
        return "product/list_search";
    }

    @RequestMapping("/dtdd-ram-12-GB")
    public String ram12gb(Model model) {
        model.addAttribute("item", pdao.findByRAM("/ 12GB"));
        return "product/list_search";
    }
}
