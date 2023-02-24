package com.websiteshop;

import javax.servlet.http.HttpServletRequest;

//loại bỏ phần đuôi của URL
public class Utility {
    public static String getSiteURL(HttpServletRequest request) {
        String siteURL = request.getRequestURL().toString();
        return siteURL.replace(request.getServletPath(), "");
    }
}
