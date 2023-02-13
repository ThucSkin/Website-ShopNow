package com.websiteshop.AdminController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import com.websiteshop.service.StatisticalService;

@Controller
public class StatisticalAdminController {

	@Autowired
	StatisticalService statisticalService;

	@GetMapping("statistical")
	public String manager(ModelMap model) {
		//đưa danh sách thống kê vào model 
		model.addAttribute("months", statisticalService.statisticalForMonth());
		model.addAttribute("years", statisticalService.statisticalForYear());
		model.addAttribute("products", statisticalService.statisticalForProduct());
		return "/admin/statistical/statistical";
	}
}
