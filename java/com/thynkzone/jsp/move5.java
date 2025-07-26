package com.thynkzone.jsp;

import java.io.*;  


public class move5 {    

	public static void main(String del) {
	    
	    // Production path: "/usr/local/img/"
	    // String previmg = "C:\\Users\\Farabi\\eclipse-workspace\\ROOT\\src\\main\\webapp\\img\\".concat(del.substring(4));
	    String previmg = "/usr/local/img/".concat(del.substring(4));

 File draft2 = new File(previmg);
 System.gc();
 draft2.delete();
 }
}