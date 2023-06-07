package com.websiteshop.HomeController;

import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.beans.BeanUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;

import com.websiteshop.entity.Account;
import com.websiteshop.model.AccountDto;
import com.websiteshop.service.AccountService;
import com.websiteshop.service.StorageService;

@Controller
public class InfoController {
    @Autowired
    AccountService accountService;
    @Autowired
    StorageService storageService;

    @RequestMapping("/info/{username}")
    public String info(Model model, @PathVariable("username") String username) {
        Account acc = accountService.findById(username).get();
        model.addAttribute("info", acc);
        return "user/info";
    }

    @RequestMapping("/info/edit/{username}")
    public String edit(ModelMap model, @PathVariable("username") String username) {

        Optional<Account> opt = accountService.findById(username);
        AccountDto dto = new AccountDto();

        if (opt.isPresent()) {
            Account acc = opt.get();
            BeanUtils.copyProperties(acc, dto);

            model.addAttribute("account", dto);
            return "user/edit";
        }

        model.addAttribute("message", "Lỗi thiết lập tài khoản!");

        return "forward:/info/edit";
    }

    @PostMapping("/info/saveOrUpdate")
    public String saveOrUpdate(ModelMap model,
            @ModelAttribute("account") AccountDto dto, BindingResult result) {

        if (result.hasErrors()) {
            return "/user/edit";
        }
        Account acc = new Account();
        BeanUtils.copyProperties(dto, acc);

        if (!dto.getImageFile().isEmpty()) {
            acc.setImage(storageService.getStoredFilename(dto.getImageFile(),
                    dto.getImageFile().getOriginalFilename()));
            storageService.store(dto.getImageFile(), acc.getImage());
        }

        accountService.save(acc);
        model.addAttribute("message", "Lưu thành công!");
        return "user/edit";
    }

    @GetMapping("/info/images/{filename:.+}")
    @ResponseBody
    public ResponseEntity<Resource> serveFile(@PathVariable String filename) {
        Resource file = storageService.loadAsResource(filename);
        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + file.getFilename() + "\"")
                .body(file);
    }

    @GetMapping("/user/image")
    public ResponseEntity<String> getUserImage() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication.getName();

        Account user = accountService.findByUsername(username);
        if (user != null && user.getImage() != null) {
            return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(user.getImage());

        } else {
            return ResponseEntity.notFound().build();
        }

    }
}
