package husc.edu.controller;







import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;


import husc.edu.entities.Product;
import husc.edu.service.CategoryService;
import husc.edu.service.ProductService;


@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;

	@Autowired
	private CategoryService categoryService;

	@PostMapping(value = "add-product")
	public String add(HttpServletRequest req) {
		String name = req.getParameter("name");
		String quantity = req.getParameter("quantity");
		String categoryId = req.getParameter("categoryId");
		String unitPrice = req.getParameter("unitPrice");
		String image = req.getParameter("image");
		String description = req.getParameter("description");
		String discount = req.getParameter("discount");
		//SimpleDateFormat dd=new SimpleDateFormat("YYYY//MM/dd");
		String enteredDate = req.getParameter("enteredDate");
		
	//	LocalDateTime ldt = LocalDateTime.now();
		String status = req.getParameter("status");
		
		Product product = new Product();
		product.setName(name);
		product.setQuantity(Integer.parseInt(quantity));
		product.setCategoryId(Integer.parseInt(categoryId));
		product.setUnitPrice(Double.parseDouble(unitPrice));
		product.setImage(image);
		product.setDescription(description);
		product.setDiscount(Double.parseDouble(discount));
		product.setEnteredDate(java.sql.Date.valueOf(enteredDate)); 
		product.setStatus(Integer.parseInt(status));
		
		productService.save(product);
		return "redirect:product";
	}
	
	@PostMapping(value = "update-product")
	public String update(HttpServletRequest req) {
		String id = req.getParameter("productId"); //update se co ID
		String name = req.getParameter("name");
		String quantity = req.getParameter("quantity");
		String categoryId = req.getParameter("categoryId");
		String unitPrice = req.getParameter("unitPrice");
		String image = req.getParameter("image");
		String description = req.getParameter("description");
		String discount = req.getParameter("discount");
		//SimpleDateFormat dd=new SimpleDateFormat("YYYY//MM/dd");
		String enteredDate = req.getParameter("enteredDate");
		
	//	LocalDateTime ldt = LocalDateTime.now();
		String status = req.getParameter("status");
		
		Product product = new Product();
		product.setProductId(Integer.parseInt(id)); //product co truyen id se la ham update
		product.setName(name);
		product.setQuantity(Integer.parseInt(quantity));
		product.setCategoryId(Integer.parseInt(categoryId));
		product.setUnitPrice(Double.parseDouble(unitPrice));
		product.setImage(image);
		product.setDescription(description);
		product.setDiscount(Double.parseDouble(discount));
		product.setEnteredDate(java.sql.Date.valueOf(enteredDate)); 
		product.setStatus(Integer.parseInt(status));
		
		productService.save(product);
		return "redirect:product";
	}
	
	@GetMapping(value = "delete-product/{id}")
	public String delete(@PathVariable("id") int id, HttpServletRequest req) {
		productService.delete(id);
		return "redirect:/product";
	}
	
	

	
	@PostMapping(value = "/product")
	public String findByName(Model model, HttpServletRequest req) {
		String name = req.getParameter("name");
		if(name == null || name.strip() == "")
			return "redirect:product";
		model.addAttribute("searchValue", name);
		model.addAttribute("listProduct", productService.findByName(name));
		model.addAttribute("listCategory", categoryService.getAll());                                  
		return "list-product";
	}
	
	
	@GetMapping(value = "/product")
	public String getAll(Model model) {
		model.addAttribute("listCategory", categoryService.getAll());
		model.addAttribute("listProduct", productService.getAll());
		return "list-product";
	}
}
