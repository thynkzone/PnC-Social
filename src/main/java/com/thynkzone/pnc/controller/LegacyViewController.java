package com.thynkzone.pnc.controller;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LegacyViewController {

    @GetMapping({"/", "/index.jsp"})
    public String index() {
        return "forward:/index.html";
    }

    @GetMapping("/login.jsp")
    public String login() {
        return "forward:/login.html";
    }

    @GetMapping("/signup.jsp")
    public String signup() {
        return "forward:/signup.html";
    }

    @GetMapping("/verify-code.jsp")
    public String verifyCode() {
        return "forward:/verify-code.html";
    }

    @GetMapping("/profile.jsp")
    public String profile() {
        return "forward:/profile.html";
    }

    @GetMapping("/settings.jsp")
    public String settings() {
        return "forward:/settings.html";
    }

    @GetMapping("/following.jsp")
    public String following() {
        return "forward:/following.html";
    }

    @GetMapping("/post-updates.jsp")
    public String postUpdates() {
        return "forward:/post-updates.html";
    }

    @GetMapping("/add-information.jsp")
    public String addInformation() {
        return "forward:/add-information.html";
    }

    @GetMapping("/search-user.jsp")
    public String searchUser() {
        return "forward:/search-user.html";
    }

    @GetMapping("/view-all-requests.jsp")
    public String viewRequests() {
        return "forward:/view-all-requests.html";
    }

    @GetMapping("/about-us.jsp")
    public String aboutUs() {
        return "forward:/about-us.html";
    }

    @GetMapping("/support.jsp")
    public String support() {
        return "forward:/support.html";
    }

    @GetMapping("/terms-and-conditions.jsp")
    public String terms() {
        return "forward:/terms-and-conditions.html";
    }

    @GetMapping({"/advertisements.jsp", "/advertisements.html", "/manage-ads.jsp"})
    public String advertisements() {
        return "forward:/advertisements.html";
    }

    @GetMapping({"/forgot-password.jsp", "/forgot-password.html", "/reset-password.jsp", "/reset-password.html", "/forgot.jsp", "/forgot.html"})
    public String forgotPassword() {
        return "forward:/forgot-password.html";
    }
}
