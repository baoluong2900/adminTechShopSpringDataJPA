package husc.edu.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import husc.edu.entities.Order;



@Repository
public interface OrderRepository extends JpaRepository<Order, Integer> {
	
	
}
