package com.thynkzone.pnc.util;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.http.ResponseCookie;
import org.springframework.stereotype.Component;

import java.time.Duration;

@Component
public class CookieHelper {

    public static final String COOKIE_D = "Thynkzoned";
    public static final String COOKIE_A = "Thynkzonea";

    public String getCookieValue(HttpServletRequest request, String name) {
        if (request == null || request.getCookies() == null) {
            return null;
        }
        for (Cookie cookie : request.getCookies()) {
            if (name.equalsIgnoreCase(cookie.getName())) {
                return cookie.getValue();
            }
        }
        return null;
    }

    public void setSessionCookies(HttpServletResponse response, String tokenD, String tokenA) {
        ResponseCookie cookieD = ResponseCookie.from(COOKIE_D, tokenD)
                .path("/")
                .httpOnly(true)
                .secure(false) // Will be true in production HTTPS
                .sameSite("Lax")
                .maxAge(Duration.ofDays(14))
                .build();

        ResponseCookie cookieA = ResponseCookie.from(COOKIE_A, tokenA)
                .path("/")
                .httpOnly(true)
                .secure(false)
                .sameSite("Lax")
                .maxAge(Duration.ofDays(14))
                .build();

        response.addHeader("Set-Cookie", cookieD.toString());
        response.addHeader("Set-Cookie", cookieA.toString());
    }

    public void clearSessionCookies(HttpServletResponse response) {
        ResponseCookie cookieD = ResponseCookie.from(COOKIE_D, "")
                .path("/")
                .httpOnly(true)
                .maxAge(0)
                .build();

        ResponseCookie cookieA = ResponseCookie.from(COOKIE_A, "")
                .path("/")
                .httpOnly(true)
                .maxAge(0)
                .build();

        response.addHeader("Set-Cookie", cookieD.toString());
        response.addHeader("Set-Cookie", cookieA.toString());
    }
}
