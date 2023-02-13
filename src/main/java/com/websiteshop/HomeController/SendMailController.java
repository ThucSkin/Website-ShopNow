package com.websiteshop.HomeController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SendMailController {
    @Autowired
    JavaMailSender javaMailSender;

    @RequestMapping("/user/SendMail")
    public String index() {
        return "/SendMail/index";
    }

    @RequestMapping("/user/send")
    public String send(Model model,
            @RequestParam("to") String to,
            @RequestParam("subject") String subject,
            @RequestParam("content") String content) {

        SimpleMailMessage msg = new SimpleMailMessage();
        msg.setTo(to);
        msg.setSubject(subject);
        msg.setText(content);

        javaMailSender.send(msg);
        model.addAttribute("message", "Đã gửi email thành công!");
        return "/SendMail/index";
    }
}
