package com.thynkzone.jsp;

import java.io.*;  
import java.util.Scanner;

public class af {
	
	// Production path: /usr/local/tomcat9/webapps/ROOT/WEB-INF/secured/x.txt
	// private final static String filePath = "C:\\Users\\Farabi\\eclipse-workspace\\ROOT\\src\\main\\webapp\\WEB-INF\\secured\\x.txt";
	private final static String filePath = "/usr/local/tomcat9/webapps/ROOT/WEB-INF/secured/x.txt";

    public static String word() {

        String line = null;

        try {
            
            File file = new File(filePath);
            Scanner sc = new Scanner(file);
            line = sc.nextLine();
            sc.close();
        }
        catch(Exception ex) {
        	System.out.print(ex+"at af.java");
        }
        return line.concat("&!m");
    }
}