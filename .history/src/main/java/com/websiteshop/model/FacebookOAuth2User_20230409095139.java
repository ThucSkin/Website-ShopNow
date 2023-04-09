package com.websiteshop.model;

import java.util.Collection;
import java.util.Map;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.oauth2.core.user.OAuth2User;

public class FacebookOAuth2User implements OAuth2User {

    private OAuth2User user;

    public FacebookOAuth2User(OAuth2User user) {
        this.user = user;
    }

    @Override
    public Map<String, Object> getAttributes() {
        return user.getAttributes();
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return user.getAuthorities();
    }

    @Override
    public String getName() {
        return user.getAttribute("name");
    }

    public String getEmail() {
        return user.getAttribute("email");
    }

    public String getPictureUrl() {
        return ((Map<String, Object>) ((Map<String, Object>) user.getAttributes().get("picture")).get("data"))
                .get("url").toString();
    }

}
