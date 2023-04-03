package com.websiteshop.HomeController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.websiteshop.dao.CategoryDAO;
import com.websiteshop.entity.Product;
import com.websiteshop.service.ProductService;

@Controller
public class ShoppingCartController {
    @Autowired
    CategoryDAO dao;
    @Autowired
    ProductService productService;

    @RequestMapping("/cart/view")
    public String view(Model model) {
        model.addAttribute("cates", dao.findAll());
        model.addAttribute("item", productService.findAll());
        // get totalsize item
        List<Product> items = productService.findAll();
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        return "cart/view";

    }
}
