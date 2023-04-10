package com.websiteshop.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.websiteshop.entity.Account;
import com.websiteshop.entity.Feedback;

@Repository
public interface FeedbackDAO extends JpaRepository<Feedback, Long> {
	@Query(value = "SELECT f.* FROM feedback f INNER JOIN account a ON f.account_id = a.id WHERE a.username = ?1", countQuery = "SELECT COUNT(*) FROM feedback f INNER JOIN account a ON f.account_id = a.id WHERE a.username = ?1", nativeQuery = true)
	Page<Feedback> findByUsernameContaining(String username, Pageable pageable);

	// Page<Feedback> findByUsernameContaining(String username, Pageable pageable);
}
