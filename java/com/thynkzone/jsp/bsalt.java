package com.thynkzone.jsp;

import java.security.NoSuchAlgorithmException;

import org.mindrot.jbcrypt.BCrypt;

public class bsalt
{
    public static String main() throws NoSuchAlgorithmException 
    {
    	
        String salt = BCrypt.gensalt(10);
        
        return salt;
        
    }
}