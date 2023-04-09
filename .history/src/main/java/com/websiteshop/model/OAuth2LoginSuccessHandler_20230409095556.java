package com.websiteshop.model;

@Component
public class OAuth2LoginSuccessHandler implements AuthenticationSuccessHandler {

    private final JwtTokenProvider tokenProvider;

    public OAuth2LoginSuccessHandler(JwtTokenProvider tokenProvider) {
        this.tokenProvider = tokenProvider;
    }

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws IOException, ServletException {
        // Thực hiện các xử lý cần thiết khi đăng nhập thành công
        // Ví dụ: tạo token JWT, lưu vào cookie, redirect đến trang chủ, ...
    }
}
