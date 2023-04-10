package com.websiteshop.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.websiteshop.entity.Account;
import com.websiteshop.entity.Feedback;

@Repository
public interface FeedbackDAO extends JpaRepository<Feedback, Long> {

	// Page<Feedback> findByUsernameContaining(Account account, Pageable pageable);

	// Page<Feedback> findByUsernameContaining(String username, Pageable pageable);
}
