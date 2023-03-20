package com.websiteshop.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.websiteshop.entity.Account;
import com.websiteshop.entity.Comment;

@Repository
public interface CommentDAO extends JpaRepository<Comment, Long> {

	// Page<Comment> findByUsernameContaining(String username, Pageable pageable);

}
