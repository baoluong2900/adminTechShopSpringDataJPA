package husc.edu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import husc.edu.entities.OrderDetail;

import husc.edu.repository.OrderDetailRepository;

@Service
public class OrderDetailService {
	
	@Autowired
	private OrderDetailRepository orderDetailRepository;
	
	
	public List<OrderDetail> getAll() {
		return orderDetailRepository.findAll();
	}
}
