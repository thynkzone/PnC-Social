package com.thynkzone.jsp;

import java.io.*; 
import java.util.Scanner;

public class bf {
	
	// Production path: /usr/local/tomcat9/webapps/ROOT/WEB-INF/secured/y.txt
	// private final static String filePath = "C:\\Users\\Farabi\\eclipse-workspace\\ROOT\\src\\main\\webapp\\WEB-INF\\secured\\y.txt";
	private final static String filePath = "/usr/local/tomcat9/webapps/ROOT/WEB-INF/secured/y.txt";

    public static String word() {

        String line = null;

        try {
            
            File file = new File(filePath);
            Scanner sc = new Scanner(file);
            line = sc.nextLine();
            sc.close();
        }
        catch(Exception ex) {
        	System.out.print(ex+"at bf.java");
        }
        return line.concat("0rN0t");
    }
}