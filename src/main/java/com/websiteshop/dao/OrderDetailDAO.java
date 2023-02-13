package com.websiteshop.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.websiteshop.entity.Account;
import com.websiteshop.entity.Order;
import com.websiteshop.entity.OrderDetail;

public interface OrderDetailDAO extends JpaRepository<OrderDetail, Long> {
	@Query(value = "SELECT * FROM OrderDetails WHERE status =?1", nativeQuery = true)
	List<OrderDetail> findByStatus(String status);

	@Query(value = "SELECT Orders.OrderId, Orders.Username, Products.Name, OrderDetails.Quantity, OrderDetails.Discount, OrderDetails.ProductId,  OrderDetails.Discription, OrderDetails.orderdetailId, OrderDetails.Price, OrderDetails.Status FROM Orders INNER JOIN OrderDetails ON Orders.OrderId = OrderDetails.OrderId INNER JOIN Products on OrderDetails.ProductId =  Products.ProductId INNER JOIN Accounts on Orders.Username =  Accounts.Username where OrderDetails.Status like ?1 and Accounts.Username like ?2", nativeQuery = true)
	List<OrderDetail> findByStatus(String status, String username);

	@Query(value = "DELETE FROM OrderDetails WHERE orderId=?1", nativeQuery = true)
	void deleteOrderDetailsByOrderId(Long orderId);
}
