package com.websiteshop.service;

import java.util.List;
import java.util.Optional;
import java.util.function.Function;

import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.query.FluentQuery.FetchableFluentQuery;

import com.websiteshop.entity.Account;
import com.websiteshop.entity.Order;
import com.websiteshop.entity.OrderDetail;

public interface OrderDetailService {

	<S extends OrderDetail> List<S> findAll(Example<S> example, Sort sort);

	<S extends OrderDetail> List<S> findAll(Example<S> example);

	void deleteAll();

	OrderDetail getReferenceById(Long id);

	void deleteAll(Iterable<? extends OrderDetail> entities);

	void deleteAllById(Iterable<? extends Long> ids);

	OrderDetail getById(Long id);

	void delete(OrderDetail id);

	void deleteById(Long id);

	OrderDetail getOne(Long id);

	void deleteAllInBatch();

	long count();

	<S extends OrderDetail, R> R findBy(Example<S> example, Function<FetchableFluentQuery<S>, R> queryFunction);

	void deleteAllByIdInBatch(Iterable<Long> ids);

	<S extends OrderDetail> boolean exists(Example<S> example);

	void deleteAllInBatch(Iterable<OrderDetail> entities);

	<S extends OrderDetail> long count(Example<S> example);

	boolean existsById(Long id);

	void deleteInBatch(Iterable<OrderDetail> entities);

	Optional<OrderDetail> findById(Long id);

	<S extends OrderDetail> Page<S> findAll(Example<S> example, Pageable pageable);

	<S extends OrderDetail> List<S> saveAllAndFlush(Iterable<S> entities);

	<S extends OrderDetail> S saveAndFlush(S entity);

	void flush();

	<S extends OrderDetail> List<S> saveAll(Iterable<S> entities);

	List<OrderDetail> findAllById(Iterable<Long> ids);

	List<OrderDetail> findAll(Sort sort);

	Page<OrderDetail> findAll(Pageable pageable);

	List<OrderDetail> findAll();

	<S extends OrderDetail> Optional<S> findOne(Example<S> example);

	<S extends OrderDetail> S save(S entity);

	List<OrderDetail> findByStatus(String status, String username);

	List<OrderDetail> findByStatus(String status);

	void deleteOrderDetailsByOrderId(Long orderId);

}
