package com.websiteshop.dao;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import com.websiteshop.entity.Statitics;
import com.websiteshop.model.StatisticalForMonthProjections;
import com.websiteshop.model.StatisticalForProductProjections;
import com.websiteshop.model.StatisticalForYearProjections;

@Repository
public interface StatiticDAO extends JpaRepository<Statitics, Long> {
	
	@Query(value = "SELECT count(orderId) FROM Orders where MONTH(CreateDay) = 2 and YEAR(CreateDay) = 2022", nativeQuery = true)
	Statitics SLOrder();
	
	String STATISCAL_FOR_MONTH_QUERY = "SELECT MONTH(CreateDay) AS orderMonth, YEAR(CreateDay) AS orderYear, COUNT(i.OrderId) as orderCount,"
			+ "SUM(Total) AS total, MIN(Total) AS minTotal, MAX(i.Total) AS maxTotal FROM Orders i Where i.Status = N'Đã giao hàng'"
			+ "GROUP BY MONTH(CreateDay), YEAR(CreateDay)";
	
	String STATISCAL_FOR_YEAR_QUERY = "SELECT YEAR(CreateDay) AS orderYear, COUNT(i.OrderId) as orderCount, SUM(total) AS total, MIN(total) AS minTotal,"
			+ "MAX(total) AS maxTotal FROM Orders i Where i.status = N'Đã giao hàng' GROUP BY YEAR(CreateDay)";
	
	String STATISCAL_FOR_PRODUCT_QUERY = "SELECT p.ProductId AS id, p.name AS name, (CASE WHEN SUM(detail.Price) IS NULL THEN 0 ELSE SUM(detail.Quantity)"
			+ "END) as soLuongBanDuoc, (CASE WHEN SUM(detail.price * detail.Quantity) IS NULL THEN 0 ELSE SUM(detail.price * detail.Quantity)"
			+ "END) as tongTienThuDuoc FROM Products p LEFT JOIN OrderDetails detail ON p.ProductId = detail.ProductId "
			+ "FULL JOIN Orders ON Orders.OrderId = detail.OrderId Where orders.status = N'Đã giao hàng'"
			+ "GROUP BY p.ProductId, p.name ORDER BY soLuongBanDuoc";
    
    @Query(value = STATISCAL_FOR_MONTH_QUERY, nativeQuery = true)
    List<StatisticalForMonthProjections> statisticalForMonth();
    
    @Query(value = STATISCAL_FOR_YEAR_QUERY, nativeQuery = true)
    List<StatisticalForYearProjections> statisticalForYear();
    
    @Query(value = STATISCAL_FOR_PRODUCT_QUERY, nativeQuery = true)
    List<StatisticalForProductProjections> statisticalForProduct();
}
