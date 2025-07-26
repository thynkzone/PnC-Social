package com.thynkzone.jsp;

import java.io.*; 
import java.util.Scanner;

public class ss {
	
	// Production path: /usr/local/tomcat9/webapps/ROOT/WEB-INF/secured/q.txt
	// private final static String filePath = "C:\\Users\\Farabi\\eclipse-workspace\\ROOT\\src\\main\\webapp\\WEB-INF\\secured\\q.txt";
	private final static String filePath = "/usr/local/tomcat9/webapps/ROOT/WEB-INF/secured/q.txt";

    public static String word() {

        String line = null;

        try {
            
            File file = new File(filePath);
            Scanner sc = new Scanner(file);
            line = sc.nextLine();
            sc.close();
        }
        catch(Exception ex) {          
        }
        return line.concat("Cnwqecb@#!X@ncEq8aVVe31238e1asdjasUIWD#");
    }
}