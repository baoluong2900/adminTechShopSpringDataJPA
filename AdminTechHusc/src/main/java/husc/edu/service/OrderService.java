package husc.edu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import husc.edu.entities.Order;

import husc.edu.repository.OrderRepository;

@Service
public class OrderService {
	
	@Autowired
	private  OrderRepository orderRepository;
	
	
	public List< Order> getAll() {
		return  orderRepository.findAll();
	}
}
