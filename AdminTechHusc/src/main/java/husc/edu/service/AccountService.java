package husc.edu.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import husc.edu.entities.Account;

import husc.edu.repository.AccountRepository;


@Service
public class AccountService {
	
	@Autowired
	private AccountRepository  accountRepository;
	
	public List< Account> getAll() {
		return  accountRepository.findAll();
	}
	
	public Account login(String username, String password) {
		List<Account> list = new ArrayList<Account>();
		list = accountRepository.findByUsernameAndPassword(username, password);
		if(list.size() < 1) 
			return null;
		else
			return list.get(0);
	}
}
