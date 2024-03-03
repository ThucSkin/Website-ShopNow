package com.websiteshop.HomeController;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import javax.mail.FetchProfile.Item;

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

    static void list_All_Items(Model model, @Autowired ProductService ps) {
        // get totalsize item
        model.addAttribute("items", ps.findAll());
        model.addAttribute("totalItemss", ps.findAll().size());
    }

    @GetMapping("/")
    public String home(ModelMap model,
            @RequestParam(name = "name", required = false) String name,
            @RequestParam("page") Optional<Integer> page,
            @RequestParam("size") Optional<Integer> size) {
        int currentPage = page.orElse(1);
        int pageSize = size.orElse(18);
        Pageable pageable = PageRequest.of(currentPage - 1, pageSize, Sort.by("productId").descending());
        Page<Product> resultPage = null;

        if (StringUtils.hasText(name)) {
            resultPage = productService.findByNameContaining(name, pageable);
            model.addAttribute("name", name);
            model.addAttribute("totalItems", productService.countByNameContaining(name));
        } else {
            resultPage = productService.findAll(pageable);
            model.addAttribute("totalItems", productService.findAll().size());
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
            return "redirect:/home404";
        }
        List<Product> list = productService.findByCategoryId(cid.get());
        model.addAttribute("item", list);
        model.addAttribute("totalItems", pdao.findByCategoryId(cid.get()).size());
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/product/detail/{productId}")
    public String detail(Model model, @PathVariable("productId") Long id) {
        try {
            Product item = productService.findById(id).orElseThrow(() -> new Exception("Product not found"));
            model.addAttribute("item", item);
            model.addAttribute("phukien", pdao.findByPhuKien("sạc dự phòng"));
            model.addAttribute("totalItems", pdao.findByPhuKien("sạc dự phòng").size());
            list_All_Items(model, productService);
        } catch (Exception e) {
            return "redirect:/home404";
        }
        return "product/detail";
    }

    //////////////////////////////

    @RequestMapping("/product/list/hotsale")
    public String hotSale(Model model) {
        String hot = "hot-icon.gif";
        model.addAttribute("item", pdao.findByHotSale(hot));
        // get totalsize item
        model.addAttribute("totalItems", pdao.findByHotSale(hot).size());
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/price/duoi-2-trieu")
    public String price1(Model model) {
        return getPriceSearchResult(model, 0, 2000000);
    }

    @RequestMapping("/price/tu-2-4-trieu")
    public String price2(Model model) {
        return getPriceSearchResult(model, 2000000, 4000000);
    }

    @RequestMapping("/price/tu-4-7-trieu")
    public String price3(Model model) {
        return getPriceSearchResult(model, 4000000, 7000000);
    }

    @RequestMapping("/price/tu-7-13-trieu")
    public String price4(Model model) {
        return getPriceSearchResult(model, 7000000, 13000000);
    }

    @RequestMapping("/price/tu-13-20-trieu")
    public String price6(Model model) {
        return getPriceSearchResult(model, 13000000, 20000000);
    }

    @RequestMapping("/price/tren-20-trieu")
    public String price5(Model model) {
        return getPriceSearchResult(model, 20000000, 500000000);
    }

    private String getPriceSearchResult(Model model, int minPrice, int maxPrice) {
        List<Product> items = pdao.findByUnitPrice(minPrice, maxPrice);
        int totalItems = items.size();

        model.addAttribute("item", items);
        model.addAttribute("totalItems", totalItems);

        list_All_Items(model, productService);

        return "product/list_search";
    }

    @RequestMapping("/dtdd-{firm}")
    public String getMobileByFirm(Model model, @PathVariable String firm) {
        List<Product> items = pdao.findByTheFirm(firm);
        int totalItems = items.size();

        model.addAttribute("item", items);
        model.addAttribute("totalItems", totalItems);

        list_All_Items(model, productService);

        return "product/list_search";
    }

    @RequestMapping("/dtdd-ram-{ram}-GB")
    public String getMobileByRAM(Model model, @PathVariable String ram) {
        List<Product> items = pdao.findByRAM(ram);
        int totalItems = items.size();

        model.addAttribute("item", items);
        model.addAttribute("totalItems", totalItems);

        list_All_Items(model, productService);

        return "product/list_search";
    }

    @RequestMapping("/dtdd-choi-game")
    public String game(Model model) {
        model.addAttribute("item", pdao.findByDiscription("game"));
        // get totalsize item
        List<Product> items = pdao.findByDiscription("game");
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/dtdd-chup-anh")
    public String camera(Model model) {
        model.addAttribute("item", pdao.findByDiscription("camera"));
        // get totalsize item
        List<Product> items = pdao.findByDiscription("camera");
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/dtdd-mong-nhe")
    public String mong_nhe(Model model) {
        model.addAttribute("item", pdao.findByDiscription("mỏng"));
        // get totalsize item
        List<Product> items = pdao.findByDiscription("mỏng");
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/dtdd-rom-32-GB")
    public String Rom32GB(Model model) {
        model.addAttribute("item", pdao.findByGB("32GB"));
        // get totalsize item
        List<Product> items = pdao.findByGB("32GB");
        model.addAttribute("totalItems", items.size());
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/dtdd-rom-64-GB")
    public String Rom64GB(Model model) {
        model.addAttribute("item", pdao.findByGB("64GB"));
        // get totalsize item
        List<Product> items = pdao.findByGB("64GB");
        model.addAttribute("totalItems", items.size());
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/dtdd-rom-128-GB")
    public String Rom128GB(Model model) {
        model.addAttribute("item", pdao.findByGB("128GB"));
        // get totalsize item
        List<Product> items = pdao.findByGB("128GB");
        model.addAttribute("totalItems", items.size());
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/dtdd-rom-256-GB")
    public String Rom256GB(Model model) {
        model.addAttribute("item", pdao.findByGB("256GB"));
        // get totalsize item
        List<Product> items = pdao.findByGB("256GB");
        model.addAttribute("totalItems", items.size());
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/dtdd-rom-512-GB")
    public String Rom512GB(Model model) {
        model.addAttribute("item", pdao.findByGB("512GB"));
        // get totalsize item
        List<Product> items = pdao.findByGB("512GB");
        model.addAttribute("totalItems", items.size());
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/dtdd-rom-1-TB")
    public String Rom1T(Model model) {
        model.addAttribute("item", pdao.findByGB("1TB"));
        // get totalsize item
        List<Product> items = pdao.findByGB("1TB");
        model.addAttribute("totalItems", items.size());
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/dtdd-pin-5000mAh")
    public String pin5000mAh(Model model) {
        model.addAttribute("item", pdao.findByPinTren5000());
        // get totalsize item
        List<Product> items = pdao.findByPinTren5000();
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/dtdd-sac-pin-nhanh")
    public String sac_nhanh(Model model) {
        model.addAttribute("item", pdao.findBySacTu18W());
        // get totalsize item
        List<Product> items = pdao.findBySacTu18W();
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/dtdd-sac-pin-sieu-nhanh")
    public String sac_sieu_nhanh(Model model) {
        model.addAttribute("item", pdao.findBySacTu33W());
        // get totalsize item
        List<Product> items = pdao.findBySacTu33W();
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/dtdd-sac-khong-day")
    public String sac_khon_day(Model model) {
        model.addAttribute("item", pdao.findByDiscription("sạc không dây"));
        // get totalsize item
        List<Product> items = pdao.findByDiscription("sạc không dây");
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/dtdd-khang-nuoc")
    public String khang_nuoc(Model model) {
        model.addAttribute("item", pdao.findByDiscription("kháng nước"));
        // get totalsize item
        List<Product> items = pdao.findByDiscription("kháng nước");
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/dtdd-ho-tro-5G")
    public String Support5G(Model model) {
        model.addAttribute("item", pdao.findByDiscription("5G"));
        // get totalsize item
        List<Product> items = pdao.findByDiscription("5G");
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/dtdd-bao-mat-3D")
    public String bao_mat(Model model) {
        model.addAttribute("item", pdao.findByDiscription("bảo mật"));
        // get totalsize item
        List<Product> items = pdao.findByDiscription("bảo mật");
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/dtdd-chong-rung")
    public String chong_rung(Model model) {
        model.addAttribute("item", pdao.findByDiscription("chống rung"));
        // get totalsize item
        List<Product> items = pdao.findByDiscription("chống rung");
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/price-cao-den-thap")
    public String caodenthap(Model model) {
        model.addAttribute("item", pdao.findByPriceDESC());
        // get totalsize item
        List<Product> items = pdao.findByPriceDESC();
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/price-thap-den-cao")
    public String thapdencao(Model model) {
        model.addAttribute("item", pdao.findByPriceASC());
        // get totalsize item
        List<Product> items = pdao.findByPriceASC();
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/price-giam")
    public String giam(Model model) {
        model.addAttribute("item", pdao.findByDiscountDESC());
        // get totalsize item
        List<Product> items = pdao.findByDiscountDESC();
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/price-sale-flash")
    public String sieu_sale(Model model) {
        model.addAttribute("item", pdao.findBySaleFlash());
        // get totalsize item
        List<Product> items = pdao.findBySaleFlash();
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/phu-kien")
    public String phu_kien__sac(Model model) {
        model.addAttribute("phukien", pdao.findByPhuKien("sạc dự phòng"));
        // get totalsize item
        List<Product> items = pdao.findByPhuKien("sạc dự phòng");
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

    @RequestMapping("/dtdd-sac-nhanh")
    public String sac_nhanh1(Model model) {
        model.addAttribute("phukien", pdao.findByPhuKien("sạc dự phòng"));
        // get totalsize item
        List<Product> items = pdao.findByPhuKien("sạc dự phòng");
        int totalItems = items.size();
        model.addAttribute("totalItems", totalItems);
        // get totalsize item
        list_All_Items(model, productService);
        return "product/list_search";
    }

}
