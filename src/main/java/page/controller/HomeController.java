package page.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import ptithcm.controller.LoginController;

@Controller
public class HomeController {

	@RequestMapping("/home")
	public String home(ModelMap model) {
		if(LoginController.taikhoan.getEmail() == null) {
			model.addAttribute("login", false);
		}
		else {
			model.addAttribute("login", true);
			model.addAttribute("user", LoginController.kh);
		}
		return "home";
	}
}
