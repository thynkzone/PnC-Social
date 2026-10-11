package com.thynkzone.pnc.util;

import org.springframework.stereotype.Component;

import java.util.regex.Pattern;

@Component
public final class InputSanitizer {

    private static final Pattern SCRIPT_PATTERN = Pattern.compile("(?i)<script.*?>.*?</script.*?>");
    private static final Pattern TAG_PATTERN = Pattern.compile("(?i)<[/]?[a-z][a-z0-9]*[^<>]*>");
    private static final Pattern JS_PROTOCOL_PATTERN = Pattern.compile("(?i)javascript:");
    private static final Pattern EVENT_HANDLER_PATTERN = Pattern.compile("(?i)on[a-z]+\\s*=");

    public static String sanitizeText(String input) {
        if (input == null) return null;
        String cleaned = SCRIPT_PATTERN.matcher(input).replaceAll("");
        cleaned = JS_PROTOCOL_PATTERN.matcher(cleaned).replaceAll("");
        cleaned = EVENT_HANDLER_PATTERN.matcher(cleaned).replaceAll("");
        return cleaned.trim();
    }

    public static String escapeHtml(String input) {
        if (input == null) return null;
        StringBuilder sb = new StringBuilder(input.length() + 16);
        for (int i = 0; i < input.length(); i++) {
            char c = input.charAt(i);
            switch (c) {
                case '<' -> sb.append("&lt;");
                case '>' -> sb.append("&gt;");
                case '&' -> sb.append("&amp;");
                case '"' -> sb.append("&quot;");
                case '\'' -> sb.append("&#x27;");
                default -> sb.append(c);
            }
        }
        return sb.toString();
    }
}
