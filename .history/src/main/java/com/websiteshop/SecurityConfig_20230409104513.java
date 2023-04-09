package com.websiteshop;

import java.util.NoSuchElementException;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.client.registration.ClientRegistrationRepository;
import org.springframework.security.oauth2.client.registration.InMemoryClientRegistrationRepository;

import com.websiteshop.entity.Account;
import com.websiteshop.model.FacebookClientRegistration;
import com.websiteshop.model.FacebookOAuth2UserService;
import com.websiteshop.service.AccountService;
import com.websiteshop.service.CustomerService;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    AccountService accountService;
    @Autowired
    BCryptPasswordEncoder pe;

    // Ma hoa password
    @Bean
    public BCryptPasswordEncoder getPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }

    // Cung cap du lieu dang nhap
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(username -> {
            try {
                Optional<Account> user = accountService.findById(username);
                String password = pe.encode(user.get().getPassword());
                String[] roles = user.get().getAuthorities().stream()
                        .map(er -> er.getRole().getRoleId())
                        .collect(Collectors.toList()).toArray(new String[0]);
                return User.withUsername(username).password(password).roles(roles).build();
            } catch (NoSuchElementException e) {
                throw new UsernameNotFoundException(username + "not Found");
            }
        });
    }

    // Phan quyen su dung

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().disable();
        http.authorizeRequests()
                .antMatchers("/assets/**", "/admin/dist/**").permitAll()
                .antMatchers("/orderHistory/**", "/favorite/**", "/comments/**").authenticated()
                .antMatchers("/admin/**").hasAnyRole("STAF", "DIRE")
                .antMatchers("/authority", "/security/statitic", "/statistical").hasRole("DIRE")
                .anyRequest().permitAll()
                .and().oauth2Login()
                .loginPage("/security/login/form")
                .userInfoEndpoint()
                .userService(facebookOAuth2UserService());

        http.formLogin()
                .loginPage("/security/login/form")
                .loginProcessingUrl("/security/login")
                .defaultSuccessUrl("/security/login/success", false)
                .failureUrl("/security/login/error");

        http.rememberMe().tokenValiditySeconds(86400);

        http.exceptionHandling().accessDeniedPage("/security/unauthoried");

        http.logout()
                .logoutUrl("/security/logoff")
                .logoutSuccessUrl("/security/logoff/success");

        http.oauth2Login()
                .loginPage("/security/login/form")
                .defaultSuccessUrl("/oauth2/login/success", true)
                .failureUrl("/security/login/error")
                .authorizationEndpoint()
                .baseUri("/oauth2/authorization")
                .and()
                .loginProcessingUrl("/oauth2/login/facebook")
                .userInfoEndpoint()
                .userService(facebookOAuth2UserService())
                .and()
                .defaultSuccessUrl("/oauth2/login/success", true);

    }

    @Bean
    public ClientRegistrationRepository clientRegistrationRepository() {
        return new InMemoryClientRegistrationRepository(
                FacebookClientRegistration.clientRegistration());
    }

    private ClientRegistration facebookClientRegistration() {
        return ClientRegistration.withRegistrationId("Facebook")
                .clientId("<your-client-id>")
                .clientSecret("<your-client-secret>")
                .authorizationGrantType(AuthorizationGrantType.AUTHORIZATION_CODE)
                .redirectUriTemplate("{baseUrl}/login/oauth2/code/{registrationId}")
                .scope("email")
                .authorizationUri("https://www.facebook.com/v3.0/dialog/oauth")
                .tokenUri("https://graph.facebook.com/v3.0/oauth/access_token")
                .userInfoUri("https://graph.facebook.com/me")
                .userNameAttributeName(IdTokenClaimNames.SUB)
                .clientName("Facebook")
                .authorizationEndpoint(authorization -> authorization.baseUri("/oauth2/authorization/Facebook"))
                .build();
    }

    Trong ví
    dụ này, chúng
    ta đã
    sử dụng
    phương thức

    authorizationEndpoint() để cấu hình lại endpoint cho Facebook OAuth2 thành /oauth2/authorization/Facebook. Bạn có thể sửa lại clientId, clientSecret và scope tương ứng với ứng dụng của bạn.

    @Bean
    public FacebookOAuth2UserService facebookOAuth2UserService() {
        return new FacebookOAuth2UserService();
    }

    // Cho phep truy xuat Rest API ben ngoai Domain khac
    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers(HttpMethod.OPTIONS, "/**");
    }

}