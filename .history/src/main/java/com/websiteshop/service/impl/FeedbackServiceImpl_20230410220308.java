package com.websiteshop.service.impl;

import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import com.websiteshop.dao.FeedbackDAO;
import com.websiteshop.entity.Account;
import com.websiteshop.entity.Feedback;
import com.websiteshop.service.FeedbackService;

@Service
public class FeedbackServiceImpl implements FeedbackService {
	@Autowired
	FeedbackDAO fdao;

	@Autowired
	FeedbackService feedbackService;

	@Override
	public Page<Feedback> findAll(Pageable pageable) {
		return fdao.findAll(pageable);
	}

	@Override
	public List<Feedback> findAll() {
		return fdao.findAll();
	}

	@Override
	public Optional<Feedback> findById(Long id) {
		return fdao.findById(id);
	}

	@Override
	public void delete(Feedback entity) {
		fdao.delete(entity);
	}

	@Override
	public <S extends Feedback> S save(S entity) {
		return fdao.save(entity);
	}

	// public Page<Feedback> findByUsernameContaining(Account account, Pageable
	// pageable) {
	// String username = account.getUsername();
	// return fdao.findByUsernameContaining(username, pageable);
	// }

}
