
package com.websiteshop.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.websiteshop.dao.AccountDAO;
import com.websiteshop.dao.AuthorityDAO;
import com.websiteshop.entity.Account;
import com.websiteshop.entity.Authority;
import com.websiteshop.service.AuthorityService;

@Service
public class AuthorityServiceImpl implements AuthorityService {

    @Autowired
    AuthorityDAO dao;

    @Autowired
    AccountDAO acdao;

    @Override
	public Page<Authority> findByIdContaining(String id, Pageable pageable) {
		return dao.findByIdContaining(id, pageable);
	}

	@Override
	public Page<Authority> findAll(Pageable pageable) {
		return dao.findAll(pageable);
	}

	@Override
    public List<Authority> findAuthoritiesOfAdministrators() {
        List<Account> accounts = acdao.getAdministratiors();
        return dao.authoritiesOf(accounts);
    }

    @Override
    public Authority create(Authority auth) {
        return dao.save(auth);
    }

    @Override
    public List<Authority> findAll() {
        return dao.findAll();
    }

    @Override
    public <S extends Authority> S save(S entity) {
        return dao.save(entity);
    }

    @Override
    public Optional<Authority> findById(Integer id) {
        return dao.findById(id);
    }

    public void deleteById(Integer id) {
        dao.deleteById(id);
    }

    public void delete(Authority entity) {
        dao.delete(entity);
    }

    public void deleteAll() {
        dao.deleteAll();
    }

    @Override
    public void deleteById(Authority id) {
        dao.delete(id);
    }

}
