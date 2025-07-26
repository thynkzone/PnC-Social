package com.thynkzone.jsp;

import java.math.BigInteger;
import java.security.MessageDigest; 
import java.security.NoSuchAlgorithmException; 

public class hasherfast {
	
	public static String main(String pass) {
	
	String hashtext=null;
	
		try { 
			
			MessageDigest md = MessageDigest.getInstance("SHA-1"); 

			byte[] messageDigest = md.digest(pass.getBytes()); 

			BigInteger no = new BigInteger(1, messageDigest); 

			hashtext = no.toString(16); 

			while (hashtext.length() < 32) { 
				hashtext = "0" + hashtext; 
			}

		} 

		catch (NoSuchAlgorithmException e) { 
			throw new RuntimeException(e); 
		}
		
		return hashtext; 
	}

}
