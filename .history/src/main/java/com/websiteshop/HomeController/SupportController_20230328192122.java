package com.websiteshop.HomeController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	@RequestMapping("/help")
	public String help(Model model) {
		return "help/help";
	}

	@RequestMapping("/home404")
	public String f404(Model model) {
		return "admin/dist/404_home";
	}

}
