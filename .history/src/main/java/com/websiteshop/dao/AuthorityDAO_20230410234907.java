package com.websiteshop.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import com.websiteshop.entity.Account;
import com.websiteshop.entity.Authority;

public interface AuthorityDAO extends JpaRepository<Authority, Integer> {

    @Query("SELECT DISTINCT a FROM Authority a WHERE a.account IN ?1")
    List<Authority> authoritiesOf(List<Account> accounts);

    @Query(value = "SELECT f.* FROM Authorities f INNER JOIN Accounts a ON f.Username = a.Username WHERE a.username = ?1", countQuery = "SELECT COUNT(*) FROM Feedbacks f INNER JOIN Accounts a ON f.Username = a.Username WHERE a.username = ?1", nativeQuery = true)
    Page<Authority> findByAccountUsername(String username, Pageable pageable);

    long countByAccountUsername(String username);

}
