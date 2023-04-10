package com.websiteshop.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.websiteshop.entity.Order;

@Repository
public interface OrderDAO extends JpaRepository<Order, Long> {

	@Query("SELECT o FROM Order o WHERE o.account.username=?1")
	Page<Order> findByUsername(String username, Pageable pageable);

	@Query(value = "DELETE FROM Orders WHERE username=?1", nativeQuery = true)
	Order deleteOrderByUsername(String username);

	List<Order> findByNameContaining(String name);

	Page<Order> findByNameContaining(String name, Pageable pageable);

	@Query(value = "select * from Orders where Status like ?1 and Username like ?2", nativeQuery = true)
	List<Order> findByStatus(String status, String username);

	@Query(value = "SELECT * FROM Orders WHERE status =?1", nativeQuery = true)
	List<Order> findByStatus(String status);

	@Query("UPDATE Order set status = ?1 where OrderId = ?2")
	Order updateStatus(String status, Long orderId);

	long countByNameContaining(String name);

	// Lay tong so don hang theo username
	@Query("SELECT COUNT(o) FROM Order o WHERE o.account.username = :username")
	long countByUsername(@Param("username") String username);

	// Lay tong so don hang theo username va trang thai
	@Query("SELECT COUNT(o) FROM Order o WHERE o.account.username = :username AND o.status = :status")
	long countByUsernameAndStatus(@Param("username") String username, @Param("status") String status);

	Page<Order> findByAccountUsername(String name, Pageable pageable);

	// @Query(value = "SELECT o FROM Orders o WHERE o.accounts.username = :username
	// AND o.Username LIKE %:keyword%")
	// public Page<Order> findByUsernameAndProductNameContaining(@Param("username")
	// String username,
	// @Param("keyword") String keyword, Pageable pageable);

}
