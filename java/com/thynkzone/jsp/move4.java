package com.thynkzone.jsp;

import java.io.*; 
import java.security.NoSuchAlgorithmException;
import java.awt.image.*;
import javax.imageio.ImageIO;
import org.imgscalr.Scalr;
import org.imgscalr.Scalr.Method;
import org.imgscalr.Scalr.Mode;

import javaxt.io.Image;

public class move4 {    
    
	static String a = ".png";
	static String b = ".jpg";
	static String c = ".jpeg";
	static String d = ".bmp";
	static String e = ".gif";    

	public static String main(String dir, String del) throws IOException, NoSuchAlgorithmException {
		
		if (imgtype.find(dir) != "none") {
	     
	    String iis = "TH_PO_".concat(imgppcode.ran()).concat("_").concat(uidgen.id()).concat("_").concat(imgppcode.ran());
	    // Production path: "/usr/local/img/"
	    // String give = "C:\\Users\\Farabi\\eclipse-workspace\\ROOT\\src\\main\\webapp\\img\\".concat(iis);
	    String give = "/usr/local/img/".concat(iis);
	    
	    
	    String previmg = null;
	    if (!del.equals("gref")) {
	    	//del returns img/something.jpg
	    // Production path: "/usr/local/img/"
	    // previmg = "C:\\Users\\Farabi\\eclipse-workspace\\ROOT\\src\\main\\webapp\\img\\".concat(del.substring(4));
	    previmg = "/usr/local/img/".concat(del.substring(4));
	    }
	
    
    //saved (savein) is needed to place the image in correct place and fdire (savedin) is required for further db processing & displaying since its only later displayed in /img.concat(fdire)
    File saved;
    String fdire = null;
    
    int x = dir.length() - 4;
    int xb = dir.length() - 5;
    String type = dir.substring(x);
    String type2 = dir.substring(xb);

     
	
	Image image = new Image(dir);
	if (image.getExifTags().get(0x0112) != null) {
	image.rotate(); 
	image.saveAs(dir);
	}
	
	
	BufferedImage img = ImageIO.read(new File(dir));
	int w = img.getWidth();
	int h = img.getHeight();
	int target_width = 2048; //max if N/A at below conditions
	int target_height = 2048;
	
	
	if (w < 720 || h < 720) { 
		target_width = 720;
		target_height = 720;
	}
	
	else if (w < 960 || h < 960) { 
		target_width = 960;
		target_height = 960;
	}
	
	else if (w < 2048 || h < 2048) { 
		target_width = 2048;
		target_height = 2048;
	}

	
	BufferedImage resized = Scalr.resize(img,
            Method.ULTRA_QUALITY,
            Mode.AUTOMATIC,
            target_width, 
            target_height);

	   
    if (type.equalsIgnoreCase(a) && imgtype.find(dir).equalsIgnoreCase(a)) {
    saved = new File(give.concat(a));
    ImageIO.write(resized, "png", saved);
    fdire = iis.concat(a);
    }
    
    else if (type.equalsIgnoreCase(b) && (imgtype.find(dir).equalsIgnoreCase(b) || imgtype.find(dir).equalsIgnoreCase(c))){
    saved = new File(give.concat(b));
    ImageIO.write(resized, "jpg", saved);
    fdire = iis.concat(b);
    }
    
    else if (type2.equalsIgnoreCase(c) && imgtype.find(dir).equalsIgnoreCase(c)) {
    saved = new File(give.concat(c));
    ImageIO.write(resized, "jpeg", saved);
    fdire = iis.concat(c);
    }
    
    else if (type.equalsIgnoreCase(d) && imgtype.find(dir).equalsIgnoreCase(d)) {
    saved = new File(give.concat(d));
    ImageIO.write(resized, "bmp", saved);
    fdire = iis.concat(d);
    }
    
    else if (type.equalsIgnoreCase(e) && imgtype.find(dir).equalsIgnoreCase(e)) {
    saved = new File(give.concat(e));
    ImageIO.write(resized, "gif", saved);
    fdire = iis.concat(e);
    }

        
    File draft = new File(dir);
    System.gc();
    draft.delete();
    if (!del.equals("gref")) {
    	File draft2 = new File(previmg);
    	System.gc();
    	draft2.delete();
    }
    
    	return fdire;
	}
		
		else {
			return null;
			}

	}
}