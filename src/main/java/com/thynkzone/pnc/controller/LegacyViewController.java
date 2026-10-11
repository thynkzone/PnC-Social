package com.thynkzone.pnc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LegacyViewController {

    @GetMapping({"/", "/index.jsp"})
    public String index() {
        return "forward:/index.html";
    }

    @GetMapping({"/login", "/login.jsp"})
    public String login() {
        return "forward:/login.html";
    }

    @GetMapping({"/signup", "/signup.jsp", "/register"})
    public String signup() {
        return "forward:/signup.html";
    }

    @GetMapping({"/verify-code", "/verify-code.jsp", "/verify"})
    public String verifyCode() {
        return "forward:/verify-code.html";
    }

    @GetMapping({"/profile", "/profile.jsp"})
    public String profile() {
        return "forward:/profile.html";
    }

    @GetMapping({"/settings", "/settings.jsp", "/update-profile-picture", "/update-profile-picture.jsp", 
                 "/update-background-picture", "/update-background-picture.jsp", "/personal.jsp"})
    public String settings() {
        return "forward:/settings.html";
    }

    @GetMapping({"/following", "/following.jsp", "/network"})
    public String following() {
        return "forward:/following.html";
    }

    @GetMapping({"/post-updates", "/post-updates.jsp", "/notifications"})
    public String postUpdates() {
        return "forward:/post-updates.html";
    }

    @GetMapping({"/add-information", "/add-information.jsp"})
    public String addInformation() {
        return "forward:/add-information.html";
    }

    @GetMapping({"/search-user", "/search-user.jsp", "/search"})
    public String searchUser() {
        return "forward:/search-user.html";
    }

    @GetMapping({"/view-all-requests", "/view-all-requests.jsp", "/requests"})
    public String viewRequests() {
        return "forward:/view-all-requests.html";
    }

    @GetMapping({"/about-us", "/about-us.jsp", "/about"})
    public String aboutUs() {
        return "forward:/about-us.html";
    }

    @GetMapping({"/support", "/support.jsp", "/help"})
    public String support() {
        return "forward:/support.html";
    }

    @GetMapping({"/terms-and-conditions", "/terms-and-conditions.jsp", "/terms", "/privacy"})
    public String terms() {
        return "forward:/terms-and-conditions.html";
    }

    // Do NOT include static .html target in forward mappings to avoid circular view dispatch
    @GetMapping({"/advertisements", "/advertisement", "/ads", "/advertisements.jsp", "/manage-ads.jsp", "/manage-ads"})
    public String advertisements() {
        return "forward:/advertisements.html";
    }

    @GetMapping({"/forgot-password", "/forgotpass", "/reset-password", "/forgot", 
                 "/forgot-password.jsp", "/reset-password.jsp", "/forgotpass.jsp", "/forgot.jsp", "/loginforgot.jsp"})
    public String forgotPassword() {
        return "forward:/forgot-password.html";
    }

    @GetMapping({"/people-you-may-know", "/people-you-may-know.jsp", "/suggestions"})
    public String peopleYouMayKnow() {
        return "forward:/people-you-may-know.html";
    }
}
