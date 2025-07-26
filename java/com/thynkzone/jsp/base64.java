package com.thynkzone.jsp;

import java.util.Base64;
import java.nio.charset.StandardCharsets;

public class base64 {

	public static String en(String strtoencode) {
		return Base64.getEncoder().encodeToString(strtoencode.getBytes(StandardCharsets.ISO_8859_1));
	}
	
	public static String de(String strtodecode) {
		Base64.Decoder decoder = Base64.getDecoder();
		String decoded = new String(decoder.decode(strtodecode), StandardCharsets.UTF_8);
		return decoded;
	}
}