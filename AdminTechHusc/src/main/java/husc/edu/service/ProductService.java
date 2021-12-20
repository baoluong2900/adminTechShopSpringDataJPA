package husc.edu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import husc.edu.entities.Product;

import husc.edu.repository.ProductRepository;

@Service
public class ProductService {
	
	@Autowired
	private ProductRepository productRepository;
	
	
	public List<Product> getAll() {
		return productRepository.findAll();
	}
	
	public List<Product> findByName(String name) {
		return productRepository.findByNameContainingIgnoreCase(name);
	}
	
	public Product save(Product product) {
		return productRepository.save(product);
	}
	
	public void delete(int id) {
		productRepository.deleteById(id);
	}
}
