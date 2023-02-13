package com.websiteshop.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.websiteshop.entity.Role;

public interface RoleService {

	public List<Role> findAll();
}
