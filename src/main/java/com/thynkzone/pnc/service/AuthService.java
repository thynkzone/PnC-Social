package com.thynkzone.pnc.service;

import com.thynkzone.pnc.dto.AuthResponse;
import com.thynkzone.pnc.dto.LoginRequest;
import com.thynkzone.pnc.dto.SignupRequest;
import com.thynkzone.pnc.dto.VerifyCodeRequest;
import com.thynkzone.pnc.entity.User;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface AuthService {

    AuthResponse register(SignupRequest request);

    AuthResponse verifyCode(VerifyCodeRequest request, HttpServletResponse response);

    AuthResponse login(LoginRequest request, HttpServletResponse response);

    void logout(HttpServletResponse response);

    User getCurrentUser(HttpServletRequest request);

    String getCurrentUserId(HttpServletRequest request);
}
