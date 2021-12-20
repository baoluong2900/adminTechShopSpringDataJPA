package husc.edu.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import husc.edu.entities.Account;


@Repository
public interface AccountRepository extends JpaRepository<Account, Integer> {
	
	List<Account> findByUsernameAndPassword(String username, String password);
}
