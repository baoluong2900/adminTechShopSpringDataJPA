package husc.edu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import husc.edu.entities.Category;
import husc.edu.repository.CategoryRepository;

@Service
public class CategoryService {
		
	
	@Autowired
	private CategoryRepository categoryRepository;
	
	
	public List<Category> getAll() {
		return categoryRepository.findAll();
	}
	
	public List<Category> findByName(String name) {
		return categoryRepository.findByName(name);
	}
	
	public Category save(Category category) {
		return categoryRepository.save(category);
	}
	
	public void delete(int id) {
		categoryRepository.deleteById(id);
	}
	
	
}
