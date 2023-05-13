
package com.websiteshop.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.function.Function;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.repository.query.FluentQuery.FetchableFluentQuery;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.stereotype.Service;
import com.websiteshop.dao.AccountDAO;
import com.websiteshop.entity.Account;
import com.websiteshop.entity.Authority;
import com.websiteshop.entity.Role;
import com.websiteshop.service.AccountService;

@Service
public class AccountServiceImpl implements AccountService {
    @Autowired
    AccountDAO adao;

    @Autowired
    AccountService accountService;

    @Override
    public Page<Account> findByFullnameContaining(String fullname, Pageable pageable) {
        return adao.findByFullnameContaining(fullname, pageable);
    }

    @Override
    public Optional<Account> findById(String id) {
        return adao.findById(id);
    }

    @Override
    public <S extends Account> S save(S entity) {
        return adao.save(entity);
    }

    @Override
    public <S extends Account> Optional<S> findOne(Example<S> example) {
        return adao.findOne(example);
    }

    @Override
    public List<Account> findAll() {
        return adao.findAll();
    }

    @Override
    public Page<Account> findAll(Pageable pageable) {
        return adao.findAll(pageable);
    }

    @Override
    public List<Account> findAll(Sort sort) {
        return adao.findAll(sort);
    }

    @Override
    public List<Account> findAllById(Iterable<String> ids) {
        return adao.findAllById(ids);
    }

    @Override
    public <S extends Account> List<S> saveAll(Iterable<S> entities) {
        return adao.saveAll(entities);
    }

    @Override
    public void flush() {
        adao.flush();
    }

    @Override
    public <S extends Account> S saveAndFlush(S entity) {
        return adao.saveAndFlush(entity);
    }

    @Override
    public <S extends Account> List<S> saveAllAndFlush(Iterable<S> entities) {
        return adao.saveAllAndFlush(entities);
    }

    @Override
    public <S extends Account> Page<S> findAll(Example<S> example, Pageable pageable) {
        return adao.findAll(example, pageable);
    }

    @Override
    public void deleteInBatch(Iterable<Account> entities) {
        adao.deleteInBatch(entities);
    }

    @Override
    public boolean existsById(String id) {
        return adao.existsById(id);
    }

    @Override
    public <S extends Account> long count(Example<S> example) {
        return adao.count(example);
    }

    @Override
    public void deleteAllInBatch(Iterable<Account> entities) {
        adao.deleteAllInBatch(entities);
    }

    @Override
    public <S extends Account> boolean exists(Example<S> example) {
        return adao.exists(example);
    }

    @Override
    public void deleteAllByIdInBatch(Iterable<String> ids) {
        adao.deleteAllByIdInBatch(ids);
    }

    @Override
    public <S extends Account, R> R findBy(Example<S> example, Function<FetchableFluentQuery<S>, R> queryFunction) {
        return adao.findBy(example, queryFunction);
    }

    @Override
    public long count() {
        return adao.count();
    }

    @Override
    public void deleteAllInBatch() {
        adao.deleteAllInBatch();
    }

    @Override
    public void deleteById(String id) {
        adao.deleteById(id);
    }

    @Override
    public Account getOne(String id) {
        return adao.getOne(id);
    }

    @Override
    public void delete(Account entity) {
        adao.delete(entity);
    }

    @Override
    public Account getById(String id) {
        return adao.getById(id);
    }

    @Override
    public void deleteAllById(Iterable<? extends String> ids) {
        adao.deleteAllById(ids);
    }

    @Override
    public void deleteAll(Iterable<? extends Account> entities) {
        adao.deleteAll(entities);
    }

    @Override
    public Account getReferenceById(String id) {
        return adao.getReferenceById(id);
    }

    @Override
    public void deleteAll() {
        adao.deleteAll();
    }

    @Override
    public <S extends Account> List<S> findAll(Example<S> example) {
        return adao.findAll(example);
    }

    @Override
    public <S extends Account> List<S> findAll(Example<S> example, Sort sort) {
        return adao.findAll(example, sort);
    }

    @Override
    public List<Account> findByUsernameContaining(String username) {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public List<Account> getAdministrators() {
        return adao.getAdministratiors();
    }

    // Luu vào CSDL
    @Override
    public void loginFormOAuth2(OAuth2AuthenticationToken oauth2) {
        // // Lấy tất cả các thuộc tính của người dùng
        // Map<String, Object> attributes = oauth2.getPrincipal().getAttributes();
        // // In ra console
        // for (Map.Entry<String, Object> entry : attributes.entrySet()) {
        // String key = entry.getKey();
        // Object value = entry.getValue();
        // System.out.println(key + ": " + value);
        // }
        String email = oauth2.getPrincipal().getAttribute("email");
        String username = email.substring(0, email.indexOf("@")).trim();
        String password = Long.toHexString(System.currentTimeMillis());
        String address = oauth2.getPrincipal().getAttribute("address");
        String fullname = oauth2.getPrincipal().getAttribute("name");
        String phone = oauth2.getPrincipal().getAttribute("phone");
        // String picture = oauth2.getPrincipal().getAttribute("picture");
        String id = oauth2.getPrincipal().getAttribute("sub");

        // Tạo tài khoản mới từ thông tin được truyền vào
        Account account = new Account();
        account.setUsername(username);
        account.setPassword(password);
        account.setFullname(fullname);
        account.setEmail(email);
        account.setAddress(address);
        // account.setImage(picture); // thêm ảnh
        account.setImage("noimage2.png");
        account.setTelePhone(phone);

        // Thêm quyền vào tài khoản
        List<Authority> authorities = account.getAuthorities();
        if (authorities == null) {
            authorities = new ArrayList<Authority>();
            account.setAuthorities(authorities);
        }
        Role role = new Role();
        if (username.equals("thucfc2002")) {
            role.setRoleId("DIRE");
        } else {
            role.setRoleId("CUST");
        }
        Authority authority = new Authority();
        authority.setAccount(account);
        authority.setRole(role);
        authorities.add(authority);

        // Lưu thông tin tài khoản vào trong CSDL
        accountService.save(account);

        // Đánh dấu việc đăng nhập thành công bằng cách set đối tượng Authentication vào
        // trong SecurityContextHolder
        UserDetails user = User.withUsername(username).password(password).roles(role.getRoleId()).build();
        Authentication auth = new UsernamePasswordAuthenticationToken(user, null, user.getAuthorities());
        SecurityContextHolder.getContext().setAuthentication(auth);
    }

    // reset password
    public void updateResetPasswordToken(String token, String email) {
        Account account = adao.findByEmail(email);

        if (account != null) {
            account.setReset_password(token);
            adao.save(account);
        }
    }

    public Account get(String resetPasswordToken) {
        return adao.findByResetPasswordToken(resetPasswordToken);
    }

    public void updatePassword(Account account, String newPassword) {
        // BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        // String encodepassword = passwordEncoder.encode(newPassword);

        account.setPassword(newPassword);
        account.setReset_password(null);

        adao.save(account);
    }

    @Override
    public Account findByUsername(String username) {
        return adao.findByUsername(username);
    }

    @Override
    public long countByFullnameContaining(String fullname) {
        return adao.countByFullnameContaining(fullname);
    }

}
