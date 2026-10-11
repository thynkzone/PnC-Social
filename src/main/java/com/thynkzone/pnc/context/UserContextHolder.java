package com.thynkzone.pnc.context;

import java.lang.ScopedValue;

/**
 * Java 25 Scoped Values implementation for request context.
 * Replaces legacy ThreadLocal with lightweight, immutable, virtual-thread friendly ScopedValue.
 */
public final class UserContextHolder {

    public static final ScopedValue<String> CURRENT_USER_ID = ScopedValue.newInstance();

    private UserContextHolder() {
    }

    public static String getCurrentUserId() {
        return CURRENT_USER_ID.isBound() ? CURRENT_USER_ID.get() : null;
    }
}
