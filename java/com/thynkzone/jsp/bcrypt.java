package com.thynkzone.jsp;

import java.security.NoSuchAlgorithmException;

import org.mindrot.jbcrypt.BCrypt;

public class bcrypt
{
    public static String main(String p, String s) throws NoSuchAlgorithmException 
    {
    	
        String generatedSecuredPasswordHash = BCrypt.hashpw(p, s);
        
        return generatedSecuredPasswordHash;
        
    }
}