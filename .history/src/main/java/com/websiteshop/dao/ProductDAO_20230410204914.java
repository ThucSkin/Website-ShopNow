package com.websiteshop.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Service;
import com.websiteshop.entity.Product;

@Service
public interface ProductDAO extends JpaRepository<Product, Long> {
	@Query("SELECT p FROM Product p WHERE p.category.categoryId=?1")
	List<Product> findByCategoryId(Long cid);

	List<Product> findByNameContaining(String name);

	Page<Product> findByNameContaining(String name, Pageable pageable);

	@Query(value = "select * from Products where HotSale like ?1", nativeQuery = true)
	List<Product> findByHotSale(String hotSale);

	@Query(value = "select * from products where UnitPrice between ?1 and ?2", nativeQuery = true)
	List<Product> findByUnitPrice(Integer price1, Integer price2);

	@Query(value = "select * from Products where TheFirm like ?1", nativeQuery = true)
	List<Product> findByTheFirm(String theFirm);

	@Query(value = "select * from Products where RAM like ?1", nativeQuery = true)
	List<Product> findByRAM(String ram);

	@Query(value = "select * from Products where Discription LIKE %:dis%", nativeQuery = true)
	List<Product> findByDiscription(@Param("dis") String dis);

	@Query(value = "SELECT * FROM Products WHERE name like %:rom", nativeQuery = true)
	List<Product> findByGB(@Param("rom") String rom);

	@Query(value = "SELECT * FROM Products WHERE name like %:rom%", nativeQuery = true)
	List<Product> findByPhuKien(@Param("rom") String rom);

	@Query(value = "select * from Products ORDER BY UnitPrice DESC", nativeQuery = true)
	List<Product> findByPriceDESC();

	@Query(value = "select * from Products ORDER BY UnitPrice ASC", nativeQuery = true)
	List<Product> findByPriceASC();

	@Query(value = "select * from Products ORDER BY Discount DESC", nativeQuery = true)
	List<Product> findByDiscountDESC();

	@Query(value = "SELECT * FROM Products WHERE discount > 20", nativeQuery = true)
	List<Product> findBySaleFlash();

	@Query(value = "SELECT * FROM products WHERE discription LIKE N'%Sạc [1-2][8-9] W%' OR discription LIKE N'%Sạc [2-9][0-9] W%' OR discription LIKE N'%Sạc [1-9][0-9][0-9] W%'", nativeQuery = true)
	List<Product> findBySacTu18W();

	@Query(value = "SELECT * FROM products WHERE discription LIKE N'%Sạc [3-9][3-9] W%' OR discription LIKE N'%Sạc [1-9][0-9][0-9] W%'", nativeQuery = true)
	List<Product> findBySacTu33W();

	@Query(value = "SELECT * FROM products WHERE discription LIKE N'%Pin [5-9][0-9][0-9][0-9] mAh%' OR discription LIKE N'%Pin [1-9][0-9][0-9][0-9][0-9] mAh%'", nativeQuery = true)
	List<Product> findByPinTren5000();

	long countByNameContaining(String name);

}
