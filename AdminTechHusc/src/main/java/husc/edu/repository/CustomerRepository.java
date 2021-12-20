package husc.edu.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import husc.edu.entities.Customer;


@Repository
public interface CustomerRepository extends JpaRepository<Customer, Integer> {
	
	
}
