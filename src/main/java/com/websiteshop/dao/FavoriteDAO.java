package com.websiteshop.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.websiteshop.entity.Favorite;

@Repository
public interface FavoriteDAO extends JpaRepository<Favorite, Long> {


}
