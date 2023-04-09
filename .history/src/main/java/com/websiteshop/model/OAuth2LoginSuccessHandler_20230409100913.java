package com.websiteshop.model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class OAuth2LoginSuccessHandler implements AuthenticationSuccessHandler<OAuth2UserRequest, OAuth2User> {

    private final Logger logger = LoggerFactory.getLogger(OAuth2LoginSuccessHandler.class);

    private final UserService userService;

    public OAuth2LoginSuccessHandler(UserService userService) {
        this.userService = userService;
    }

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws IOException, ServletException {

        logger.debug("OAuth2 login success");

        OAuth2User oauth2User = (OAuth2User) authentication.getPrincipal();
        String email = oauth2User.getAttribute("email");

        User user = userService.findByEmail(email);

        if (user == null) {
            user = new User();
            user.setEmail(email);
            user.setFirstName(oauth2User.getAttribute("given_name"));
            user.setLastName(oauth2User.getAttribute("family_name"));
            user.setEnabled(true);
            user.setRoles(Collections.singletonList(Role.USER));

            userService.save(user);
        }

        request.getSession().setAttribute("user", user);

        response.sendRedirect("/home");
    }
}
