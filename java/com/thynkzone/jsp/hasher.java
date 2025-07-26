package com.thynkzone.jsp;

import java.math.BigInteger;
import java.security.MessageDigest; 
import java.security.NoSuchAlgorithmException; 

public class hasher { 
	public static String hash(String input) 
	{ 
		try { 
			
			MessageDigest md = MessageDigest.getInstance("SHA-512"); 

			byte[] messageDigest = md.digest(input.getBytes()); 

			BigInteger no = new BigInteger(1, messageDigest); 

			String hashtext = no.toString(16); 

			while (hashtext.length() < 32) { 
				hashtext = "0" + hashtext; 
			} 

			return hashtext; 
		} 

		catch (NoSuchAlgorithmException e) { 
			throw new RuntimeException(e); 
		} 
	} 
 
	public static String main(String pass) throws NoSuchAlgorithmException 
	{ 
		int i = 0;
		String grash = hash(pass);
		
		while (i < 15) {
			//dont mess with the 15 above it will ruin things
			grash = hash(grash);
			i++;
		}
		
		return grash; 
	}
} 
