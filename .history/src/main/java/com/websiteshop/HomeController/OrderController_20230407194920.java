package com.websiteshop.HomeController;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import javax.servlet.http.HttpServletRequest;
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

import com.websiteshop.dao.OrderDAO;
import com.websiteshop.entity.Account;
import com.websiteshop.entity.Order;
import com.websiteshop.entity.Product;
import com.websiteshop.service.OrderDetailService;
import com.websiteshop.service.OrderService;
import com.websiteshop.service.ProductService;

@Controller
@RequestMapping("orderHistory")
public class OrderController {
    @Autowired
    OrderService orderService;

    @Autowired
    OrderDetailService orderDetailService;

    @Autowired
    OrderDAO odao;

    @Autowired
    ProductService productService;

    private void All_item(Model model) {
        List<Product> items = productService.findAll();
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
    }

    @GetMapping("/order/checkout")
    public String checkout(Model model) {
        model.addAttribute("item", productService.findAll());
        // get totalsize item
        All_item(model);
        return "order/checkout";
    }

    @GetMapping("/list")
    public String list(Model model, HttpServletRequest request,
            @RequestParam(name = "name", required = false) String name,
            @RequestParam("page") Optional<Integer> page) {
        String username = request.getRemoteUser();
        Pageable pageable = PageRequest.of(page.orElse(0), 11, Sort.by("name"));
        model.addAttribute("orders", orderService.findByUsername(username, pageable));
        return "order/history";
    }

    @GetMapping("/detail/{orderId}")
    public String detail(@PathVariable("orderId") Long orderId, Model model) {
        try {
            model.addAttribute("order", orderService.findById(orderId));
            model.addAttribute("item", productService.findAll());
            // get totalsize item
            List<Product> items = productService.findAll();
            int totalItems = items.size();
            model.addAttribute("totalItems", totalItems);
            return "order/detail";
        } catch (Exception e) {
            return "redirect:/home404";
        }

    }

    @GetMapping("/confirmation")
    public String listConfirmation(Model model, HttpServletRequest request,
            @RequestParam("page") Optional<Integer> page) {
        String status = "Đang chờ xác nhận";
        String username = request.getRemoteUser();

        model.addAttribute("orders", odao.findByStatus(status, username));
        model.addAttribute("item", productService.findAll());
        // get totalsize item

        return "order/history";
    }

    @GetMapping("/transported")
    public String listTransported(Model model,
            HttpServletRequest request) {
        String username = request.getRemoteUser();
        String status = "Đang vận chuyển";
        model.addAttribute("orders", odao.findByStatus(status, username));
        model.addAttribute("item", productService.findAll());
        // get totalsize item
        List<Product> items = productService.findAll();
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        return "orderHistory/list";
    }

    @GetMapping("/cancel")
    public String listDelivery(Model model, HttpServletRequest request) {
        String status = "Đã hủy";
        String username = request.getRemoteUser();
        model.addAttribute("orders", odao.findByStatus(status, username));
        model.addAttribute("item", productService.findAll());
        // get totalsize item
        List<Product> items = productService.findAll();
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        return "orderHistory/list";
    }

    @GetMapping("/delivered")
    public String listEvaluate(Model model, HttpServletRequest request) {
        String status = "Đã giao hàng";
        String username = request.getRemoteUser();
        model.addAttribute("orders", odao.findByStatus(status, username));
        model.addAttribute("item", productService.findAll());
        // get totalsize item
        List<Product> items = productService.findAll();
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        return "orderHistory/list";
    }

    @GetMapping("/view/page2")
    public String search(ModelMap model, HttpServletRequest request,
            @RequestParam(name = "name", required = false) String name,
            @RequestParam("page") Optional<Integer> page,
            @RequestParam("size") Optional<Integer> size) {
        int currentPage = page.orElse(1);
        int pageSize = size.orElse(5);
        Pageable pageable = PageRequest.of(currentPage - 1, pageSize);
        Page<Order> resultPage = null;

        if (StringUtils.hasText(name)) {
            // resultPage = orderService.findByFullnameContaining(name, pageable);
            model.addAttribute("username", name);
        } else {
            String username = request.getRemoteUser();
            resultPage = orderService.findByUsername(username, pageable);
            // resultPage = accountService.findAll(pageable);
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

        model.addAttribute("orderPage", resultPage);
        return "orderHistory/list";
    }

    @GetMapping("/view/page")
    public String viewPage(Model model, HttpServletRequest request,
            @RequestParam(name = "name", required = false) String name,
            @RequestParam("page") Optional<Integer> page) {

        Pageable pageable = PageRequest.of(page.orElse(0), 100, Sort.by("name"));
        Page<Order> pageProduct = null;
        String username = request.getRemoteUser();

        pageProduct = orderService.findByUsername(username, pageable);
        model.addAttribute("orders", pageProduct);
        model.addAttribute("item", productService.findAll());
        // get totalsize item
        List<Product> items = productService.findAll();
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        return "order/history";
    }
}
