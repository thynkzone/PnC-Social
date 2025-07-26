package com.thynkzone.jsp;

import java.time.LocalDate;
import java.time.Period;

public class agecalc {

	public static int main(int m, int d, int y) {
		
		LocalDate birthdate=null;
		LocalDate currentdate=null;
		
		try {
		birthdate = LocalDate.of(y, d, m);
		currentdate = LocalDate.now();
		}
		
		catch (Exception ex){
			System.out.print(ex+"at agecalc.java");
		}
		
		return Period.between(birthdate, currentdate).getYears();
	}
	
	public static int days(int m, int d, int y) {
		
		LocalDate cookiecreated=null;
		LocalDate currentdate=null;
		
		try {
			cookiecreated = LocalDate.of(y, m, d);
			currentdate = LocalDate.now();
		}
		
		catch (Exception ex){
			System.out.print(ex+"at agecalc.java");
		}
	
	return Period.between(cookiecreated, currentdate).getDays();
	}
}