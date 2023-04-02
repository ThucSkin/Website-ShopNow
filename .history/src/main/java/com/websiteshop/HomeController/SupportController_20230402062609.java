package com.websiteshop.HomeController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SupportController {

	@RequestMapping("/help")
	public String help(Model model) {
		return "help/help";
	}

	@GetMapping("/help/help1")
	public String help1() {
		return "help/help_1";
	}

	@GetMapping("/help/help2")
	public String help2() {
		return "help/help_2";
	}

	@GetMapping("/help/help3")
	public String help3() {
		return "help/help_3";
	}

	@GetMapping("/help/help4")
	public String help4() {
		return "help/help_4";
	}

	@GetMapping("/help/help5")
	public String help5() {
		return "help/help_5";
	}

	@GetMapping("/help/help6")
	public String help6() {
		return "help/help_6";
	}

	@GetMapping("/help/help7")
	public String help7() {
		return "help/help_7";
	}

	@GetMapping("/help/help8")
	public String help8() {
		return "help/help_8";
	}

	@GetMapping("/help/help9")
	public String help9() {
		return "help/help_9";
	}

	@GetMapping("/home404")
	public String f404(Model model) {
		return "admin/dist/404_home";
	}

}
