package com.thynkzone.jsp;

import java.util.UUID;

public class uidgen {
	
	public static String id() {
		final String uuid = UUID.randomUUID().toString();
		return uuid;
	}
}
