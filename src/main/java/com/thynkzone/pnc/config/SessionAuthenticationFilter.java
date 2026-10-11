package com.thynkzone.pnc.config;

import com.thynkzone.pnc.context.UserContextHolder;
import com.thynkzone.pnc.entity.User;
import com.thynkzone.pnc.repository.UserRepository;
import com.thynkzone.pnc.util.CookieHelper;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.util.Collections;
import java.util.Optional;

@Component
public class SessionAuthenticationFilter extends OncePerRequestFilter {

    private final UserRepository userRepository;
    private final CookieHelper cookieHelper;

    public SessionAuthenticationFilter(UserRepository userRepository, CookieHelper cookieHelper) {
        this.userRepository = userRepository;
        this.cookieHelper = cookieHelper;
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request,
                                    HttpServletResponse response,
                                    FilterChain filterChain) throws ServletException, IOException {

        String tokenD = cookieHelper.getCookieValue(request, CookieHelper.COOKIE_D);
        String tokenA = cookieHelper.getCookieValue(request, CookieHelper.COOKIE_A);

        String authenticatedUserId = null;

        if (tokenD != null && tokenA != null && SecurityContextHolder.getContext().getAuthentication() == null) {
            Optional<User> userOpt = userRepository.findBySessionDAndSessionA(tokenD, tokenA);
            if (userOpt.isPresent()) {
                User user = userOpt.get();
                authenticatedUserId = user.getId();
                UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(
                        user.getId(),
                        null,
                        Collections.singletonList(new SimpleGrantedAuthority("ROLE_USER"))
                );
                SecurityContextHolder.getContext().setAuthentication(authentication);
            }
        }

        if (authenticatedUserId != null) {
            final String finalUserId = authenticatedUserId;
            ScopedValue.where(UserContextHolder.CURRENT_USER_ID, finalUserId).run(() -> {
                try {
                    filterChain.doFilter(request, response);
                } catch (ServletException | IOException e) {
                    throw new RuntimeException(e);
                }
            });
        } else {
            filterChain.doFilter(request, response);
        }
    }
}
