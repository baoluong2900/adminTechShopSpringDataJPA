package husc.edu.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import husc.edu.service.OrderService;



@Controller
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	
	@GetMapping(value = "/order")
	public String getAll(Model model) {
		model.addAttribute("listOrder",orderService.getAll());
		return "list-order";
	}
}
