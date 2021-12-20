package husc.edu.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import husc.edu.service.CustomerService;



@Controller
public class CustomerController {
	
	@Autowired
	private CustomerService  customerServicer;
	
	
	@GetMapping(value = "/customer")
	public String getAll(Model model) {
		model.addAttribute("listCustomer", customerServicer.getAll());
		return "list-customer";
	}
}
