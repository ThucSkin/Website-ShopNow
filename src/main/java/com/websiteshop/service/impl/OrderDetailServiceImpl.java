
package com.websiteshop.service.impl;

import java.util.List;
import java.util.Optional;
import java.util.function.Function;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.query.FluentQuery.FetchableFluentQuery;
import org.springframework.stereotype.Service;
import com.websiteshop.dao.OrderDetailDAO;
import com.websiteshop.entity.Order;
import com.websiteshop.entity.OrderDetail;
import com.websiteshop.service.OrderDetailService;

@Service
public class OrderDetailServiceImpl implements OrderDetailService {

	@Autowired
	OrderDetailDAO ddao;

	@Override
	public void deleteOrderDetailsByOrderId(Long orderId) {
		 ddao.deleteOrderDetailsByOrderId(orderId);
	}

	@Override
	public List<OrderDetail> findByStatus(String status, String username) {
		return ddao.findByStatus(status, username);
	}

	@Override
	public List<OrderDetail> findByStatus(String status) {
		return ddao.findByStatus(status);
	}

	@Override
	public <S extends OrderDetail> S save(S entity) {
		return ddao.save(entity);
	}

	@Override
	public <S extends OrderDetail> Optional<S> findOne(Example<S> example) {
		return ddao.findOne(example);
	}

	@Override
	public List<OrderDetail> findAll() {
		return ddao.findAll();
	}

	@Override
	public Page<OrderDetail> findAll(Pageable pageable) {
		return ddao.findAll(pageable);
	}

	@Override
	public List<OrderDetail> findAll(Sort sort) {
		return ddao.findAll(sort);
	}

	@Override
	public List<OrderDetail> findAllById(Iterable<Long> ids) {
		return ddao.findAllById(ids);
	}

	@Override
	public <S extends OrderDetail> List<S> saveAll(Iterable<S> entities) {
		return ddao.saveAll(entities);
	}

	@Override
	public void flush() {
		ddao.flush();
	}

	@Override
	public <S extends OrderDetail> S saveAndFlush(S entity) {
		return ddao.saveAndFlush(entity);
	}

	@Override
	public <S extends OrderDetail> List<S> saveAllAndFlush(Iterable<S> entities) {
		return ddao.saveAllAndFlush(entities);
	}

	@Override
	public <S extends OrderDetail> Page<S> findAll(Example<S> example, Pageable pageable) {
		return ddao.findAll(example, pageable);
	}

	@Override
	public Optional<OrderDetail> findById(Long id) {
		return ddao.findById(id);
	}

	@Override
	public void deleteInBatch(Iterable<OrderDetail> entities) {
		ddao.deleteInBatch(entities);
	}

	@Override
	public boolean existsById(Long id) {
		return ddao.existsById(id);
	}

	@Override
	public <S extends OrderDetail> long count(Example<S> example) {
		return ddao.count(example);
	}

	@Override
	public void deleteAllInBatch(Iterable<OrderDetail> entities) {
		ddao.deleteAllInBatch(entities);
	}

	@Override
	public <S extends OrderDetail> boolean exists(Example<S> example) {
		return ddao.exists(example);
	}

	@Override
	public void deleteAllByIdInBatch(Iterable<Long> ids) {
		ddao.deleteAllByIdInBatch(ids);
	}

	@Override
	public <S extends OrderDetail, R> R findBy(Example<S> example, Function<FetchableFluentQuery<S>, R> queryFunction) {
		return ddao.findBy(example, queryFunction);
	}

	@Override
	public long count() {
		return ddao.count();
	}

	@Override
	public void deleteAllInBatch() {
		ddao.deleteAllInBatch();
	}

	@Override
	public OrderDetail getOne(Long id) {
		return ddao.getOne(id);
	}

	@Override
	public OrderDetail getById(Long id) {
		return ddao.getById(id);
	}

	@Override
	public OrderDetail getReferenceById(Long id) {
		return ddao.getReferenceById(id);
	}

	@Override
	public void deleteAll() {
		ddao.deleteAll();
	}

	@Override
	public <S extends OrderDetail> List<S> findAll(Example<S> example) {
		return ddao.findAll(example);
	}

	@Override
	public <S extends OrderDetail> List<S> findAll(Example<S> example, Sort sort) {
		return ddao.findAll(example, sort);
	}

	@Override
	public void deleteAll(Iterable<? extends OrderDetail> entities) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteAllById(Iterable<? extends Long> ids) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteById(Long id) {
		ddao.deleteById(id);
	}

	@Override
	public void delete(OrderDetail id) {
		// TODO Auto-generated method stub

	}

}