package com.websiteshop.AdminController;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.websiteshop.dao.AuthorityDAO;
import com.websiteshop.entity.Authority;
import com.websiteshop.entity.Feedback;
import com.websiteshop.model.AccountDto;
import com.websiteshop.model.AuthorityDto;
import com.websiteshop.service.AccountService;
import com.websiteshop.service.AuthorityService;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

@Controller
@RequestMapping({ "/authority", "/admin/authority" })
public class AuthorityController {
    @Autowired
    AuthorityService authorityService;

    @Autowired
    AuthorityDAO audao;

    @Autowired
    AccountService accountService;

    @ModelAttribute("accounts")
    public List<AccountDto> getAccounts() {
        return accountService.findAll().stream().map(item -> {
            AccountDto dto = new AccountDto();
            BeanUtils.copyProperties(item, dto);
            return dto;
        }).collect(Collectors.toList());
    }

    @GetMapping("")
    public String search(ModelMap model,
            @RequestParam(name = "username", required = false) String username,
            @RequestParam("page") Optional<Integer> page,
            @RequestParam("size") Optional<Integer> size) {
        int currentPage = page.orElse(1);
        int pageSize = size.orElse(5);
        Pageable pageable = PageRequest.of(currentPage - 1, pageSize, Sort.by("id").descending());
        Page<Authority> resultPage = null;

        if (username != null && StringUtils.hasText(username)) {
            resultPage = audao.findByAccountUsername(username, pageable);
            model.addAttribute("username", username);
            long totalSize = audao.countByAccountUsername(username);
            model.addAttribute("totalSize", totalSize);
        } else {
            resultPage = audao.findAll(pageable);
            List<Authority> feedbackList = authorityService.findAll();
            int totalSize = feedbackList.size();
            model.addAttribute("totalSize", totalSize);
        }

        int totalPages = resultPage.getTotalPages();
        if (totalPages > 0) {
            int start = Math.max(1, currentPage - 2);
            int end = Math.min(currentPage + 2, totalPages);

            if (totalPages > 5) {
                if (end == totalPages)
                    start = end - 5;
                else if (start == 1)
                    end = start + 5;
            }
            List<Integer> pageNumbers = IntStream.rangeClosed(start, end)
                    .boxed()
                    .collect(Collectors.toList());
            model.addAttribute("pageNumbers", pageNumbers);
        }

        model.addAttribute("authorityPage", resultPage);
        return "admin/authority/list";
    }

    @GetMapping("add")
    public String add(Model model) {
        AuthorityDto dto = new AuthorityDto();
        dto.setIsEdit(false);
        model.addAttribute("authority", dto);
        return "admin/authority/addOrEdit";
    }

    @GetMapping("edit/{id}")
    public ModelAndView edit(ModelMap model, @PathVariable("id") Integer id) {

        Optional<Authority> opt = authorityService.findById(id);
        AuthorityDto dto = new AuthorityDto();

        if (opt.isPresent()) {
            Authority au = opt.get();
            BeanUtils.copyProperties(au, dto);
            dto.setIsEdit(true);

            model.addAttribute("authority", dto);
            return new ModelAndView("/admin/authority/addOrEdit", model);
        }

        model.addAttribute("message", "Tài khoản không tồn tại");

        return new ModelAndView("forward:/authority", model);
    }

    @PostMapping("saveOrUpdate")
    public ModelAndView saveOrUpdate(ModelMap model,
            @ModelAttribute("authority") AuthorityDto dto, BindingResult result) {

        try {
            if (result.hasErrors()) {
                model.addAttribute("message", "Không tìm thấy tài khoản!");
                return new ModelAndView("admin/authority/addOrEdit", model);
            }
            Authority au = new Authority();
            BeanUtils.copyProperties(dto, au);

            authorityService.save(au);
            model.addAttribute("message", "Cấp quyền thành công!");
            return new ModelAndView("admin/authority/addOrEdit", model);
        } catch (Exception e) {
            model.addAttribute("message", "Đã tồn tại quyền truy cập!");
            return new ModelAndView("admin/authority/addOrEdit", model);
        }
    }

    @GetMapping("delete/{id}")
    public ModelAndView delete(ModelMap model,
            @PathVariable("id") Integer id) {
        Optional<Authority> opt = authorityService.findById(id);

        try {
            if (opt.isPresent()) {
                authorityService.delete(opt.get());
                model.addAttribute("message", "Tài khoản đã bị tướt quyền!");
            } else {
                model.addAttribute("message", "Không tìm thấy tài khoản!");
                return new ModelAndView("forward:/authority", model);
            }
        } catch (Exception e) {
            model.addAttribute("message", "Không tìm thấy tài khoản!");
            return new ModelAndView("forward:/authority", model);
        }

        return new ModelAndView("forward:/authority", model);
    }

}
