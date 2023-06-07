package page.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import ptithcm.controller.LoginController;

@Controller
@RequestMapping("/footer")
public class FooterController {

	@RequestMapping("/rule")
	public String rule(ModelMap model) {
		if(LoginController.taikhoan.getEmail() == null) {
			model.addAttribute("login", false);
		}
		else {
			model.addAttribute("login", true);
		}
		return "home_event/rule";
	}
	
	@RequestMapping("/manual")
	public String manual(ModelMap model) {
		if(LoginController.taikhoan.getEmail() == null) {
			model.addAttribute("login", false);
		}
		else {
			model.addAttribute("login", true);
		}
		return "home_event/manual";
	}
	
	@RequestMapping("/regulation")
	public String regulation(ModelMap model) {
		if(LoginController.taikhoan.getEmail() == null) {
			model.addAttribute("login", false);
		}
		else {
			model.addAttribute("login", true);
		}
		return "home_event/regulation";
	}
	
	@RequestMapping("/inf_pro")
	public String inf_pro(ModelMap model) {
		if(LoginController.taikhoan.getEmail() == null) {
			model.addAttribute("login", false);
		}
		else {
			model.addAttribute("login", true);
		}
		return "home_event/inf_pro";
	}
}
