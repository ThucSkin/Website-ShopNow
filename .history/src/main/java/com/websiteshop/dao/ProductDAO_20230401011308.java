package com.websiteshop.dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
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

	@Query(value = "select * from Products where Discription like '%5000 mAh%'", nativeQuery = true)
	List<Product> findByPin5000mAh();

	@Query(value = "select * from Products where Discription like '%game%'", nativeQuery = true)
	List<Product> findByGame();

	@Query(value = "select * from Products where Discription like '%camera%'", nativeQuery = true)
	List<Product> findByCamera();

	@Query(value = "SELECT * FROM Products WHERE Name LIKE %:rom%", nativeQuery = true)
	List<Product> findByGB(@Param("rom") String rom);

}
