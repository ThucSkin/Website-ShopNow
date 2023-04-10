package com.websiteshop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import com.websiteshop.entity.Authority;

public interface AuthorityService {

	public List<Authority> findAll();

	<S extends Authority> S save(S entity);

	Optional<Authority> findById(Integer id);

	public List<Authority> findAuthoritiesOfAdministrators();

	public Authority create(Authority auth);

	public void deleteById(Authority id);

	public void delete(Authority entity);

	public void deleteAll();

	Page<Authority> findAll(Pageable pageable);

	long countByAccountUsername(String username);

}
