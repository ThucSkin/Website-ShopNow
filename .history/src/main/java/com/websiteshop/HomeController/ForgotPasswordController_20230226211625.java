package com.websiteshop.HomeController;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMailMessage;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.websiteshop.Utility;
import com.websiteshop.entity.Account;
import com.websiteshop.service.AccountService;

import net.bytebuddy.utility.RandomString;

@Controller
public class ForgotPasswordController {
    @Autowired
    AccountService accountService;

    @Autowired
    private JavaMailSender javaMailSender;

    @GetMapping("/forgot_password")
    public String index(Model model) {
        return "/user/forgotPassword-css";
    }

    @PostMapping("/forgot_password")
    public String processForgotPassword(HttpServletRequest request, Model model) {
        String email = request.getParameter("email");
        String token = RandomString.make(50);

        try {
            accountService.updateResetPasswordToken(token, email);
            String resetPasswordLink = Utility.getSiteURL(request) + "/reset_password?token=" + token;
            sendEmail(email, resetPasswordLink);
            model.addAttribute("message",
                    "Chúng tôi đã gửi liên kết đặt lại mật khẩu tới email của bạn. Vui lòng kiểm tra.");

        } catch (UnsupportedEncodingException | MessagingException e) {
            model.addAttribute("error", "Lỗi khi gửi email");
        }

        return "/user/forgotPassword-css";
    }

    public void sendEmail(String recipientEmail, String link)
            throws MessagingException, UnsupportedEncodingException {
        MimeMessage message = javaMailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message);

        helper.setFrom("contact@shopme.com", "ShopNow Support");
        helper.setTo(recipientEmail);

        String subject = "Đây là liên kết để đặt lại mật khẩu của bạn";

        String content = "<p>Xin chào,</p>"
                + "<p>Bạn đã yêu cầu đặt lại mật khẩu của mình.</p>"
                + "<p>Nhấp vào liên kết bên dưới để thay đổi mật khẩu của bạn:</p>"
                + "<p><a href=\"" + link + "\">Thay đổi mật khẩu</a></p>"
                + "<br>"
                + "<p>Bỏ qua email này nếu bạn nhớ mật khẩu của mình, "
                + "hoặc bạn chưa thực hiện yêu cầu.</p>";

        helper.setSubject(subject);

        helper.setText(content, true);

        javaMailSender.send(message);
    }

    @GetMapping("/reset_password")
    public String showResetPasswordForm(@Param(value = "token") String token, Model model) {
        Account account = accountService.get(token);
        model.addAttribute("token", token);

        if (account == null) {
            model.addAttribute("message", "Invalid Token");
        }
        model.addAttribute("token", token);
        model.addAttribute("message", "Đặt lại mật khẩu");

        return "/user/resetPassword-css";
    }

    @PostMapping("/reset_password")
    public String processResetPassword(HttpServletRequest request, Model model) {
        String token = request.getParameter("token");
        String password = request.getParameter("password");

        Account account = accountService.get(token);

        if (account == null) {
            model.addAttribute("message", "Vui lòng gửi lại email trước khi thay đổi mật khẩu!");
        } else {
            accountService.updatePassword(account, password);
            model.addAttribute("message", "Đổi mật khẩu mới thành công.");
        }

        return "/user/resetPassword-css";
    }
}
