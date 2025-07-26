package com.thynkzone.jsp;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;

import javax.imageio.ImageIO;
import javax.imageio.ImageReader;
import javax.imageio.stream.ImageInputStream;

public class imgtype {
	
	public static String find(String dir) throws IOException {
		
		String format = "none";
		ImageInputStream iis = ImageIO.createImageInputStream(new File(dir));
		 
		  // get all currently registered readers that recognize the image format
		 
		  Iterator<ImageReader> iter = ImageIO.getImageReaders(iis);
		 
		  if (!iter.hasNext()) {
		 
			  return format;
		 
		  }
		 
		  // get the first reader
		 
		  ImageReader reader = iter.next();
		 
		  format = reader.getFormatName();
		 
		  // close stream
		 
		  iis.close();

        
        return ".".concat(format);
	}
}