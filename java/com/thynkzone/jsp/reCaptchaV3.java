package com.thynkzone.jsp;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.LinkedHashMap;
import java.util.Map.Entry;

import org.json.JSONObject;

public class reCaptchaV3 {
	
	public static boolean main(String response) {
		boolean positive = false;
		
		try {
			if (reCaptchaV3.isHuman(response)) {
				positive = true;
			}
		} catch (Exception e) {}
		
		return positive;
	}
	
	 public static boolean isHuman(String response) throws Exception {
		// TODO: Configure reCAPTCHA secret key in external configuration file
		String secretkey = "YOUR_RECAPTCHA_SECRET_KEY_HERE"; // Configure in external file
		boolean success = false;
		double score = 0.0;
		boolean result = false;
		 
	    URL url = new URL("https://www.google.com/recaptcha/api/siteverify");
	    LinkedHashMap<Object, Object> params = new LinkedHashMap<>();
	    params.put("secret", secretkey);
	    params.put("response", response);
	    StringBuilder postData = new StringBuilder();
	    
	    for (Entry<Object, Object> param : params.entrySet()) {
	        if (postData.length() != 0) postData.append('&');
	        postData.append(URLEncoder.encode((String) param.getKey(), "UTF-8"));
	        postData.append('=');
	        postData.append(URLEncoder.encode(String.valueOf(param.getValue()), "UTF-8"));
	    }
	    
	    byte[] postDataBytes = postData.toString().getBytes("UTF-8");
	    HttpURLConnection conn = (HttpURLConnection)url.openConnection();
	    
	    conn.setRequestMethod("POST");
	    conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
	    conn.setRequestProperty("Content-Length", String.valueOf(postDataBytes.length));
	    conn.setDoOutput(true);
	    conn.getOutputStream().write(postDataBytes);
	    
	    Reader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
	    StringBuilder sb = new StringBuilder();
	    for (int c; (c = in.read()) >= 0;)
	        sb.append((char)c);
	    String responserecieved = sb.toString();
	    JSONObject myResponse = new JSONObject(responserecieved.toString());
	    
	    success = myResponse.getBoolean("success");
	    if (success == true) {
	    score = myResponse.getDouble("score");
	    
	    if (score > 0.2) {
	    	result = true;
	    }
	    else {
	    	result = false;
	    }
	    }
	    
	    return result;
	 }

}