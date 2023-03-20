package com.websiteshop.service.impl;

import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import com.websiteshop.dao.CommentDAO;
import com.websiteshop.entity.Account;
import com.websiteshop.entity.Comment;
import com.websiteshop.service.CommentService;

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	CommentDAO cdao;

	@Override
	public Page<Comment> findAll(Pageable pageable) {
		return cdao.findAll(pageable);
	}

	@Override
	public <S extends Comment> S save(S entity) {
		return cdao.save(entity);
	}

	@Override
	public Optional<Comment> findById(Long id) {
		return cdao.findById(id);
	}

	@Override
	public void delete(Comment entity) {
		cdao.delete(entity);
	}

	@Override
	public List<Comment> findAll() {
		return cdao.findAll();
	}

	@Override
	public Page<Comment> findByUsernameContaining(String username, Pageable pageable) {
		// TODO Auto-generated method stub
		throw new UnsupportedOperationException("Unimplemented method 'findByUsernameContaining'");
	}

	// @Override
	// public Page<Comment> findByUsernameContaining(String username, Pageable
	// pageable) {
	// return cdao.findByUsernameContaining(username, pageable);
	// }

}
