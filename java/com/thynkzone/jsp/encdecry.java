package com.thynkzone.jsp;

import java.security.spec.KeySpec;
import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import javax.crypto.spec.PBEKeySpec;

public class encdecry {
	
    public static String encry(String text, String key, String salt)  {
    	
    	String encryptedstring = null;
    	final byte[] iv = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
        try 
        {

            IvParameterSpec ivspec = new IvParameterSpec(iv);
             
            SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256");
            KeySpec spec = new PBEKeySpec(key.toCharArray(), salt.getBytes(), 35072, 256);
            SecretKey tmp = factory.generateSecret(spec);
            SecretKeySpec secretKey = new SecretKeySpec(tmp.getEncoded(), "AES");

            Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
            cipher.init(Cipher.ENCRYPT_MODE, secretKey, ivspec);
            encryptedstring = Base64.getEncoder().encodeToString(cipher.doFinal(text.getBytes("UTF-8")));
            
        }
        catch(Exception e) {System.out.print(e+"at encry encdecry.java");}
		return encryptedstring;
    }
    
    
    public static String decry(String encd, String key, String salt) {
    	
    	String decrypted = null;
    	final byte[] iv = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };

    	try 
        {

            IvParameterSpec ivspec = new IvParameterSpec(iv);
             
            SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256");
            KeySpec spec = new PBEKeySpec(key.toCharArray(), salt.getBytes(), 35072, 256);
            SecretKey tmp = factory.generateSecret(spec);
            SecretKeySpec secretKey = new SecretKeySpec(tmp.getEncoded(), "AES");
             
            Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5PADDING");
            cipher.init(Cipher.DECRYPT_MODE, secretKey, ivspec);
            decrypted = new String(cipher.doFinal(Base64.getDecoder().decode(encd)));
        
    }catch(Exception e) {System.out.print(e+"at decry encdecry.java");}
		return decrypted;

    }

}