package husc.edu.controller;



import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import husc.edu.entities.Category;
import husc.edu.service.CategoryService;



@Controller
public class CategoryController {
	
	@Autowired
	private CategoryService categoryService;
	

//	@GetMapping("edit/{categoryId}")
//	public String edit() {
//		return "category/edit";
//		
//	}
//	
//	@GetMapping("delete/{categoryId}")
//	public String delete() {
//		return "category/delete";
//		
//	}
//	
//	@GetMapping("saveOrUpdate")
//	public String saveOrUpdate() {
//		return "redirect:/saveOrUpdate";
//	}
//	
	@PostMapping(value = "add-category")
	public String add(HttpServletRequest req) {
		String name = req.getParameter("name");
		Category category = new Category();
		category.setName(name);
		categoryService.save(category);
		return "redirect:category";
	}
	
	@PostMapping(value = "update-category")
	public String update(Category category) {
		categoryService.save(category);
		return "redirect:category";
	}
	
	@GetMapping(value = "delete-category/{id}")
	public String delete(@PathVariable("id") int id, HttpServletRequest req) {
		categoryService.delete(id);
		return "redirect:/category";
	}
	
	
	@GetMapping(value = "/category")
	public String getAll(Model model) {
		model.addAttribute("listCategory", categoryService.getAll());
		return "list-category";
	}
	
	@PostMapping(value = "/category")
	public String findByName(Model model, HttpServletRequest req) {
		String name = req.getParameter("name");
		if(name == null || name.strip() == "")
			return "redirect:category";
		model.addAttribute("searchValue", name);
		model.addAttribute("listCategory", categoryService.findByName(name));
		return "list-category";
	}
}
