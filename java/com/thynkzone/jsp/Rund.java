package com.thynkzone.jsp;

import java.util.Base64;   

import org.apache.commons.rng.UniformRandomProvider;
import org.apache.commons.rng.simple.RandomSource;

public class Rund {
	
	public static String green() {
		
	byte[] salt = new byte[64];
		
	UniformRandomProvider rng = RandomSource.create(RandomSource.MT);
	rng.nextBytes(salt);
	String str = Base64.getEncoder().encodeToString(salt);
	
	return str;
	}
}
