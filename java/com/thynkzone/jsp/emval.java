package com.thynkzone.jsp;

import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;

public class emval {
	
	public static boolean check(String email) {
		
		boolean reslt = true;
		
	try {
	
	InternetAddress emaweb = new InternetAddress(email);
	emaweb.validate();
	
		} catch(AddressException aEx) {
		    reslt = false;
		}
	
	return reslt;
	}
}
