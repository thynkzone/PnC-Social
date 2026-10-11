package com.thynkzone.pnc.service.impl;

import com.thynkzone.pnc.dto.AuthResponse;
import com.thynkzone.pnc.dto.LoginRequest;
import com.thynkzone.pnc.dto.SignupRequest;
import com.thynkzone.pnc.dto.VerifyCodeRequest;
import com.thynkzone.pnc.entity.User;
import com.thynkzone.pnc.entity.UserProfile;
import com.thynkzone.pnc.repository.UserProfileRepository;
import com.thynkzone.pnc.repository.UserRepository;
import com.thynkzone.pnc.service.AuthService;
import com.thynkzone.pnc.util.CookieHelper;
import com.thynkzone.pnc.util.PasswordSecurity;
import com.thynkzone.pnc.util.UidGenerator;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.Map;
import java.util.Optional;
import java.util.concurrent.ConcurrentHashMap;

@Service
public class AuthServiceImpl implements AuthService {

    private static final Logger log = LoggerFactory.getLogger(AuthServiceImpl.class);

    private final UserRepository userRepository;
    private final UserProfileRepository userProfileRepository;
    private final PasswordSecurity passwordSecurity;
    private final CookieHelper cookieHelper;
    private final com.thynkzone.pnc.service.EmailService emailService;

    // In-memory pending verification registrations (can be backed by DB/Cache)
    private final Map<String, PendingSignup> pendingSignups = new ConcurrentHashMap<>();

    private record PendingSignup(String email, String passwordHash, String recoveryCode, String verificationCode) {}

    public AuthServiceImpl(UserRepository userRepository,
                           UserProfileRepository userProfileRepository,
                           PasswordSecurity passwordSecurity,
                           CookieHelper cookieHelper,
                           com.thynkzone.pnc.service.EmailService emailService) {
        this.userRepository = userRepository;
        this.userProfileRepository = userProfileRepository;
        this.passwordSecurity = passwordSecurity;
        this.cookieHelper = cookieHelper;
        this.emailService = emailService;
    }

    @Override
    public AuthResponse register(SignupRequest request) {
        if (userRepository.existsByEmail(request.email())) {
            throw new IllegalArgumentException("An account with this email already exists.");
        }

        String verificationCode = UidGenerator.generateRandomCode();
        String passwordHash = passwordSecurity.hashPassword(request.password());

        log.info("Signup verification code for [{}]: {}", request.email(), verificationCode);

        pendingSignups.put(request.email().toLowerCase().trim(),
                new PendingSignup(request.email(), passwordHash, request.recoveryCode(), verificationCode));

        // Dispatch transactional email via Brevo REST API
        emailService.sendVerificationEmail(request.email(), verificationCode);

        return new AuthResponse(null, request.email(), null, null, false, null);
    }

    @Override
    @Transactional
    public AuthResponse verifyCode(VerifyCodeRequest request, HttpServletResponse response) {
        String email = request.email().toLowerCase().trim();
        PendingSignup pending = pendingSignups.get(email);

        if (pending == null) {
            throw new IllegalArgumentException("No pending registration found for this email. Please register again.");
        }

        if (!pending.verificationCode().equals(request.code().trim())) {
            throw new IllegalArgumentException("Invalid verification code. Please check and try again.");
        }

        String uid = UidGenerator.generateId();
        User user = new User(uid, pending.email(), pending.passwordHash(), pending.recoveryCode());

        String tokenD = UidGenerator.generateToken();
        String tokenA = UidGenerator.generateToken();
        user.setSessionD(tokenD);
        user.setSessionA(tokenA);
        user.setLastLoginDate(Integer.parseInt(LocalDate.now().toString().replace("-", "")));

        userRepository.save(user);

        // Initialize UserProfile
        UserProfile profile = new UserProfile(uid);
        profile.setFullName("New User");
        profile.setProfilePic("prof.png");
        userProfileRepository.save(profile);

        pendingSignups.remove(email);

        cookieHelper.setSessionCookies(response, tokenD, tokenA);

        return new AuthResponse(uid, email, profile.getFullName(), profile.getProfilePic(), false, tokenD);
    }

    @Override
    @Transactional
    public AuthResponse login(LoginRequest request, HttpServletResponse response) {
        String email = request.email().toLowerCase().trim();
        User user = userRepository.findByEmail(email)
                .orElseThrow(() -> new IllegalArgumentException("Invalid email or password."));

        if (user.getFailedAttempts() >= 15) {
            throw new IllegalStateException("Account temporarily locked due to too many failed login attempts. Please reset your password.");
        }

        boolean matches = passwordSecurity.matches(request.password(), user.getPasswordHash());

        if (!matches) {
            user.setFailedAttempts(user.getFailedAttempts() + 1);
            userRepository.save(user);
            throw new IllegalArgumentException("Invalid email or password.");
        }

        // Reset failed attempts on successful login
        user.setFailedAttempts(0);
        String tokenD = UidGenerator.generateToken();
        String tokenA = UidGenerator.generateToken();
        user.setSessionD(tokenD);
        user.setSessionA(tokenA);
        user.setLastLoginDate(Integer.parseInt(LocalDate.now().toString().replace("-", "")));
        userRepository.save(user);

        cookieHelper.setSessionCookies(response, tokenD, tokenA);

        UserProfile profile = userProfileRepository.findById(user.getId())
                .orElseGet(() -> new UserProfile(user.getId()));

        boolean profileComplete = profile.getFullName() != null && !profile.getFullName().isBlank() && !profile.getFullName().equals("New User");

        return new AuthResponse(user.getId(), user.getEmail(), profile.getFullName(), profile.getProfilePic(), profileComplete, tokenD);
    }

    @Override
    public void logout(HttpServletResponse response) {
        cookieHelper.clearSessionCookies(response);
    }

    @Override
    public User getCurrentUser(HttpServletRequest request) {
        String tokenD = cookieHelper.getCookieValue(request, CookieHelper.COOKIE_D);
        String tokenA = cookieHelper.getCookieValue(request, CookieHelper.COOKIE_A);

        if (tokenD == null || tokenA == null) {
            return null;
        }

        return userRepository.findBySessionDAndSessionA(tokenD, tokenA).orElse(null);
    }

    @Override
    public String getCurrentUserId(HttpServletRequest request) {
        User user = getCurrentUser(request);
        return user != null ? user.getId() : null;
    }
}
