package com.thynkzone.jsp;

public class millionaize {
	
	public static String main(long number) {
		    int exp = (int) (Math.log(number) / Math.log(1000));
		    return String.format("%.1f %c", number / Math.pow(1000, exp), "kMGTPE".charAt(exp-1));
		}
}
