package com.websiteshop.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserService;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Component;
import java.util.ArrayList;
import java.util.List;
import org.springframework.security.core.context.SecurityContextHolder;
import com.websiteshop.entity.Account;
import com.websiteshop.entity.Authority;
import com.websiteshop.entity.Role;
import com.websiteshop.service.AccountService;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;

@Component
public class FacebookOAuth2UserService implements OAuth2UserService<OAuth2UserRequest, OAuth2User> {
    @Autowired
    AccountService accountService;

    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
        OAuth2UserService<OAuth2UserRequest, OAuth2User> delegate = new DefaultOAuth2UserService();
        OAuth2User oAuth2User = delegate.loadUser(userRequest);

        // Lấy thông tin cần thiết từ OAuth2User
        String username = oAuth2User.getAttribute("name");
        String password = Long.toHexString(System.currentTimeMillis());

        // Tạo tài khoản mới từ thông tin được truyền vào
        Account account = new Account();
        account.setUsername(username);
        account.setPassword(password);
        account.setEmail(oAuth2User.getAttribute("email"));
        account.setFullname(oAuth2User.getAttribute("name"));
        account.setAddress(oAuth2User.getAttribute("address")); // thêm địa chỉ
        account.setImage(oAuth2User.getAttribute("picture")); // thêm ảnh
        account.setTelePhone(oAuth2User.getAttribute("phone"));
        // Thêm quyền vào tài khoản
        List<Authority> authorities = account.getAuthorities();
        if (authorities == null) {
            authorities = new ArrayList<Authority>();
            account.setAuthorities(authorities);
        }
        Role role = new Role();
        role.setRoleId("CUST");
        Authority authority = new Authority();
        authority.setAccount(account);
        authority.setRole(role);
        authorities.add(authority);

        // Lưu thông tin tài khoản vào trong CSDL
        accountService.save(account);

        // Đánh dấu việc đăng nhập thành công bằng cách set đối tượng Authentication vào
        // trong SecurityContextHolder
        UserDetails user = User.withUsername(username).password(password).roles("CUST").build();
        Authentication auth = new UsernamePasswordAuthenticationToken(user, "N/A", user.getAuthorities());
        SecurityContextHolder.getContext().setAuthentication(auth);

        return oAuth2User;
    }

}
