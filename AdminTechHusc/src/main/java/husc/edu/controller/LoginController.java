package husc.edu.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import husc.edu.service.AccountService;

@Controller
public class LoginController {
	
	@Autowired
	private AccountService accountService;
	
	@GetMapping(value = "/")
	public String start() {
		return "login";
	}
	
	@GetMapping(value = "/login")
	public String login() {
		return "login";
	}
	
	@PostMapping(value = "/login")
	public String checkLogin(Model model, HttpServletRequest req) {
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		if(accountService.login(username, password) == null) {
			model.addAttribute("username", username);
			model.addAttribute("error", "Incorrect username or password");
			return "login";
		}
		return "redirect:product";
	}
	
}
