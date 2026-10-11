package com.thynkzone.pnc.service.impl;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.thynkzone.pnc.service.EmailService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.time.Duration;
import java.util.List;
import java.util.Map;

@Service
public class BrevoEmailServiceImpl implements EmailService {

    private static final Logger log = LoggerFactory.getLogger(BrevoEmailServiceImpl.class);
    private static final String BREVO_API_URL = "https://api.brevo.com/v3/smtp/email";

    private final HttpClient httpClient;
    private final ObjectMapper objectMapper;

    @Value("${brevo.api.key:}")
    private String brevoApiKey;

    @Value("${brevo.sender.name:People & Culture}")
    private String senderName;

    @Value("${brevo.sender.email:team@thynkzone.eu.org}")
    private String senderEmail;

    public BrevoEmailServiceImpl(ObjectMapper objectMapper) {
        this.objectMapper = objectMapper;
        this.httpClient = HttpClient.newBuilder()
                .connectTimeout(Duration.ofSeconds(10))
                .build();
    }

    @Override
    public void sendVerificationEmail(String recipientEmail, String verificationCode) {
        String subject = "P&C - Email Verification Code";
        String htmlContent = String.format("""
            <div style="font-family: Arial, sans-serif; padding: 20px; background-color: #18181b; color: #ffffff; border-radius: 8px;">
                <h2 style="color: #1da1f2;">Welcome to People &amp; Culture!</h2>
                <p style="color: #b0b3b8;">Thank you for registering. Use the code below to complete your sign-up:</p>
                <div style="background-color: #23232a; padding: 16px; border-radius: 6px; font-size: 24px; font-weight: bold; letter-spacing: 4px; color: #1da1f2; text-align: center; margin: 20px 0;">
                    %s
                </div>
                <p style="color: #888; font-size: 12px;">If you did not request this, please ignore this email.</p>
            </div>
            """, verificationCode);

        sendEmailViaRest(recipientEmail, subject, htmlContent);
    }

    @Override
    public void sendPasswordResetEmail(String recipientEmail, String resetCode) {
        String subject = "P&C - Password Reset Code";
        String htmlContent = String.format("""
            <div style="font-family: Arial, sans-serif; padding: 20px; background-color: #18181b; color: #ffffff; border-radius: 8px;">
                <h2 style="color: #1da1f2;">Password Reset Request</h2>
                <p style="color: #b0b3b8;">Use the recovery verification code below to reset your password:</p>
                <div style="background-color: #23232a; padding: 16px; border-radius: 6px; font-size: 24px; font-weight: bold; letter-spacing: 4px; color: #e0245e; text-align: center; margin: 20px 0;">
                    %s
                </div>
                <p style="color: #888; font-size: 12px;">If you did not request this reset, your account remains secure.</p>
            </div>
            """, resetCode);

        sendEmailViaRest(recipientEmail, subject, htmlContent);
    }

    private void sendEmailViaRest(String toEmail, String subject, String htmlContent) {
        if (brevoApiKey == null || brevoApiKey.isBlank()) {
            log.warn("BREVO_API_KEY is not configured. Email dispatch skipped for [{}], subject: [{}]", toEmail, subject);
            return;
        }

        try {
            Map<String, Object> payload = Map.of(
                    "sender", Map.of("name", senderName, "email", senderEmail),
                    "to", List.of(Map.of("email", toEmail)),
                    "subject", subject,
                    "htmlContent", htmlContent
            );

            String requestBody = objectMapper.writeValueAsString(payload);

            HttpRequest request = HttpRequest.newBuilder()
                    .uri(URI.create(BREVO_API_URL))
                    .timeout(Duration.ofSeconds(15))
                    .header("api-key", brevoApiKey)
                    .header("Content-Type", "application/json")
                    .header("Accept", "application/json")
                    .POST(HttpRequest.BodyPublishers.ofString(requestBody))
                    .build();

            HttpResponse<String> response = httpClient.send(request, HttpResponse.BodyHandlers.ofString());

            if (response.statusCode() >= 200 && response.statusCode() < 300) {
                log.info("Successfully sent email via Brevo REST API to [{}]. Status: {}", toEmail, response.statusCode());
            } else {
                log.error("Failed to send email via Brevo REST API to [{}]. Status: {}, Response: {}",
                        toEmail, response.statusCode(), response.body());
            }
        } catch (Exception e) {
            log.error("Exception while sending transactional email via Brevo REST API to [{}]", toEmail, e);
        }
    }
}
