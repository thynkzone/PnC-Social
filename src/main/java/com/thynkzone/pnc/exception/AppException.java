package com.thynkzone.pnc.exception;

/**
 * Domain application exception demonstrating Java 25 Flexible Constructor Bodies (JEP 513).
 * Statements (parameter validation and calculation) execute before the super(...) constructor call.
 */
public class AppException extends RuntimeException {

    private final String errorCode;

    public AppException(String errorCode, String detail) {
        // JEP 513: Flexible constructor body - pre-super validation & calculation
        String normalizedCode = (errorCode == null || errorCode.isBlank()) ? "PNC_ERROR" : errorCode.trim().toUpperCase();
        String message = String.format("[%s] %s", normalizedCode, detail != null ? detail : "Unspecified error");
        super(message);
        this.errorCode = normalizedCode;
    }

    public String getErrorCode() {
        return errorCode;
    }
}
