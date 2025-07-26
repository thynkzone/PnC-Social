package com.thynkzone.jsp;

import java.security.NoSuchAlgorithmException;  
import java.security.SecureRandom;

public class imgppcode {
	
	public static String ran() throws NoSuchAlgorithmException {
	
	final String x = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
	SecureRandom sr = SecureRandom.getInstanceStrong();

	   StringBuilder sb = new StringBuilder(128);
	   for( int i = 1; i < 9; i++ ) 
	      sb.append(x.charAt(sr.nextInt(x.length())));
	   return sb.toString();
	
}
	
}
