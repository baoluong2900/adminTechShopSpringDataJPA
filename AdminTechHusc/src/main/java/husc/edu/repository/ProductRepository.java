package husc.edu.repository;



import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


import husc.edu.entities.Product;


@Repository
public interface ProductRepository extends JpaRepository<Product, Integer> {

	
	List<Product> findByName(String name);
	
	List<Product> findByNameContainingIgnoreCase(String name);
}
