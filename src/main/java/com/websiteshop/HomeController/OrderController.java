package com.websiteshop.HomeController;

import java.util.Comparator;
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
        model.addAttribute("item", productService.findAll());
        List<Product> items = productService.findAll();
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
    }

    private void All_Size_Order(Model model, HttpServletRequest request) {
        String username = request.getRemoteUser();
        long totalSize = orderService.countByUsername(username);
        model.addAttribute("totalSize", totalSize);
    }

    @GetMapping("/order/checkout")
    public String checkout(Model model) {
        return "order/checkout";
    }

    @GetMapping("/list")
    public String searchOrdersByUsername(ModelMap model, HttpServletRequest request,
            @RequestParam(name = "name", required = false) String name,
            @RequestParam("page") Optional<Integer> page,
            @RequestParam("size") Optional<Integer> size) {

        String username = request.getRemoteUser();
        int currentPage = page.orElse(1);
        int pageSize = size.orElse(5);

        Pageable pageable = PageRequest.of(currentPage - 1, pageSize, Sort.by("orderId").descending());
        Page<Order> resultPage;

        if (StringUtils.hasText(name)) {
            resultPage = orderService.findByNameContaining(name, pageable);
            model.addAttribute("name", name);
            long totalSize = orderService.countByNameContaining(name);
            model.addAttribute("totalSize", totalSize);
        } else {
            resultPage = orderService.findByUsername(username, pageable);
            long totalSize = orderService.countByUsername(username);
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

        model.addAttribute("orderPage", resultPage);
        // get totalsize item
        model.addAttribute("item", productService.findAll());
        List<Product> items = productService.findAll();
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        long totalSize = orderService.countByUsernameAndStatus(username, "Đang chờ xác nhận");
        model.addAttribute("totalSizeStatus_confirmation", totalSize);
        long totalSize2 = orderService.countByUsernameAndStatus(username, "Đang vận chuyển");
        model.addAttribute("totalSizeStatus_transported", totalSize2);
        long totalSize3 = orderService.countByUsernameAndStatus(username, "Đã hủy");
        model.addAttribute("totalSizeStatus_cancel", totalSize3);
        long totalSize4 = orderService.countByUsernameAndStatus(username, "Đã giao hàng");
        model.addAttribute("totalSizeStatus_delivered", totalSize4);
        return "order/history";
    }

    @GetMapping("/detail/{orderId}")
    public String detail(@PathVariable("orderId") Long orderId, Model model) {
        try {
            model.addAttribute("order", orderService.findById(orderId));
            // get totalsize item
            All_item(model);
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
        List<Order> orders = odao.findByStatus(status, username);

        // Sắp xếp danh sách theo giảm dần của orderId
        orders = orders.stream()
                .sorted(Comparator.comparingLong(Order::getOrderId).reversed())
                .collect(Collectors.toList());

        model.addAttribute("orders", orders);
        // get totalsize item
        All_item(model);
        long totalSize = orderService.countByUsernameAndStatus(username, "Đang chờ xác nhận");
        model.addAttribute("totalSizeStatus_confirmation", totalSize);
        long totalSize2 = orderService.countByUsernameAndStatus(username, "Đang vận chuyển");
        model.addAttribute("totalSizeStatus_transported", totalSize2);
        long totalSize3 = orderService.countByUsernameAndStatus(username, "Đã hủy");
        model.addAttribute("totalSizeStatus_cancel", totalSize3);
        long totalSize4 = orderService.countByUsernameAndStatus(username, "Đã giao hàng");
        model.addAttribute("totalSizeStatus_delivered", totalSize4);
        All_Size_Order(model, request);
        return "order/historyByStatus";
    }

    @GetMapping("/transported")
    public String listTransported(Model model,
            HttpServletRequest request) {

        String status = "Đang vận chuyển";
        String username = request.getRemoteUser();
        List<Order> orders = odao.findByStatus(status, username);

        // Sắp xếp danh sách theo giảm dần của orderId
        orders = orders.stream()
                .sorted(Comparator.comparingLong(Order::getOrderId).reversed())
                .collect(Collectors.toList());

        model.addAttribute("orders", orders);
        // get totalsize item
        All_item(model);
        long totalSize = orderService.countByUsernameAndStatus(username, "Đang chờ xác nhận");
        model.addAttribute("totalSizeStatus_confirmation", totalSize);
        long totalSize2 = orderService.countByUsernameAndStatus(username, "Đang vận chuyển");
        model.addAttribute("totalSizeStatus_transported", totalSize2);
        long totalSize3 = orderService.countByUsernameAndStatus(username, "Đã hủy");
        model.addAttribute("totalSizeStatus_cancel", totalSize3);
        long totalSize4 = orderService.countByUsernameAndStatus(username, "Đã giao hàng");
        model.addAttribute("totalSizeStatus_delivered", totalSize4);
        All_Size_Order(model, request);
        return "order/historyByStatus";
    }

    @GetMapping("/cancel")
    public String listDelivery(Model model, HttpServletRequest request) {
        String status = "Đã hủy";
        String username = request.getRemoteUser();
        List<Order> orders = odao.findByStatus(status, username);

        // Sắp xếp danh sách theo giảm dần của orderId
        orders = orders.stream()
                .sorted(Comparator.comparingLong(Order::getOrderId).reversed())
                .collect(Collectors.toList());

        model.addAttribute("orders", orders);
        // get totalsize item
        All_item(model);
        long totalSize = orderService.countByUsernameAndStatus(username, "Đang chờ xác nhận");
        model.addAttribute("totalSizeStatus_confirmation", totalSize);
        long totalSize2 = orderService.countByUsernameAndStatus(username, "Đang vận chuyển");
        model.addAttribute("totalSizeStatus_transported", totalSize2);
        long totalSize3 = orderService.countByUsernameAndStatus(username, "Đã hủy");
        model.addAttribute("totalSizeStatus_cancel", totalSize3);
        long totalSize4 = orderService.countByUsernameAndStatus(username, "Đã giao hàng");
        model.addAttribute("totalSizeStatus_delivered", totalSize4);
        All_Size_Order(model, request);
        return "order/historyByStatus";
    }

    @GetMapping("/delivered")
    public String listEvaluate(Model model, HttpServletRequest request) {
        String status = "Đã giao hàng";
        String username = request.getRemoteUser();
        List<Order> orders = odao.findByStatus(status, username);

        // Sắp xếp danh sách theo giảm dần của orderId
        orders = orders.stream()
                .sorted(Comparator.comparingLong(Order::getOrderId).reversed())
                .collect(Collectors.toList());
        model.addAttribute("orders", orders);

        // get totalsize item
        All_item(model);
        long totalSize = orderService.countByUsernameAndStatus(username, "Đang chờ xác nhận");
        model.addAttribute("totalSizeStatus_confirmation", totalSize);
        long totalSize2 = orderService.countByUsernameAndStatus(username, "Đang vận chuyển");
        model.addAttribute("totalSizeStatus_transported", totalSize2);
        long totalSize3 = orderService.countByUsernameAndStatus(username, "Đã hủy");
        model.addAttribute("totalSizeStatus_cancel", totalSize3);
        long totalSize4 = orderService.countByUsernameAndStatus(username, "Đã giao hàng");
        model.addAttribute("totalSizeStatus_delivered", totalSize4);
        All_Size_Order(model, request);
        return "order/historyByStatus";
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
        // get totalsize item
        All_item(model);
        return "order/history";
    }

}
