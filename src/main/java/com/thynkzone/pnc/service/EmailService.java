package com.thynkzone.pnc.service;

public interface EmailService {

    void sendVerificationEmail(String recipientEmail, String verificationCode);

    void sendPasswordResetEmail(String recipientEmail, String resetCode);
}
