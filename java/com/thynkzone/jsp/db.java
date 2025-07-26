package com.thynkzone.jsp;

import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;
import java.util.TimeZone;
import java.util.Calendar;
import java.time.LocalDate;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class db {
	
		// Production paths: 
		// filePath = "/usr/local/tomcat9/webapps/ROOT/WEB-INF/secured/"
		// imagePath = "/usr/local/img/"
		private final static String filePath = "/usr/local/tomcat9/webapps/ROOT/WEB-INF/secured/";
		private final static String imagePath = "/usr/local/img/";
		private final static String name = "com.mysql.cj.jdbc.Driver";
		private final static String url1 = "jdbc:mysql://localhost:3306/thynkzone";
		private final static String url2 = "jdbc:mysql://localhost:3306/users";

		
		public static String name() {
			return name;
		}
		
		public static String urlth() {
			return url1;
		}
		
		public static String urlus() {
			return url2;
		}
		
		public static String uname() {
			
			String fileAt = filePath.concat("eu.txt");
			String line = null;

	        try {
	        	
	            File file = new File(fileAt);
	            Scanner sc = new Scanner(file);
	            line = sc.nextLine();
	            sc.close();
	        }
	        catch(Exception ex) {          
	        }
	        
			return line;
		}
		
		public static String pass() {
			
			String fileAt = filePath.concat("ep.txt");
			String line = null;

	        try {
	        	
	            File file = new File(fileAt);
	            Scanner sc = new Scanner(file);
	            line = sc.nextLine();
	            sc.close();
	        }
	        catch(Exception ex) {          
	        }
	        
			return line;
		}
		
		public static String empass() {
			String fileAt = filePath.concat("emp.txt");
			String line = null;

	        try {
	        	
	            File file = new File(fileAt);
	            Scanner sc = new Scanner(file);
	            line = sc.nextLine();
	            sc.close();
	        }
	        catch(Exception ex) {          
	        }
	        
			return line;
		}
		
		
		
		public static String Dateint() {
			String date = LocalDate.now().toString();
			date = date.replace("-", "");
			return date;
		}
		
		
		
public static String userid(HttpServletRequest request) {
			
			
			String id = null;
  			
  			String cookieValue1 = null;
  			String cookieValue2 = null;
  			
  			Connection connz=null;
  			ResultSet rsz=null;
  			PreparedStatement pstmt=null;
  			
  			
  			
  			Cookie[] theCookies = request.getCookies();
  			Cookie tempCookie = null;
  			
  			if (theCookies != null) {		
  				for (int i = 0; i < theCookies.length; i++) {
  					tempCookie = theCookies[i];
  					
  					if ("Thynkzonea".equals(tempCookie.getName())) {
  							cookieValue1 = tempCookie.getValue();
  						}
  					if ("Thynkzoned".equals(tempCookie.getName())) {
  						cookieValue2 = tempCookie.getValue();
  						}
  					}
  				}
  				
  			try {
  			
  			String cook1 = hasher.main(cookieValue1);
  			String cook2 = hasher.main(cookieValue2);
  			int yemoda = 0;
  			int dd = 0;
  			int mm = 0;
  			int yy = 0;
  			
  			Class.forName(name());
  			String unamef = uname().concat("i");
  			String passf = pass().concat("09");
  			connz=(Connection)DriverManager.getConnection(urlth(),unamef,passf);
  			
  			
  			pstmt=connz.prepareStatement("SELECT * FROM registerform WHERE a =? AND d =?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
  			pstmt.setString(1, cook1);
		   	pstmt.setString(2, cook2);
		   	rsz=pstmt.executeQuery();
  			
		   	while (rsz.next()) {
	  				if (rsz.getInt(10) != 0) {
	  					yemoda = rsz.getInt(10);
	  					    dd = yemoda % 100;
	  					    yemoda = yemoda / 100;
	  					    mm = yemoda % 100;
	  					    yemoda = yemoda / 100;
	  					    yy = yemoda % 10000;

	  					  if (agecalc.days(mm, dd, yy) < 15) {
	  		  				id = rsz.getString(2);
	  		  				break;
	  		  										}
	  					}
	  					else if (rsz.getInt(10) == 0) {
	  					id = rsz.getString(2);
	  					break;
	  				}	  				
	  		}
  			
  			connz.close();
			pstmt.close();
			   
  			} catch (Exception ex) {}
  			
			return id;
		}
		
		
		
		
		
		
		
		
		public static String[] delcookie(String ix, HttpServletRequest request) {
			
			Connection connz=null;
  			PreparedStatement pstmt = null;
  			String[] headers = new String[2];
  			
  			String attributesofd = "Thynkzoned="+null+"; Path=/; HttpOnly; SameSite=strict; Priority=High; max-age="+0;
			String attributesofa = "Thynkzonea="+null+"; Path=/; HttpOnly; SameSite=strict; Priority=High; max-age="+0;
			
			headers[0] = attributesofd;
			headers[1] = attributesofa;	 
  				
  			try {
  			
  			Class.forName(name());
  			String unamef = uname().concat("i");
  			String passf = pass().concat("09");
  			connz=(Connection)DriverManager.getConnection(urlth(),unamef,passf);
  			
  			pstmt=connz.prepareStatement("UPDATE registerform SET `d` = ?, `a` = ? WHERE `id` = ?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		   	   pstmt.setString(1, null);
		   	   pstmt.setString(2, null);
		   	   pstmt.setString(3, ix);
		   	   pstmt.executeUpdate();
  			
		   	connz.close();
			pstmt.close();
  			
  			} catch (Exception ex) {}
  			
			return headers;
		}




		
		
		

			public static String[] nameico(String ix) {
				
				Connection connk=null;
				ResultSet rsk=null;
	  			PreparedStatement pstmt = null;
				
				 String pspath = null;
				 String pname = null;
				 String[] ans = null;  
				 
					try {
			
			Class.forName(name());
			String unamef = uname().concat("i");
			String passf = pass().concat("09");
			connk=(Connection)DriverManager.getConnection(urlth(),unamef,passf);


	pstmt = connk.prepareStatement("select * from profileinfo WHERE id =?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	pstmt.setString(1, ix);
	rsk=pstmt.executeQuery();

	if (rsk.next()) {
			   ans = new String[2];
		
			   pname = rsk.getString(5);
			   pspath = rsk.getString(12);
		}
	ans[0] = pname;
	ans[1] = pspath;

		connk.close();
		pstmt.close();

				} catch (Exception ex) {}
return ans;
}
			
			
			
			
			
			
			
			public static String usinfo(String userid, int key) {
			//this is for second.jsp page	
				 Connection connk=null;
				 ResultSet rsk=null;
				 PreparedStatement pstmt = null;
				 String lpath = null;
				 
				try {

		
		Class.forName(name());
		String unamef = uname().concat("i");
		String passf = pass().concat("09");
		connk=(Connection)DriverManager.getConnection(urlth(),unamef,passf);

		pstmt = connk.prepareStatement("select * from profileinfo WHERE id =?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		pstmt.setString(1, userid);
		rsk=pstmt.executeQuery();
		
		while (rsk.next()) {
		if (key == 0) {
		    //name
					   lpath = rsk.getString(5);
		}
		else if (key == 1) {
			//pp
					   lpath = rsk.getString(12);
			if (lpath == null || lpath.isEmpty() || lpath.equals("prof.png")) {
				lpath = "TH_PO_jWrhhqKc_238b3f45-c35a-47fc-afb9-f80800ffbc8b_XUfYX89F.png";
			}
			// Always return only the filename, never a full URL
		}
		else if (key == 2) {
			//bp
					   lpath = rsk.getString(13);
		}
		else if (key == 3) {
			//gen
			   lpath = rsk.getString(7);
		}
		else if (key == 4) {
			//bio
			   lpath = rsk.getString(8);
		}
		else if (key == 5) {
			//palce
			   lpath = rsk.getString(10);
		}
		else if (key == 6 && rsk.getString(14) != null && rsk.getString(15) != null) {
			//jobsandpos
			//return null at null if not above condition
			   lpath = rsk.getString(15)+" at "+rsk.getString(14);
		}
		else if (key == 7) {
			//age
			if (rsk.getString(6) != null) {
			   lpath = rsk.getString(6);
			   int m = Integer.valueOf(lpath.substring(8, 10));
			   int d = Integer.valueOf(lpath.substring(5, 7));
			   int y = Integer.valueOf(lpath.substring(0, 4));
			   lpath = Integer.toString((agecalc.main(m, d, y)));
			}
			else {
				lpath = "0";
			}
		}
		else if (key == 8) {
			//relation
			   lpath = rsk.getString(16);
		}
		else if (key == 9) {
			//messenger
			   lpath = rsk.getString(17);
		}
		else if (key == 10) {
			//fbid
			   lpath = rsk.getString(18);
		}
		else if (key == 11) {
			//insta
			   lpath = rsk.getString(19);
		}
							}
		
		connk.close();
		pstmt.close();

				} catch (Exception ex) {}

	return lpath;
}
			
			
			
			

			public static String infoadded(String userid, int key) {
			//this is for settingspro.jsp page		
				 Connection connk=null;
				 ResultSet rsk=null;
				 PreparedStatement pstmt = null;
				 String added = null;
				 
				try {				

		Class.forName(name());
		String unamef = uname().concat("i");
		String passf = pass().concat("09");
		connk=(Connection)DriverManager.getConnection(urlth(),unamef,passf);

		pstmt = connk.prepareStatement("select * from profileinfo WHERE id =?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		pstmt.setString(1, userid);
		rsk=pstmt.executeQuery();
		
		while (rsk.next()) {
		if (key == -1) {
			//bio
			added = rsk.getString(8);
		}
		if (key == 0) {
		    //location
			added = rsk.getString(10);
		}
		if (key == 1) {
		    //job
			added = rsk.getString(14);
		}
		else if (key == 2) {
			//position
				   added = rsk.getString(15);
		}
		
		else if (key == 3) {
			//relationship
				   added = rsk.getString(16);
		}
		else if (key == 4) {
			//fbid
				   added = rsk.getString(18);
		}
		else if (key == 5) {
			//msngr
				   added = rsk.getString(17);
		}
		else if (key == 6) {
			//instagram
				   added = rsk.getString(19);
		}
							
	}
		
		connk.close();
		pstmt.close();

				} catch (Exception ex) {}

	
	return added;
}
			
			
			
			
			
			
			
			public static void profileedit(String ix, String text, int key) {
				
				Connection conn=null;
				PreparedStatement pstmt = null;
				String qry = null; 
				
				try {
		
		Class.forName(name());
		String unamef = uname().concat("i");
		String passf = pass().concat("09");
		conn=(Connection)DriverManager.getConnection(urlth(),unamef,passf);

		
		if (key == -1) {
			//bio
			qry="UPDATE profileinfo SET bio=? WHERE id=?";
		}
		if (key == 0) {
		    //location
			text = text.substring(text.indexOf("~")+1);
			qry="UPDATE profileinfo SET place=? WHERE id=?";
			pstmt=conn.prepareStatement(qry, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			pstmt.setString(1, text);
			pstmt.setString(2, ix);
			pstmt.executeUpdate();
			text = text.substring(0 , text.indexOf("~"));
			qry="UPDATE profileinfo SET timezone=? WHERE id=?";
		}
		if (key == 1) {
		    //job
			qry="UPDATE profileinfo SET job=? WHERE id=?";
		   	
		}
		else if (key == 2) {
			//position
			qry="UPDATE profileinfo SET position=? WHERE id=?";
		}
		
		else if (key == 3) {
			//relationship
			qry="UPDATE profileinfo SET relationship=? WHERE id=?";
		}
		else if (key == 4) {
			//fbid
			qry="UPDATE profileinfo SET fbid=? WHERE id=?";
		}
		else if (key == 5) {
			//msngr
			qry="UPDATE profileinfo SET msngrlink=? WHERE id=?";
		}
		else if (key == 6) {
			//instagram
			qry="UPDATE profileinfo SET instaid=? WHERE id=?";
		}
		
		pstmt=conn.prepareStatement(qry, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		pstmt.setString(1, text);
		pstmt.setString(2, ix);
		pstmt.executeUpdate();
		
		
		conn.close();
		pstmt.close();
		
				} catch (Exception ex) {}
				
				
}
			
			
			
			
			public static int fans(String userid) {
				
				Connection connk=null;
				Statement stk=null;
				ResultSet rsk=null;
			    int fanscount = 0;
				 
				try {				
		
		Class.forName(name());
		String unamef = uname().concat("i");
		String passf = pass().concat("09");
		connk=(Connection)DriverManager.getConnection(urlus(),unamef,passf);
		stk=connk.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);


String qryk = "select count(*) from `"+userid+"` WHERE yorn =1";
rsk=stk.executeQuery(qryk);

while (rsk.next()) {
		fanscount = rsk.getInt(1);
	}
		connk.close();
				} catch (Exception ex) {}
return fanscount;
}
			
			
			
			
			
			
			
			
			
			
			public static int thidpr(String userid, int key) {
				
				int count = 0;
				Connection connk=null;
				ResultSet rsk=null;
				PreparedStatement pstmt = null;
				 
				try {				
		
		Class.forName(name());
		String unamef = uname().concat("i");
		String passf = pass().concat("09");
		connk=(Connection)DriverManager.getConnection(urlth(),unamef,passf);
		
		if (key == 1) {
			pstmt = connk.prepareStatement("select count(*) from posts WHERE posterid =? AND posttype = 1", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			pstmt.setString(1, userid);
			rsk=pstmt.executeQuery();
		}
		
		else if (key == 2) {
			pstmt = connk.prepareStatement("select count(*) from posts WHERE posterid =? AND posttype = 2", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			pstmt.setString(1, userid);
			rsk=pstmt.executeQuery();
		}
		
		else if (key == 3) {
			pstmt = connk.prepareStatement("select count(*) from posts WHERE posterid =? AND posttype = 3", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			pstmt.setString(1, userid);
			rsk=pstmt.executeQuery();
		}

		
		while (rsk.next()) {
			count = rsk.getInt(1);
			}
		
		connk.close();
		pstmt.close();

				} catch (Exception ex) {}		
				
	return count;
}
			
			

			public static int countreg() {
				
				Connection conn=null;
				ResultSet rxcount=null;
				PreparedStatement pstmt = null;
				int count = 0;
				
				try {
					
				Class.forName(db.name());
				String unamef = db.uname().concat("i");
				String passf = db.pass().concat("09");
				conn=(Connection)DriverManager.getConnection(db.urlth(),unamef,passf);
				
				pstmt = conn.prepareStatement("select * from registerform", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				rxcount=pstmt.executeQuery();

				if (rxcount.last()) {
					count = rxcount.getInt(1);
					}
					
				
				conn.close();
				pstmt.close();
				
					} catch (Exception ex) {}
				return count + 1;
			}
			
			
			
			public static int countprof() {
				
				Connection conn=null;
				ResultSet rxcount=null;
				PreparedStatement pstmt = null;
				int count = 0;
				
				try {
					
				Class.forName(db.name());
				String unamef = db.uname().concat("i");
				String passf = db.pass().concat("09");
				conn=(Connection)DriverManager.getConnection(db.urlth(),unamef,passf);
				
				pstmt = conn.prepareStatement("select * from profileinfo", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				rxcount=pstmt.executeQuery();

				if (rxcount.last()) {
					count = rxcount.getInt(1);
					}	
					
				
				conn.close();
				pstmt.close();
				
					} catch (Exception ex) {}
				return count + 1;
			}





			public static int countfol(String ix, int yornid) {
			
				Connection conn3=null;
				Statement st3=null;
				ResultSet rscount=null;
				int count = 0;
				
				try {
					
				Class.forName(db.name());
				String unamef = db.uname().concat("i");
				String passf = db.pass().concat("09");
				conn3=(Connection)DriverManager.getConnection(db.urlus(),unamef,passf);
				st3=conn3.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			
				rscount = st3.executeQuery("select count(*) from `".concat(ix+"` WHERE yorn = "+yornid));

			while (rscount.next()) {
			count = rscount.getInt(1);
			}
				
				conn3.close();
				} catch (Exception ex) {}
			return count;
			}
			
			

			
			
			public static int countnotif() {
				
				Connection conn3=null;
				ResultSet rscount=null;
				PreparedStatement pstmt = null;
				int count = 0;
				
				try {
					
				Class.forName(db.name());
				String unamef = db.uname().concat("i");
				String passf = db.pass().concat("09");
				conn3=(Connection)DriverManager.getConnection(db.urlth(),unamef,passf);
			
				pstmt = conn3.prepareStatement("select * from notif", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				rscount=pstmt.executeQuery();
				
				if (rscount.last()) {
				count = rscount.getInt(1);
				}
				
				conn3.close();
				pstmt.close();
				} catch (Exception ex) {}
			return count + 1;
			}
			
			
			public static int countreport() {
				
				Connection conn3=null;
				ResultSet rscount=null;
				PreparedStatement pstmt = null;
				int count = 0;
				
				try {
					
				Class.forName(db.name());
				String unamef = db.uname().concat("i");
				String passf = db.pass().concat("09");
				conn3=(Connection)DriverManager.getConnection(db.urlth(),unamef,passf);
				
				pstmt = conn3.prepareStatement("select * from reports", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				rscount=pstmt.executeQuery();
				
				if (rscount.last()) {
					count = rscount.getInt(1);
					}
				
					conn3.close();
					pstmt.close();
					} catch (Exception ex) {}
				return count + 1;
			}
			
			
			public static int countreportpro() {
				
				Connection conn3=null;
				ResultSet rscount=null;
				PreparedStatement pstmt = null;
				int count = 0;
				
				try {
					
				Class.forName(db.name());
				String unamef = db.uname().concat("i");
				String passf = db.pass().concat("09");
				conn3=(Connection)DriverManager.getConnection(db.urlth(),unamef,passf);
				
				pstmt = conn3.prepareStatement("select * from reportspro", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				rscount=pstmt.executeQuery();

				if (rscount.last()) {
					count = rscount.getInt(1);
					}
				
					conn3.close();
					pstmt.close();
					} catch (Exception ex) {}
				return count + 1;
			}



			
			public static int countlikers(String postid, String posterid) {
				
				Connection conn3=null;
				ResultSet rscount=null;
				PreparedStatement pstmt = null;
				int count = 0;
				
				try {
					
				Class.forName(db.name());
				String unamef = db.uname().concat("i");
				String passf = db.pass().concat("09");
				conn3=(Connection)DriverManager.getConnection(db.urlth(),unamef,passf);
			
				pstmt = conn3.prepareStatement("select count(*) from notif WHERE (liketype = 1 OR liketype = 2) AND postid =? AND posterid =?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				pstmt.setString(1, postid);
				pstmt.setString(2, posterid);
				rscount=pstmt.executeQuery();
				
				while (rscount.next()) {
					count = rscount.getInt(1);
					}
				
						conn3.close();
						pstmt.close();
						} catch (Exception ex) {}
					return count;
			}
			
			
			
			
			
			
			public static int countcommentators(String postid, String posterid) {
				
				Connection conn3=null;
				ResultSet rscount=null;
				PreparedStatement pstmt = null;
				int count = 0;
				
				try {
					
				Class.forName(db.name());
				String unamef = db.uname().concat("i");
				String passf = db.pass().concat("09");
				conn3=(Connection)DriverManager.getConnection(db.urlth(),unamef,passf);
			
				pstmt = conn3.prepareStatement("select count(*) from notif WHERE liketype = 3 AND postid =? AND posterid =?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				pstmt.setString(1, postid);
				pstmt.setString(2, posterid);
				rscount=pstmt.executeQuery();

				while (rscount.next()) {
					count = rscount.getInt(1);
					}
				
						conn3.close();
						pstmt.close();
						} catch (Exception ex) {}
					return count;
			}	
			
			

			public static int countposts() {
				
				Connection conn3=null;
				ResultSet rscount=null;
				PreparedStatement pstmt = null;
				int count = 0;
				
				try {
					
				Class.forName(db.name());
				String unamef = db.uname().concat("i");
				String passf = db.pass().concat("09");
				conn3=(Connection)DriverManager.getConnection(db.urlth(),unamef,passf);
			
				pstmt = conn3.prepareStatement("select * from posts", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				rscount=pstmt.executeQuery();
				
				if (rscount.last()) {
				count = rscount.getInt(1);
				}
				
				conn3.close();
				pstmt.close();
				} catch (Exception ex) {}
			return count;
			}
			
			
			
			public static int countads() {
				
				Connection conn3=null;
				ResultSet rscount=null;
				PreparedStatement pstmt = null;
				int count = 0;
				
				try {
					
				Class.forName(db.name());
				String unamef = db.uname().concat("i");
				String passf = db.pass().concat("09");
				conn3=(Connection)DriverManager.getConnection(db.urlth(),unamef,passf);
			
				pstmt = conn3.prepareStatement("select * from ads", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				rscount=pstmt.executeQuery();
				
				if (rscount.last()) {
				count = rscount.getInt(1);
				}
				
				conn3.close();
				pstmt.close();
				} catch (Exception ex) {}
			return count;
			}






			
			
			
			
			
			
			public static int getAdscount(String ix) {
				
				Connection conn3=null;
				ResultSet rscount=null;
				PreparedStatement pstmt = null;
				int count = 0;
				
				try {
					
				Class.forName(db.name());
				String unamef = db.uname().concat("i");
				String passf = db.pass().concat("09");
				conn3=(Connection)DriverManager.getConnection(db.urlth(),unamef,passf);
			
				pstmt = conn3.prepareStatement("select count(*) from ads WHERE posterid =?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				pstmt.setString(1, ix);
				rscount=pstmt.executeQuery();

				while (rscount.next()) {
					count = rscount.getInt(1);
					}
				
						conn3.close();
						pstmt.close();
						} catch (Exception ex) {}
					return count;
			}
			
			
			
			
			
			
			
			public static int countmutualthy(String ix, String userid) {
				
				Connection conn3=null;
				Statement st3=null;
				Statement st4=null;
				ResultSet rscount=null;
				ResultSet rscount2=null;
				int count = 0;
				String myfrnz = null;
				
				try {
					
				Class.forName(db.name());
				String unamef = db.uname().concat("i");
				String passf = db.pass().concat("09");
				conn3=(Connection)DriverManager.getConnection(db.urlus(),unamef,passf);
				st3=conn3.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				st4=conn3.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				
				rscount = st3.executeQuery("select * from `"+ix+"` WHERE yorn=2");

			while (rscount.next()) {
			myfrnz = rscount.getString(1);
			rscount2 = st4.executeQuery("select * from `"+userid+"` WHERE forufid = '"+myfrnz+"' AND yorn=2");
			if (rscount2.next()) {
				count += 1;
			}
			}
				
				conn3.close();
				} catch (Exception ex) {}
			return count;
			}
			
			
			
			
			
			
			public static int countrating(String ix) {
				
				Connection conn3=null;
				ResultSet rscount=null;
				PreparedStatement pstmt = null;
				int count = 0;
				int sum = 0;
				
				try {
					
				Class.forName(db.name());
				String unamef = db.uname().concat("i");
				String passf = db.pass().concat("09");
				conn3=(Connection)DriverManager.getConnection(db.urlth(),unamef,passf);
			
				pstmt = conn3.prepareStatement("select count(*) from notif WHERE (liketype = 1) AND (posterid =?)", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				pstmt.setString(1, ix);
				rscount=pstmt.executeQuery();
				
				while (rscount.next()) {
					count = rscount.getInt(1);
					}
				sum = (count*10);
				count = 0;
				
				pstmt = conn3.prepareStatement("select count(*) from notif WHERE (liketype = 2) AND (posterid =?)", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				pstmt.setString(1, ix);
				rscount=pstmt.executeQuery();
				
				while (rscount.next()) {
					count = rscount.getInt(1);
					}
				sum += (count*5);
				
						conn3.close();
						pstmt.close();
						} catch (Exception ex) {}
					return sum;
			}
			
			
			
			public static String getlevel(int rating) {

				String level = null;
				
				if (rating < 10) {
					level = "Novice";
				}
				else if (rating >= 10 && rating < 325) {
					level = "Social";
				}
				else if (rating >= 325 && rating < 750) {
					level = "Engaged";
				}
				else if (rating >= 750 && rating < 1500) {
					level = "Pro";
				}
				else if (rating >= 1500 && rating < 3000) {
					level = "Leader";
				}
				else if (rating >= 3000 && rating < 6000) {
					level = "Executive";
				}
				else if (rating >= 6000 && rating < 15000) {
					level = "Visionary";
				}
				else if (rating >= 15000 && rating < 30000) {
					level = "Ambassador";
				}
				else if (rating >= 30000) {
					level = "Chief";
				}
			
				return level;
			}


			
			public static String getfullname(String ix) {
				
				Connection conn3=null;
				ResultSet rs=null;
				String fullname = null;
				PreparedStatement pstmt = null;
				
				try {
				
				Class.forName(db.name());
				String unamef = db.uname().concat("i");
				String passf = db.pass().concat("09");
				conn3=(Connection)DriverManager.getConnection(db.urlth(),unamef,passf);
			
				pstmt = conn3.prepareStatement("select * from profileinfo WHERE id =?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				pstmt.setString(1, ix);
				rs=pstmt.executeQuery();

				while (rs.next()) {
					fullname = rs.getString(5);
				}
				
				conn3.close();
				pstmt.close();
				} catch (Exception ex) {}
				
			return fullname;
			}
			
			
			

			
			public static String getCurrentBid(String ix, int key) {
				
				Connection conn3=null;
				ResultSet rs=null;
				int currbidx = 0;
				String currbid = null;
				String natcountry = null;
				PreparedStatement pstmt = null;
				
				try {
				
				Class.forName(db.name());
				String unamef = db.uname().concat("i");
				String passf = db.pass().concat("09");
				conn3=(Connection)DriverManager.getConnection(db.urlth(),unamef,passf);
				
				
				if (key == 1) {
					pstmt = conn3.prepareStatement("select * from ads WHERE approval=1 AND privacy > 3", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
					rs=pstmt.executeQuery();
					
				while (rs.next()) {
					currbidx = rs.getInt(8);
						if (currbidx == 6) {
						currbid = "World 3x";
						}
						else if (currbidx == 5) {
							currbid = "World 2x";
						}
						else if (currbidx == 4) {
							currbid = "World";
						}
					}
				}
				
				else if (key == 2 || key == 0) {
					
					pstmt = conn3.prepareStatement("select * from profileinfo WHERE id =?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
					pstmt.setString(1, ix);
					rs=pstmt.executeQuery();
					
					while (rs.next()) {
						natcountry = rs.getString(9);
						}
		
					if (key == 0) {
						currbid = natcountry;
					}
					
					else if (key==2) {

					pstmt = conn3.prepareStatement("select * from ads WHERE approval=1 AND countryname=?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
					pstmt.setString(1, natcountry);
					rs=pstmt.executeQuery();
					
					while (rs.next()) {
						currbidx = rs.getInt(8);
						if (currbidx == 3) {
							currbid = "Country 3x";
							}
							else if (currbidx == 2) {
								currbid = "Country 2x";
							}
							else if (currbidx == 1) {
								currbid = "Country";
							}
						}
					}
					
				}
				
				conn3.close();
				pstmt.close();
				} catch (Exception ex) {}
				
			return currbid;
			}

			
			
			
			
			
			public static String[] countryad(String country) {
				
				Connection conn3=null;
				ResultSet rs=null;
				PreparedStatement pstmt = null;


				String posttext = null;
				String yourpostp = null;
				String posterid = null;
				String postid = null;
				
				String[] adreturn = null;
				
				
				
				try {
				
				Class.forName(db.name());
				String unamef = db.uname().concat("i");
				String passf = db.pass().concat("09");
				conn3=(Connection)DriverManager.getConnection(db.urlth(),unamef,passf);
				
				
				pstmt = conn3.prepareStatement("select * from ads WHERE approval=1 AND privacy < 4 AND countryname =?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				pstmt.setString(1, country);
				rs=pstmt.executeQuery();
				
				if (rs.next()) {
					adreturn = new String[4];
					
					postid = rs.getString(4);
					posterid = rs.getString(2);
					posttext = rs.getString(5);
					yourpostp = rs.getString(6);
				}
				
				adreturn[0] = postid;
				adreturn[1] = posterid;
				adreturn[2] = posttext;
				adreturn[3] = yourpostp;
				
				
				rs.close();
				
				conn3.close();
				pstmt.close();
				} catch (Exception ex) {}
				
			return adreturn;
			}
			
			
			
			
			
			public static String[] worldad() {
				
				Connection conn3=null;
				ResultSet rs=null;
				PreparedStatement pstmt = null;


				String posttext = null;
				String yourpostp = null;
				String posterid = null;
				String postid = null;
				
				String[] adreturn = null;
				
				
				try {
				
				Class.forName(db.name());
				String unamef = db.uname().concat("i");
				String passf = db.pass().concat("09");
				conn3=(Connection)DriverManager.getConnection(db.urlth(),unamef,passf);
				
				
				pstmt = conn3.prepareStatement("select * from ads WHERE approval=1 AND privacy > 3", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				rs=pstmt.executeQuery();
				
				if (rs.next()) {
					adreturn = new String[4];
					
					postid = rs.getString(4);
					posterid = rs.getString(2);
					posttext = rs.getString(5);
					yourpostp = rs.getString(6);
				}
				
				adreturn[0] = postid;
				adreturn[1] = posterid;
				adreturn[2] = posttext;
				adreturn[3] = yourpostp;
				
				
						
				
				rs.close();
				
				conn3.close();
				pstmt.close();
				} catch (Exception ex) {}

				
			return adreturn;
			}









			
			
			public static String time() {
				final SimpleDateFormat GMT = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				GMT.setTimeZone(TimeZone.getTimeZone("GMT"));
				return GMT.format(new Date());
				}    


			public static String timecon(String ix, String time) {

				Connection conn3=null;
				ResultSet rs=null;
				PreparedStatement pstmt = null;
				final SimpleDateFormat sdf = new SimpleDateFormat("hh:mm a, dd MMMM yyyy");
				final SimpleDateFormat pdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
				pdf.setTimeZone(TimeZone.getTimeZone("GMT"));
				String gmx = null;
				Date dated = new Date();
				
				try {
					
					Class.forName(db.name());
					String unamef = db.uname().concat("i");
					String passf = db.pass().concat("09");
					conn3=(Connection)DriverManager.getConnection(db.urlth(),unamef,passf);
				
					pstmt = conn3.prepareStatement("select * from profileinfo WHERE id =?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
					pstmt.setString(1, ix);
					rs=pstmt.executeQuery();
					
					while (rs.next()) {
						gmx = rs.getString(11);
					}

					dated = pdf.parse(time);
					sdf.setTimeZone(TimeZone.getTimeZone("GMT+"+gmx));

				conn3.close();
				pstmt.close();
				} catch (Exception ex) {}

				return sdf.format(dated);
				  }
			
			
			
			
			
			public static String timeconsp(String gmx, String time) {

				
				final SimpleDateFormat sdf = new SimpleDateFormat("hh:mm a, dd MMMM yyyy");
				final SimpleDateFormat pdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
				pdf.setTimeZone(TimeZone.getTimeZone("GMT"));
				Date dated = new Date();
				
				try {
					
					dated = pdf.parse(time);
					sdf.setTimeZone(TimeZone.getTimeZone("GMT+"+gmx));

				} catch (Exception ex) {}

				return sdf.format(dated);
				  }
			
			
			
			
			public static void setbgpic(String ix, String movedat) {
				   Connection conn=null;
		       	   PreparedStatement pstmt = null;
		       	   
		       	   String unamef = uname().concat("i");
		       	   String passf = pass().concat("09");
		       	   
		       	try {

		       	   Class.forName(name());
		       	   conn=(Connection)DriverManager.getConnection(urlth(),unamef,passf);
		       	
		           pstmt=conn.prepareStatement("UPDATE profileinfo SET backgroundp=? WHERE id=?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			   	   pstmt.setString(1, movedat);
			   	   pstmt.setString(2, ix);
			   	   pstmt.executeUpdate();
			   	   
			   	   conn.close();
				   pstmt.close();
				   
		       	} catch (Exception ex) {}
			}
			
			
			
			public static void setprofilepic(String ix, String movedat) {
				   Connection conn=null;
		       	   PreparedStatement pstmt = null;
		       	   
		       	   String unamef = uname().concat("i");
		       	   String passf = pass().concat("09");
		       	   
		       	try {

		       	   Class.forName(name());
		       	   conn=(Connection)DriverManager.getConnection(urlth(),unamef,passf);

		           pstmt=conn.prepareStatement("UPDATE profileinfo SET profilep=? WHERE id=?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			   	   pstmt.setString(1, movedat);
			   	   pstmt.setString(2, ix);
			   	   pstmt.executeUpdate();
			   	   
			   	   conn.close();
				   pstmt.close();
				   
		       	} catch (Exception ex) {}
			}

			
			
			
			public static int checkifemailexists(String emaed) {
				   Connection conn=null;
		       	   PreparedStatement pstmt = null;
		       	   ResultSet rs=null;
		       	   int flag = 1;
		       	   
		       	   String unamef = uname().concat("i");
		       	   String passf = pass().concat("09");
		       	   
		       	try {

		       	   Class.forName(name());
		       	   conn=(Connection)DriverManager.getConnection(urlth(),unamef,passf);
		       	   
		           pstmt=conn.prepareStatement("select * from registerform WHERE email=?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		           pstmt.setString(1, emaed);
		           rs=pstmt.executeQuery();
		           
		           if (rs.next()) {
		   				flag = 0;
		   				//means the same email exists
		           }
			   	   
			   	   conn.close();
				   pstmt.close();
				   
		       	} catch (Exception ex) {}
		       	
		       	return flag;
			}
			
			
			
			
			
			public static void profileput(String id) {
				Connection conn=null;
		       	PreparedStatement pstmt = null;
				
				String unamef = uname().concat("i");
		    	String passf = pass().concat("09");
				
				try {
				
					Class.forName(name());
			       	conn=(Connection)DriverManager.getConnection(urlth(),unamef,passf);
				
				pstmt = conn.prepareStatement("INSERT INTO profileinfo(`no`, `id`) VALUES(?,?)", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				
				pstmt.setInt(1, countprof());
				pstmt.setString(2, id);
				
				pstmt.executeUpdate();
				
				conn.close();
				pstmt.close();
				} catch (Exception ex) {
				}
				
			}
			
			
			
			
			public static void registerput(String id, String email, String pwd, String acr, String salt, String pepper) {
				
				Connection conn=null;
		       	PreparedStatement pstmt = null;
				
				String unamef = uname().concat("i");
		    	String passf = pass().concat("09");
				
				try {
				
					Class.forName(name());
			       	conn=(Connection)DriverManager.getConnection(urlth(),unamef,passf);
				
				pstmt = conn.prepareStatement("INSERT INTO registerform(`no`, `id`, `email`, `pwd`, `acr`, `salt`, `pepper`, `t`, `try`) VALUES(?,?,?,?,?,?,?,?,?)", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				
				pstmt.setInt(1, countreg());
				pstmt.setString(2, id);
				pstmt.setString(3, email);
				// pstmt.setString(4, pwd); // HIDDEN FOR DEMO
				pstmt.setString(5, acr);
				pstmt.setString(6, salt);
				pstmt.setString(7, pepper);
				pstmt.setInt(8, 0);
				pstmt.setInt(9, 0);
				
				pstmt.executeUpdate();
				
				conn.close();
				pstmt.close();
				} catch (Exception ex) {
				}
				
			}
			
			
			
			
			public static void createuserstable(String id) {
				
				Connection conn=null;
				Statement st=null;
				String qry=null;
				
			String unamef = uname().concat("i");
		    String passf = pass().concat("09");
		    
		    try {
				
				Class.forName(name());
		       	conn=(Connection)DriverManager.getConnection(urlth(),unamef,passf);
		       	st=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			
			qry = "CREATE TABLE `users`.`"+id+"` (`forufid` VARCHAR(512) NOT NULL, `yorn` TINYINT NOT NULL, `fname` VARCHAR(512) NOT NULL, `sname` VARCHAR(512) NOT NULL, `fullName` VARCHAR(512) NOT NULL, `time` VARCHAR(128) NOT NULL) ENGINE=InnoDB";
			st.executeUpdate(qry);
			
				
			conn.close();
		    	} catch (Exception ex) {}
			}
			
			
			
			
			
			public static int forgotpass(String emkx, String phn) {
			
				Connection conn=null;
		       	PreparedStatement pstmt = null;
		       	ResultSet rs=null;
		       	int flag = 0;
				
				String unamef = uname().concat("i");
		    	String passf = pass().concat("09");
				
				try {
				
					Class.forName(name());
			       	conn=(Connection)DriverManager.getConnection(urlth(),unamef,passf);
				
				pstmt = conn.prepareStatement("select * from registerform WHERE email=?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				pstmt.setString(1, emkx);
				rs=pstmt.executeQuery();
				
				if (rs.next()) {
					if(emkx.equals(rs.getString(3)) && phn.equals(rs.getString(5))) {
						flag = 1;
					}
				}
				
				conn.close();
				pstmt.close();
		    	} catch (Exception ex) {}
				
				return flag;
			}
			
			
			
			
			public static void updatepass(String enccrd, String salt, String peppere, String emk7) {
			
				Connection conn=null;
				PreparedStatement pstmt = null;
				
			String unamef = uname().concat("i");
		    String passf = pass().concat("09");
		    
		    try {
				
				Class.forName(name());
		       	conn=(Connection)DriverManager.getConnection(urlth(),unamef,passf);
				
		       	pstmt=conn.prepareStatement("UPDATE registerform SET pwd=?, salt=?, pepper=?, try=0 WHERE email=?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		       	pstmt.setString(1, enccrd);
				pstmt.setString(2, salt);
				pstmt.setString(3, peppere);
				pstmt.setString(4, emk7);
			   	pstmt.executeUpdate();
				
				conn.close();
				pstmt.close();
	    		} catch (Exception ex) {}
			}
		    
			
			
			
			
			public static void setprofileinfos(String ix, String fname, String sname, String fullname, String bd, String gen, String about, String country, String place, String timezone) {
				
				Connection conn=null;
				PreparedStatement pstmt = null;
				
			String unamef = uname().concat("i");
		    String passf = pass().concat("09");
		    
		    try {
				
				Class.forName(name());
		       	conn=(Connection)DriverManager.getConnection(urlth(),unamef,passf);
				
		       	pstmt=conn.prepareStatement("UPDATE profileinfo SET firstname=?, surname=?, fullname=?, birthday=?, gender=?, bio=?, country=?, place=?, timezone=? WHERE id=?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				pstmt.setString(1, fname);
				pstmt.setString(2, sname);
				pstmt.setString(3, fullname);
				pstmt.setString(4, bd);
				pstmt.setString(5, gen);
				pstmt.setString(6, about);
				pstmt.setString(7, country);
				pstmt.setString(8, place);
				pstmt.setString(9, timezone);
				pstmt.setString(10, ix);
			   	pstmt.executeUpdate();
				
				conn.close();
				pstmt.close();
	    		} catch (Exception ex) {}
			}
			
		    
		    
		    
		    
			
			public static void thylike(String ix, String rawpostid, String posterid) {


				Connection connz=null;
				ResultSet rs = null;
				PreparedStatement pstmt = null;
				PreparedStatement pstmt2 = null;
				
	  			String unamef = uname().concat("i");
	  			String passf = pass().concat("09");

				String fullname = null;
	  				
	  			try {
	  					
	  				Class.forName(name());
	  				connz=(Connection)DriverManager.getConnection(urlth(),unamef,passf);
					
		  			pstmt=connz.prepareStatement("select * from profileinfo WHERE id =?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		  			pstmt.setString(1, ix);
		  			rs=pstmt.executeQuery();
		  			
					while (rs.next()) {
						fullname = rs.getString(5);
					}
	  			
	  			String like = rawpostid.substring(0,3);
	  			String postid = rawpostid.substring(3);
	  			
	  			int ckkk = countnotif();

	  			int lktyp;
	  			
	  			if (like.equals("lke")) {
	  				lktyp = 1;
	  				pstmt2=connz.prepareStatement("INSERT INTO `notif`(`no`, `liker`, `fullname`, `postid`, `posterid`, `liketype`, `time`) VALUES (?,?,?,?,?,?,?)", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	  				pstmt2.setInt(1, ckkk);
					pstmt2.setString(2, ix);
					pstmt2.setString(3, fullname);
					pstmt2.setString(4, postid);
					pstmt2.setString(5, posterid);
					pstmt2.setInt(6, lktyp);
					pstmt2.setString(7, time());
	  				pstmt2.executeUpdate();
		  			
		  			//add ix to liker list
	  			}
	  			
	  			else if (like.equals("ulk")) {
	  				pstmt2=connz.prepareStatement("DELETE FROM notif WHERE liker=? AND liketype=1 AND postid=?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	  				pstmt2.setString(1, ix);
					pstmt2.setString(2, postid);
	  				pstmt2.executeUpdate();
		  			
		  			//remove ix from liker list
	  			}
	  			
	  			else if (like.equals("dlk")) {
	  				lktyp = 2;
	  				pstmt2=connz.prepareStatement("INSERT INTO `notif`(`no`, `liker`, `fullname`, `postid`, `posterid`, `liketype`, `time`) VALUES (?,?,?,?,?,?,?)", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	  				pstmt2.setInt(1, ckkk);
					pstmt2.setString(2, ix);
					pstmt2.setString(3, fullname);
					pstmt2.setString(4, postid);
					pstmt2.setString(5, posterid);
					pstmt2.setInt(6, lktyp);
					pstmt2.setString(7, time());
	  				pstmt2.executeUpdate();
		  			
		  			//add ix to disliker list
	  			}
	  			
	  			else if (like.equals("udk")) {
	  				pstmt2=connz.prepareStatement("DELETE FROM notif WHERE liker=? AND liketype=2 AND postid=?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	  				pstmt2.setString(1, ix);
					pstmt2.setString(2, postid);
	  				pstmt2.executeUpdate();
		  			
		  			//remove ix from disliker list
	  			}
	  			
	  			connz.close();
	  			pstmt.close();
	  			pstmt2.close();
	  			
	  			} catch (Exception ex) {
	  			}
	  			
			}
			
			
			
			
			
			public static void handlingrequests(String ix, String requesttype) {


				Connection connz=null;
	  			Statement stz=null;
		       	PreparedStatement pstmt = null;
		       	
	  			String unamef = uname().concat("i");
	  			String passf = pass().concat("09");
	  			
	  			ResultSet rs = null;
	  			
	  			String snameus = null;
	  			String fnameus = null;
				String fullnameus = null;
				
				String snameix = null;
	  			String fnameix = null;
				String fullnameix = null;
				
				String req = requesttype.substring(0,3);
	  			String userid = requesttype.substring(3);
	  			
	  				
	  			try {
	  					
	  				Class.forName(name());
	  				connz=(Connection)DriverManager.getConnection(urlth(),unamef,passf);
		  			stz=connz.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
					
		  			pstmt=connz.prepareStatement("select * from profileinfo WHERE id =?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		  			pstmt.setString(1, userid);
					rs=pstmt.executeQuery();
					
					while (rs.next()) {
						fnameus = rs.getString(3);
					    snameus = rs.getString(4);
						fullnameus = rs.getString(5);
					}
					
					pstmt=connz.prepareStatement("select * from profileinfo WHERE id =?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
					pstmt.setString(1, ix);
					rs=pstmt.executeQuery();
					
					while (rs.next()) {
						fnameix = rs.getString(3);
					    snameix = rs.getString(4);
						fullnameix = rs.getString(5);
					}
					
					
					connz=(Connection)DriverManager.getConnection(urlus(),unamef,passf);
		  			stz=connz.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

	  			int lktyp;
	  			
	  			if (req.equals("frn")) {
	  				lktyp = 6;
		  			String qryz= "INSERT INTO `"+ix+"`(`forufid`, `yorn`, `fname`, `sname`, `fullname`, `time`) VALUES ('"+userid+"', '"+lktyp+"', '"+fnameus+"', '"+snameus+"', '"+fullnameus+"', '"+time()+"')";
		  			stz.executeUpdate(qryz);
		  			lktyp = 7;
		  			String qryzx= "INSERT INTO `"+userid+"`(`forufid`, `yorn`, `fname`, `sname`, `fullname`, `time`) VALUES ('"+ix+"', '"+lktyp+"', '"+fnameix+"', '"+snameix+"', '"+fullnameix+"', '"+time()+"')";
		  			stz.executeUpdate(qryzx);
		  			
	  			}
	  			
	  			else if (req.equals("ufr")) {
		  			String qryz="DELETE FROM `"+userid+"` WHERE forufid='"+ix+"' AND yorn=2";
		  			stz.executeUpdate(qryz);
		  			String qryzx="DELETE FROM `"+ix+"` WHERE forufid='"+userid+"' AND yorn=2";
		  			stz.executeUpdate(qryzx);

	  			}
	  			
	  			else if (req.equals("cfr")) {
	  				String qryz="DELETE FROM `"+userid+"` WHERE forufid='"+ix+"' AND yorn=7";
		  			stz.executeUpdate(qryz);
		  			String qryzx="DELETE FROM `"+ix+"` WHERE forufid='"+userid+"' AND yorn=6";
		  			stz.executeUpdate(qryzx);
		  			
	  			}
	  			
	  			else if (req.equals("afr")) {
	  				 pstmt=connz.prepareStatement("UPDATE `"+ix+"` SET `yorn` = 2, `time` = ? WHERE `forufid` = ? AND `yorn` = 7", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	  				   pstmt.setString(1, time());
				   	   pstmt.setString(2, userid);
				   	   pstmt.executeUpdate();
				   	 pstmt=connz.prepareStatement("UPDATE `"+userid+"` SET `yorn` = 2, `time` = ? WHERE `forufid` = ? AND `yorn` = 6", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				   	   pstmt.setString(1, time());
				   	   pstmt.setString(2, ix);
				   	   pstmt.executeUpdate();
				   	   
	  			}
	  			
	  			else if (req.equals("idz")) {
	  				lktyp = 0;
		  			String qryz= "INSERT INTO `"+ix+"`(`forufid`, `yorn`, `fname`, `sname`, `fullname`, `time`) VALUES ('"+userid+"', '"+lktyp+"', '"+fnameus+"', '"+snameus+"', '"+fullnameus+"', '"+time()+"')";
		  			stz.executeUpdate(qryz);
		  			lktyp = 1;
		  			String qryzx= "INSERT INTO `"+userid+"`(`forufid`, `yorn`, `fname`, `sname`, `fullname`, `time`) VALUES ('"+ix+"', '"+lktyp+"', '"+fnameix+"', '"+snameix+"', '"+fullnameix+"', '"+time()+"')";
		  			stz.executeUpdate(qryzx);
		  			
	  			}
	  			
	  			else if (req.equals("uiz")) {
	  				String qryz="DELETE FROM `"+userid+"` WHERE forufid='"+ix+"' AND yorn=1";
		  			stz.executeUpdate(qryz);
		  			String qryzx="DELETE FROM `"+ix+"` WHERE forufid='"+userid+"' AND yorn=0";
		  			stz.executeUpdate(qryzx);
		  			
	  			}
	  			
	  			connz.close();
	  			pstmt.close();
	  			} catch (Exception ex) {}
	  			
			}
			
			
			
			
			
			
			
			public static void thyrepdel(String ix, String rawpostid, String posteridx) {


				Connection connz=null;
				ResultSet rs = null;
				PreparedStatement pstmt = null;
				PreparedStatement pstmt2 = null;
				PreparedStatement pstmt3 = null;
	  			
	  			String unamef = uname().concat("i");
	  			String passf = pass().concat("09");
	  			
				String fullname = null;
	  				
	  			try {
	  					
	  				Class.forName(name());
	  				connz=(Connection)DriverManager.getConnection(urlth(),unamef,passf);
					
		  			pstmt=connz.prepareStatement("select * from profileinfo WHERE id =?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		  			pstmt.setString(1, ix);
		  			rs=pstmt.executeQuery();
		  			
					while (rs.next()) {
						fullname = rs.getString(5);
					}
	  			
	  			String typ = rawpostid.substring(0,3);
	  			String postid = rawpostid.substring(3);
	  			String posterid = posteridx.substring(3);

	  			int posthidtyp = 0;
	  			int ckkk = countnotif();
	  			int repkkk = countreport();
	  			
	  			
	  		    if (typ.equals("hia")) {
	  				posthidtyp = 6;
	  				pstmt2=connz.prepareStatement("INSERT INTO `notif`(`no`, `liker`, `fullname`, `postid`, `posterid`, `liketype`, `time`) VALUES (?,?,?,?,?,?,?)", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	  				pstmt2.setInt(1, ckkk);
					pstmt2.setString(2, ix);
					pstmt2.setString(3, fullname);
					pstmt2.setString(4, postid);
					pstmt2.setString(5, posterid);
					pstmt2.setInt(6, posthidtyp);
					pstmt2.setString(7, time());
	  				pstmt2.executeUpdate();
		  			
		  			//add poster id as a type  which is a type of block (block is type 6) in user db
	  			}
	  			
	  			else if (typ.equals("hid")) {
	  				posthidtyp = 7;
	  				pstmt2=connz.prepareStatement("INSERT INTO `notif`(`no`, `liker`, `fullname`, `postid`, `posterid`, `liketype`, `time`) VALUES (?,?,?,?,?,?,?)", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	  				pstmt2.setInt(1, ckkk);
					pstmt2.setString(2, ix);
					pstmt2.setString(3, fullname);
					pstmt2.setString(4, postid);
					pstmt2.setString(5, posterid);
					pstmt2.setInt(6, posthidtyp);
					pstmt2.setString(7, time());
	  				pstmt2.executeUpdate();
		  			
		  			//insert notif and later add to myhome array of avoiding duplicates
	  			}
	  			
	  			
	  			

	  			
	  			else if (typ.equals("re1")) {
	  				posthidtyp = 8;
	  				pstmt2=connz.prepareStatement("INSERT INTO `notif`(`no`, `liker`, `fullname`, `postid`, `posterid`, `liketype`, `time`) VALUES (?,?,?,?,?,?,?)", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	  				pstmt2.setInt(1, ckkk);
					pstmt2.setString(2, ix);
					pstmt2.setString(3, fullname);
					pstmt2.setString(4, postid);
					pstmt2.setString(5, posterid);
					pstmt2.setInt(6, posthidtyp);
					pstmt2.setString(7, time());
	  				pstmt2.executeUpdate();
	  				
	  				pstmt3=connz.prepareStatement("INSERT INTO `reports`(`no`, `reporter`, `reporterfullname`, `postid`, `posterid`, `reporttype`, `time`) VALUES (?,?,?,?,?,?,?)", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		  			pstmt3.setInt(1, repkkk);
					pstmt3.setString(2, ix);
					pstmt3.setString(3, fullname);
					pstmt3.setString(4, postid);
					pstmt3.setString(5, posterid);
					pstmt3.setString(6, "Political");
					pstmt3.setString(7, time());
	  				pstmt3.executeUpdate();
		  			
		  			//insert to report db upon selection of rep type
	  			}
	  			
	  			else if (typ.equals("re2")) {
	  				posthidtyp = 9;
	  				pstmt2=connz.prepareStatement("INSERT INTO `notif`(`no`, `liker`, `fullname`, `postid`, `posterid`, `liketype`, `time`) VALUES (?,?,?,?,?,?,?)", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	  				pstmt2.setInt(1, ckkk);
					pstmt2.setString(2, ix);
					pstmt2.setString(3, fullname);
					pstmt2.setString(4, postid);
					pstmt2.setString(5, posterid);
					pstmt2.setInt(6, posthidtyp);
					pstmt2.setString(7, time());
	  				pstmt2.executeUpdate();
	  				
		  			pstmt3=connz.prepareStatement("INSERT INTO `reports`(`no`, `reporter`, `reporterfullname`, `postid`, `posterid`, `reporttype`, `time`) VALUES (?,?,?,?,?,?,?)", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		  			pstmt3.setInt(1, repkkk);
					pstmt3.setString(2, ix);
					pstmt3.setString(3, fullname);
					pstmt3.setString(4, postid);
					pstmt3.setString(5, posterid);
					pstmt3.setString(6, "Falsenews");
					pstmt3.setString(7, time());
	  				pstmt3.executeUpdate();
		  			//insert to report db upon selection of rep type
	  			}

	  			else if (typ.equals("re3")) {
	  				posthidtyp = 10;
	  				pstmt2=connz.prepareStatement("INSERT INTO `notif`(`no`, `liker`, `fullname`, `postid`, `posterid`, `liketype`, `time`) VALUES (?,?,?,?,?,?,?)", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	  				pstmt2.setInt(1, ckkk);
					pstmt2.setString(2, ix);
					pstmt2.setString(3, fullname);
					pstmt2.setString(4, postid);
					pstmt2.setString(5, posterid);
					pstmt2.setInt(6, posthidtyp);
					pstmt2.setString(7, time());
	  				pstmt2.executeUpdate();

	  				
		  			pstmt3=connz.prepareStatement("INSERT INTO `reports`(`no`, `reporter`, `reporterfullname`, `postid`, `posterid`, `reporttype`, `time`) VALUES (?,?,?,?,?,?,?)", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		  			pstmt3.setInt(1, repkkk);
					pstmt3.setString(2, ix);
					pstmt3.setString(3, fullname);
					pstmt3.setString(4, postid);
					pstmt3.setString(5, posterid);
					pstmt3.setString(6, "Nudity");
					pstmt3.setString(7, time());
	  				pstmt3.executeUpdate();
		  			//insert to report db upon selection of rep type
	  			}
	  			
	  			else if (typ.equals("re4")) {
	  				posthidtyp = 11;
	  				pstmt2=connz.prepareStatement("INSERT INTO `notif`(`no`, `liker`, `fullname`, `postid`, `posterid`, `liketype`, `time`) VALUES (?,?,?,?,?,?,?)", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	  				pstmt2.setInt(1, ckkk);
					pstmt2.setString(2, ix);
					pstmt2.setString(3, fullname);
					pstmt2.setString(4, postid);
					pstmt2.setString(5, posterid);
					pstmt2.setInt(6, posthidtyp);
					pstmt2.setString(7, time());
	  				pstmt2.executeUpdate();


		  			pstmt3=connz.prepareStatement("INSERT INTO `reports`(`no`, `reporter`, `reporterfullname`, `postid`, `posterid`, `reporttype`, `time`) VALUES (?,?,?,?,?,?,?)", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		  			pstmt3.setInt(1, repkkk);
					pstmt3.setString(2, ix);
					pstmt3.setString(3, fullname);
					pstmt3.setString(4, postid);
					pstmt3.setString(5, posterid);
					pstmt3.setString(6, "Violence");
					pstmt3.setString(7, time());
	  				pstmt3.executeUpdate();
		  			//insert to report db upon selection of rep type
	  			}
	  			
	  			else if (typ.equals("re5")) {
	  				posthidtyp = 12;
	  				pstmt2=connz.prepareStatement("INSERT INTO `notif`(`no`, `liker`, `fullname`, `postid`, `posterid`, `liketype`, `time`) VALUES (?,?,?,?,?,?,?)", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	  				pstmt2.setInt(1, ckkk);
					pstmt2.setString(2, ix);
					pstmt2.setString(3, fullname);
					pstmt2.setString(4, postid);
					pstmt2.setString(5, posterid);
					pstmt2.setInt(6, posthidtyp);
					pstmt2.setString(7, time());
	  				pstmt2.executeUpdate();

	  				
		  			pstmt3=connz.prepareStatement("INSERT INTO `reports`(`no`, `reporter`, `reporterfullname`, `postid`, `posterid`, `reporttype`, `time`) VALUES (?,?,?,?,?,?,?)", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		  			pstmt3.setInt(1, repkkk);
					pstmt3.setString(2, ix);
					pstmt3.setString(3, fullname);
					pstmt3.setString(4, postid);
					pstmt3.setString(5, posterid);
					pstmt3.setString(6, "Harassment");
					pstmt3.setString(7, time());
	  				pstmt3.executeUpdate();
		  			//insert to report db upon selection of rep type
	  			}
	  			
	  			else if (typ.equals("re6")) {
	  				posthidtyp = 13;
	  				pstmt2=connz.prepareStatement("INSERT INTO `notif`(`no`, `liker`, `fullname`, `postid`, `posterid`, `liketype`, `time`) VALUES (?,?,?,?,?,?,?)", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	  				pstmt2.setInt(1, ckkk);
					pstmt2.setString(2, ix);
					pstmt2.setString(3, fullname);
					pstmt2.setString(4, postid);
					pstmt2.setString(5, posterid);
					pstmt2.setInt(6, posthidtyp);
					pstmt2.setString(7, time());
	  				pstmt2.executeUpdate();


		  			pstmt3=connz.prepareStatement("INSERT INTO `reports`(`no`, `reporter`, `reporterfullname`, `postid`, `posterid`, `reporttype`, `time`) VALUES (?,?,?,?,?,?,?)", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		  			pstmt3.setInt(1, repkkk);
					pstmt3.setString(2, ix);
					pstmt3.setString(3, fullname);
					pstmt3.setString(4, postid);
					pstmt3.setString(5, posterid);
					pstmt3.setString(6, "Other");
					pstmt3.setString(7, time());
	  				pstmt3.executeUpdate();
		  			//insert to report db upon selection of rep type
	  			}
	  		    
	  			connz.close();
	  			pstmt.close();
	  			pstmt2.close();
	  			pstmt3.close();
	  			} catch (Exception ex) {}
	  			
			}
			
			
			
			
			
			
			
			public static void thyprorepdel(String ix, String useridx) {


				Connection connz=null;
				ResultSet rs = null;
				PreparedStatement pstmt = null;
				PreparedStatement pstmt2 = null;
	  			
	  			String unamef = uname().concat("i");
	  			String passf = pass().concat("09");
	  			
	  			
				String fullname = null;
				String typ = useridx.substring(0,3);
	  			String userid = useridx.substring(3);
	  				
	  			try {
	  					
	  				Class.forName(name());
	  				connz=(Connection)DriverManager.getConnection(urlth(),unamef,passf);
	
	  				pstmt=connz.prepareStatement("select * from profileinfo WHERE id =?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	  				pstmt.setString(1, ix);
	  				rs=pstmt.executeQuery();
	  				
					while (rs.next()) {
						fullname = rs.getString(5);
					}
	  			

	  			int repkkk = countreportpro();
	  			
	  			
	  			
	  			
	  			if (typ.equals("re1")) {
	  				pstmt2=connz.prepareStatement("INSERT INTO `reportspro`(`no`, `reporter`, `reporterfullname`, `userid`, `reporttype`, `time`) VALUES (?,?,?,?,?,?)", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	  				pstmt2.setInt(1, repkkk);
					pstmt2.setString(2, ix);
					pstmt2.setString(3, fullname);
					pstmt2.setString(4, userid);
					pstmt2.setString(5, "Political");
					pstmt2.setString(6, time());
	  				pstmt2.executeUpdate();
		  			
		  			//insert to report db upon selection of rep type
	  			}
	  			
	  			else if (typ.equals("re2")) {
		  			pstmt2=connz.prepareStatement("INSERT INTO `reportspro`(`no`, `reporter`, `reporterfullname`, `userid`, `reporttype`, `time`) VALUES (?,?,?,?,?,?)", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	  				pstmt2.setInt(1, repkkk);
					pstmt2.setString(2, ix);
					pstmt2.setString(3, fullname);
					pstmt2.setString(4, userid);
					pstmt2.setString(5, "Fake Account");
					pstmt2.setString(6, time());
	  				pstmt2.executeUpdate();
		  			
		  			//insert to report db upon selection of rep type
	  			}

	  			else if (typ.equals("re3")) {
		  			pstmt2=connz.prepareStatement("INSERT INTO `reportspro`(`no`, `reporter`, `reporterfullname`, `userid`, `reporttype`, `time`) VALUES (?,?,?,?,?,?)", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	  				pstmt2.setInt(1, repkkk);
					pstmt2.setString(2, ix);
					pstmt2.setString(3, fullname);
					pstmt2.setString(4, userid);
					pstmt2.setString(5, "Nudity");
					pstmt2.setString(6, time());
	  				pstmt2.executeUpdate();
		  			
		  			//insert to report db upon selection of rep type
	  			}
	  			
	  			else if (typ.equals("re4")) {
		  			pstmt2=connz.prepareStatement("INSERT INTO `reportspro`(`no`, `reporter`, `reporterfullname`, `userid`, `reporttype`, `time`) VALUES (?,?,?,?,?,?)", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	  				pstmt2.setInt(1, repkkk);
					pstmt2.setString(2, ix);
					pstmt2.setString(3, fullname);
					pstmt2.setString(4, userid);
					pstmt2.setString(5, "Other");
					pstmt2.setString(6, time());
	  				pstmt2.executeUpdate();
		  			
		  			//insert to report db upon selection of rep type
	  			}
	  			

	  			connz.close();
	  			pstmt.close();
	  			pstmt2.close();
	  			} catch (Exception ex) {}
	  			
			}
			
			
			

			public static void thymanagerrepdel(String postidx, String posteridx) {


				Connection connz=null;
				PreparedStatement pstmt = null;
				ResultSet rs=null;
	  			
	  			String unamef = uname().concat("i");
	  			String passf = pass().concat("09");

				String typ = postidx.substring(0,3);
				String postid = postidx.substring(3);
	  			String userid = posteridx.substring(3);
	  			String pic = null;
	  			String dir = null;
	  				
	  			try {
	  					
	  				Class.forName(name());
	  				connz=(Connection)DriverManager.getConnection(urlth(),unamef,passf);
	  			
	  			
	  			if (typ.equals("rej")) {
	  				pstmt=connz.prepareStatement("DELETE FROM `reports` WHERE posterid=? AND postid=?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	  				pstmt.setString(1, userid);
					pstmt.setString(2, postid);
					pstmt.executeUpdate();
		  			
	  			}
	  			
	  			else if (typ.equals("app")) {
	  				pstmt=connz.prepareStatement("SELECT * FROM posts WHERE postid=? AND posterid=?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	  		    	pstmt.setString(1, postid);
					pstmt.setString(2, userid);
	  				rs=pstmt.executeQuery();
	  				rs.next();
	  				pic=rs.getString(6);
	  				if (pic!=null) {
		  		    dir = imagePath.concat(pic);
		  		    File postpic = new File(dir);
		  		  	postpic.delete();
		  			}
	  		    	
	  				pstmt=connz.prepareStatement("DELETE FROM `posts` WHERE posterid=? AND postid=?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	  				pstmt.setString(1, userid);
					pstmt.setString(2, postid);
					pstmt.executeUpdate();
	  				
					pstmt=connz.prepareStatement("DELETE FROM `notif` WHERE posterid=? AND postid=?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
					pstmt.setString(1, userid);
					pstmt.setString(2, postid);
					pstmt.executeUpdate();

	  			}
	  			

	  			connz.close();
	  			pstmt.close();
	  			rs.close();
	  			} catch (Exception ex) {}
	  			
			}
			
			
			
			
			public static void unhideall(String ix, String posterid) {

				
				Connection connz=null;
				PreparedStatement pstmt = null;
	  			
	  			String unamef = uname().concat("i");
	  			String passf = pass().concat("09");
	  				
	  			try {
	  					
	  				Class.forName(name());
	  				connz=(Connection)DriverManager.getConnection(urlth(),unamef,passf);

		  			pstmt=connz.prepareStatement("DELETE FROM notif WHERE liker=? AND posterid=? AND (liketype = 6 OR liketype = 7)", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		  			pstmt.setString(1, ix);
					pstmt.setString(2, posterid);
					pstmt.executeUpdate();


	  			connz.close();
	  			pstmt.close();
	  			} catch (Exception ex) {}
	  			
			}
			
			
			
			
			
			
			
			public static int del(String ix, String pw) {

				
				Connection conn2=null;
	  			ResultSet rs = null;
	  			PreparedStatement pstmt = null;
	  			ResultSet rs2 = null;
	  			int success = 0;
	  			
	  			
	  			String unamef = uname().concat("i");
	  			String passf = pass().concat("09");
	  			
	  				
	  			try {
	  					
	  				Class.forName(name());
	  				conn2=(Connection)DriverManager.getConnection(urlth(),unamef,passf);

		  			String salt;
					String bcrypted;
					String peppere;
					String peppered;
					
					String keyz;
					String ksaltz;
					String pic = null;
					String dir = null;
					
					pstmt=conn2.prepareStatement("select * from registerform WHERE id=?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
					pstmt.setString(1, ix);
					rs=pstmt.executeQuery();
					
					while(rs.next())
					{
							
							salt = rs.getString(6);
							peppere = rs.getString(7);
							// peppered = pw.concat(peppere); // HIDDEN FOR DEMO
							// bcrypted = bcrypt.main(peppered, salt); // HIDDEN FOR DEMO
							
							// keyz = hasher.main(peppere); // HIDDEN FOR DEMO
							// ksaltz = hasher.main(salt).concat(bf.word()); // HIDDEN FOR DEMO
							
							// if (bcrypted.equals(encdecry.decry(rs.getString(4), keyz, ksaltz))) // HIDDEN FOR DEMO
							// {
							pstmt=conn2.prepareStatement("DELETE FROM registerform WHERE id=?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
							pstmt.setString(1, ix);
							pstmt.executeUpdate();
						   	
						   	pstmt=conn2.prepareStatement("Update profileinfo SET `firstname` = ?, `surname` = ?, `fullname` = ?, `birthday` = ?, `gender` = ?, `bio` = ?, `country` = ?, `place` = ?, `timezone` = ?, `profilep` = ?, `backgroundp` = ?, `job` = ?, `position` = ?, `relationship` = ?, `msngrlink` = ?, `fbid` = ?, `instaid` = ? WHERE id='"+ix+"'", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
						   	
						   	pstmt.setString(1, null);
						   	pstmt.setString(2, null);
						   	pstmt.setString(3, "Thynkzone User");
						   	pstmt.setString(4, null);
						   	pstmt.setString(5, null);
						   	pstmt.setString(6, null);
						   	pstmt.setString(7, null);
						   	pstmt.setString(8, null);
						   	pstmt.setInt(9, 0);
						   	pstmt.setString(10, "TH_PO_jWrhhqKc_238b3f45-c35a-47fc-afb9-f80800ffbc8b_XUfYX89F.png");
						   	pstmt.setString(11, null);
						   	pstmt.setString(12, null);
						   	pstmt.setString(13, null);
						   	pstmt.setString(14, null);
						   	pstmt.setString(15, null);
						   	pstmt.setString(16, null);
						   	pstmt.setString(17, null);
						   	   
						   	pstmt.executeUpdate();
						   	
						   	pstmt=conn2.prepareStatement("SELECT * FROM posts WHERE posterid=?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			  		    	pstmt.setString(1, ix);
			  				rs2=pstmt.executeQuery();
			  				
			  				while(rs2.next()) {
			  				pic=rs2.getString(6);
			  				if (pic!=null) {
				  		    dir = imagePath.concat(pic);
				  		    File postpic = new File(dir);
				  		  	postpic.delete();
			  				}
			  				}
						   	
						   	pstmt=conn2.prepareStatement("DELETE FROM posts WHERE posterid='"+ix+"'", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
						   	pstmt.executeUpdate();
						   	
						   	pstmt=conn2.prepareStatement("DELETE FROM notif WHERE posterid='"+ix+"'", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
						   	pstmt.executeUpdate();
						   	
						   	pstmt=conn2.prepareStatement("DELETE FROM notif WHERE liker='"+ix+"'", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
						   	pstmt.executeUpdate();
						   	
						   	success = 1;
							break;
									 }
								
								else {
									success = 0;
								}
					}
	  			

	  			conn2.close();
	  			pstmt.close();
	  			rs.close();
	  			rs2.close();
	  			} catch (Exception ex) {}
	  			
	  			return success;
	  			
			}
			
			
			


			
			public static void thymanagerrepprodel(String useridx) {


				Connection connz=null;
	  			PreparedStatement pstmt = null;
	  			
	  			String unamef = uname().concat("i");
	  			String passf = pass().concat("09");

				
				String typ = useridx.substring(0,3);
				String userid = useridx.substring(3);
	  				
	  			try {
	  					
	  				Class.forName(name());
	  				connz=(Connection)DriverManager.getConnection(urlth(),unamef,passf);			
	  			
		  		
	  			if (typ.equals("rej")) {
					pstmt=connz.prepareStatement("DELETE FROM `reportspro` WHERE userid=?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
					pstmt.setString(1, userid);
					pstmt.executeUpdate();
	  			}
	  			
	  			else if (typ.equals("app")) {
	  				
	  				pstmt=connz.prepareStatement("DELETE FROM registerform WHERE id='"+userid+"'", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				   	pstmt.executeUpdate();
				   	
				   	pstmt=connz.prepareStatement("Update profileinfo SET `firstname` = ?, `surname` = ?, `fullname` = ?, `birthday` = ?, `gender` = ?, `bio` = ?, `country` = ?, `place` = ?, `timezone` = ?, `profilep` = ?, `backgroundp` = ?, `job` = ?, `position` = ?, `relationship` = ?, `msngrlink` = ?, `fbid` = ?, `instaid` = ? WHERE id='"+userid+"'", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				   	
				   	pstmt.setString(1, null);
				   	pstmt.setString(2, null);
				   	pstmt.setString(3, "Thynkzone User");
				   	pstmt.setString(4, null);
				   	pstmt.setString(5, null);
				   	pstmt.setString(6, null);
				   	pstmt.setString(7, null);
				   	pstmt.setString(8, null);
				   	pstmt.setInt(9, 0);
				   	pstmt.setString(10, "TH_PO_jWrhhqKc_238b3f45-c35a-47fc-afb9-f80800ffbc8b_XUfYX89F.png");
				   	pstmt.setString(11, null);
				   	pstmt.setString(12, null);
				   	pstmt.setString(13, null);
				   	pstmt.setString(14, null);
				   	pstmt.setString(15, null);
				   	pstmt.setString(16, null);
				   	pstmt.setString(17, null);
				   	   
				   	pstmt.executeUpdate();
				   	
				   	pstmt=connz.prepareStatement("DELETE FROM posts WHERE posterid='"+userid+"'", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				   	pstmt.executeUpdate();
				   	
				   	pstmt=connz.prepareStatement("DELETE FROM notif WHERE posterid='"+userid+"'", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				   	pstmt.executeUpdate();
				   	
				   	pstmt=connz.prepareStatement("DELETE FROM notif WHERE liker='"+userid+"'", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				   	pstmt.executeUpdate();
		  			
	  			}
	  			

	  			connz.close();
	  			pstmt.close();
	  			} catch (Exception ex) {}
	  			
			}
			
			
			
			
			
			public static void thymanagerad(String postidx, String posteridx) {


				Connection connz=null;
	  			ResultSet rs = null;
	  			PreparedStatement pstmt = null;
	  			
	  			String unamef = uname().concat("i");
	  			String passf = pass().concat("09");

				
				String typ = postidx.substring(0,3);
				String postid = postidx.substring(3);
				String typ2 = posteridx.substring(0,3);
	  			String userid = posteridx.substring(3);
	  			String country = null;
	  			
	  			try {
	  					
	  				Class.forName(name());
	  				connz=(Connection)DriverManager.getConnection(urlth(),unamef,passf);
	  			
	  			
	  			if (typ.equals("rej") && typ2.equals("wor")) {
	  				pstmt=connz.prepareStatement("UPDATE ads SET `approval` = -1, `time` = ? WHERE `posterid` = ? AND `postid` = ?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	  				   pstmt.setString(1, time());
				   	   pstmt.setString(2, userid);
				   	   pstmt.setString(3, postid);
				   	   pstmt.executeUpdate();
		  			
	  			}
	  			
	  			else if (typ.equals("app") && typ2.equals("wor")) {
				   	 pstmt=connz.prepareStatement("UPDATE ads SET `approval` = 3 WHERE `approval` = 1 AND `privacy` > 3", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				   	   pstmt.executeUpdate();
				   	 pstmt=connz.prepareStatement("UPDATE ads SET `approval` = 1, `time` = ? WHERE `posterid` = ? AND `postid` = ?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	  				   pstmt.setString(1, time());
				   	   pstmt.setString(2, userid);
				   	   pstmt.setString(3, postid);
				   	   pstmt.executeUpdate();
		  			
	  			}
	  			
	  			else if (typ.equals("rej") && typ2.equals("cou")) {
	  				pstmt=connz.prepareStatement("UPDATE ads SET `approval` = -1, `time` = ? WHERE `posterid` = ? AND `postid` = ?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	  				   pstmt.setString(1, time());
				   	   pstmt.setString(2, userid);
				   	   pstmt.setString(3, postid);
				   	   pstmt.executeUpdate();
		  			
	  			}
	  			
	  			else if (typ.equals("app") && typ2.equals("cou")) {
	  				
	  				pstmt=connz.prepareStatement("SELECT * FROM ads WHERE posterid=? AND postid=?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	  				pstmt.setString(1, userid);
	  				pstmt.setString(2, postid);
	  				rs=pstmt.executeQuery();
	  				
					while (rs.next()) {
						country = rs.getString(9);
					}
					
				    pstmt=connz.prepareStatement("UPDATE ads SET `approval` = 3 WHERE `approval` = 1 AND `privacy` < 4 AND `countryname` = ?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				   	   pstmt.setString(1, country);
				   	   pstmt.executeUpdate();
				   	   
	  				pstmt=connz.prepareStatement("UPDATE ads SET `approval` = 1, `time` = ? WHERE `posterid` = ? AND `postid` = ?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	  				   pstmt.setString(1, time());
				   	   pstmt.setString(2, userid);
				   	   pstmt.setString(3, postid);
				   	   pstmt.executeUpdate();
		  			
	  			}
	  			
	  			else if (typ.equals("stp")) {
	  				pstmt=connz.prepareStatement("UPDATE ads SET `approval` = 3, `time` = ? WHERE `posterid` = ? AND `postid` = ?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	  				   pstmt.setString(1, time());
				   	   pstmt.setString(2, userid);
				   	   pstmt.setString(3, postid);
				   	   pstmt.executeUpdate();
		  			
	  			}

	  			

	  			connz.close();
	  			pstmt.close();
	  			} catch (Exception ex) {}
	  			
			}

			
			
			
						
			public static void thyeddel(String ix, String rawpostid, String posteridx) {


				Connection connz=null;
				PreparedStatement pstmt = null;
				ResultSet rs=null;
	  			
	  			String unamef = uname().concat("i");
	  			String passf = pass().concat("09");
	  				
	  			try {
	  					
	  				Class.forName(name());
	  				connz=(Connection)DriverManager.getConnection(urlth(),unamef,passf);
	  			
	  			String typ = rawpostid.substring(0,3);
	  			String postid = rawpostid.substring(3);
	  			String posterid = posteridx.substring(3);
	  			String pic = null;
	  			String dir = null;
	  			
	  		    if (typ.equals("dlt")) {
	  		    	pstmt=connz.prepareStatement("SELECT * FROM posts WHERE postid=? AND posterid=?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	  		    	pstmt.setString(1, postid);
					pstmt.setString(2, posterid);
	  				rs=pstmt.executeQuery();
	  				rs.next();
	  				pic=rs.getString(6);
	  				if (pic!=null) {
	  		    	dir = imagePath.concat(pic);
	  		    	File postpic = new File(dir);
	  		  		postpic.delete();
	  				}
	  				
	  				pstmt=connz.prepareStatement("DELETE FROM posts WHERE postid=? AND posterid=?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	  				pstmt.setString(1, postid);
					pstmt.setString(2, posterid);
	  				pstmt.executeUpdate();
	  				
	  				pstmt=connz.prepareStatement("DELETE FROM notif WHERE postid=? AND posterid=?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	  				pstmt.setString(1, postid);
					pstmt.setString(2, posterid);
	  				pstmt.executeUpdate();
	  				
	  				pstmt=connz.prepareStatement("DELETE FROM reports WHERE postid=? AND posterid=?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	  				pstmt.setString(1, postid);
					pstmt.setString(2, posterid);
	  				pstmt.executeUpdate();
		  			
		  			//insert notif and later add to myhome array of avoiding duplicates
	  			}
	  		    
	  			connz.close();
	  			pstmt.close();
	  			rs.close();
	  			} catch (Exception ex) {}
			}
			
			
			
			
			
			public static int getifliked(String ix, String postid, String posterid) {
				
				
				Connection connz=null;
	  			ResultSet rsz=null;
	  			PreparedStatement pstmt = null;
	  			
				int liked = 0;
				
				try {
		  			
		  			Class.forName(name());
		  			String unamef = uname().concat("i");
		  			String passf = pass().concat("09");
		  			connz=(Connection)DriverManager.getConnection(urlth(),unamef,passf);
		  			
		  			pstmt=connz.prepareStatement("SELECT * FROM notif WHERE posterid =? AND postid =?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		  			pstmt.setString(1, posterid);
					pstmt.setString(2, postid);
					rsz=pstmt.executeQuery();
		  			
					
		  			while (rsz.next()) {
		  				if (rsz.getString(2).equals(ix) && rsz.getInt(6) == 1) {
		  					liked = 1;
		  				}
		  			}
		  			
		  			connz.close();
		  			pstmt.close();
			} catch (Exception ex) {}
				return liked;
			}
			
			
			public static int getifdisliked(String ix, String postid, String posterid) {
				
				Connection connz=null;
	  			ResultSet rsz=null;
	  			PreparedStatement pstmt = null;
				
				int disliked = 5;
				
				try {
		  			
		  			Class.forName(name());
		  			String unamef = uname().concat("i");
		  			String passf = pass().concat("09");
		  			connz=(Connection)DriverManager.getConnection(urlth(),unamef,passf);
		  			
		  			pstmt=connz.prepareStatement("SELECT * FROM notif WHERE posterid =? AND postid =?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		  			pstmt.setString(1, posterid);
					pstmt.setString(2, postid);
					rsz=pstmt.executeQuery();

		  			
		  			while (rsz.next()) {
		  				if (rsz.getString(2).equals(ix) && rsz.getInt(6) == 2) {
		  					disliked = 6;
		  				}
		  			}
		  			
		  			connz.close();
		  			pstmt.close();
			} catch (Exception ex) {}
				return disliked;
			}
			
			
			
			public static void thycomm(String ix, String comm, String postid, String posterid) {


				Connection connz=null;
				ResultSet rs = null;
				PreparedStatement pstmt = null;
	  			
	  			String unamef = uname().concat("i");
	  			String passf = pass().concat("09");
	  			
				String fullname = null;
	  				
	  			try {
	  					
	  				Class.forName(name());
	  				connz=(Connection)DriverManager.getConnection(urlth(),unamef,passf);
					
		  			pstmt=connz.prepareStatement("select * from profileinfo WHERE id =?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		  			pstmt.setString(1, ix);
		  			rs=pstmt.executeQuery();

					while (rs.next()) {
						fullname = rs.getString(5);
					}
					
					int lktyp = 3;
					int ckkk = countnotif();
					
					pstmt=connz.prepareStatement("INSERT INTO `notif`(`no`, `liker`, `fullname`, `postid`, `posterid`, `liketype`, `commtext`, `time`) VALUES (?,?,?,?,?,?,?,?)", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
					pstmt.setInt(1, ckkk);
					pstmt.setString(2, ix);
					pstmt.setString(3, fullname);
					pstmt.setString(4, postid);
					pstmt.setString(5, posterid);
					pstmt.setInt(6, lktyp);
					pstmt.setString(7, comm);
					pstmt.setString(8, time());
	  				pstmt.executeUpdate();
	  			
	  			connz.close();
	  			pstmt.close();
	  			} catch (Exception ex) {
	  			}
	  			
			}
			
			
			
			public static void thyupdatecomm(String ix, String posteridcomm, String postid, String ntfno, String commtext) {


				Connection conn=null;
				PreparedStatement pstmt = null;
	  			
	  			String unamef = uname().concat("i");
	  			String passf = pass().concat("09");
	  			
	  			try {
	  					
	  				Class.forName(name());
	  				conn=(Connection)DriverManager.getConnection(urlth(),unamef,passf);
					
	  				   pstmt=conn.prepareStatement("UPDATE `notif` SET `commtext` = ?, `time` = ? WHERE `liker` = ? AND `postid` = ? AND `no` = ?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				   	   pstmt.setString(1, commtext);
				   	   pstmt.setString(2, time());
				   	   pstmt.setString(3, posteridcomm);
				   	   pstmt.setString(4, postid);
				   	   pstmt.setInt(5, Integer.valueOf(ntfno));
				   	   pstmt.executeUpdate();
				   	   
	  			
	  			conn.close();
	  			pstmt.close();
	  			} catch (Exception ex) {}
	  			
			}
			
			
			
			public static void postit(String ix, String value, String movedat, int posttype, int privacy) {
				   
				   Connection conn=null;
		       	   PreparedStatement pstmt = null;
		       	   
		       	   String unamef = uname().concat("i");
		       	   String passf = pass().concat("09");
		       	   
				try {
	  			
		       	   Class.forName(name());
		       	   conn=(Connection)DriverManager.getConnection(urlth(),unamef,passf);
		       	
		       	   int x = countposts();
		       	   String fullname = getfullname(ix);
		       	   String postid = uidgen.id();

		       	   pstmt=conn.prepareStatement("INSERT INTO `posts`(`no`, `posterid`, `fullname`, `postid`, `text`, `pic`, `posttype`, `privacy`, `time`) VALUES(?,?,?,?,?,?,?,?,?)", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			   	   pstmt.setInt(1, x+1);
			   	   pstmt.setString(2, ix);
			   	   pstmt.setString(3, fullname);
			   	   pstmt.setString(4, postid);
			   	   pstmt.setString(5, value);
			   	   pstmt.setString(6, movedat);
			   	   pstmt.setInt(7, posttype);
			   	   pstmt.setInt(8, privacy);
			   	   pstmt.setString(9, time());
			   	   pstmt.executeUpdate();

			   	conn.close();
	  			pstmt.close();
				}catch (Exception ex) {}
				
			}
			
			
			
			
			public static void postitnoimg(String ix, String value, int posttype, int privacy) {
				   
				   Connection conn=null;
		       	   PreparedStatement pstmt = null;
		       	   
		       	   String unamef = uname().concat("i");
		       	   String passf = pass().concat("09");
		       	   
				try {
	  			
		       	   Class.forName(name());
		       	   conn=(Connection)DriverManager.getConnection(urlth(),unamef,passf);
		       	
		       	   int x = countposts();
		       	   String fullname = getfullname(ix);
		       	   String postid = uidgen.id();

		       	   pstmt=conn.prepareStatement("INSERT INTO `posts`(`no`, `posterid`, `fullname`, `postid`, `text`, `posttype`, `privacy`, `time`) VALUES(?,?,?,?,?,?,?,?)", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			   	   pstmt.setInt(1, x+1);
			   	   pstmt.setString(2, ix);
			   	   pstmt.setString(3, fullname);
			   	   pstmt.setString(4, postid);
			   	   pstmt.setString(5, value);
			   	   pstmt.setInt(6, posttype);
			   	   pstmt.setInt(7, privacy);
			   	   pstmt.setString(8, time());
			   	   pstmt.executeUpdate();

			conn.close();
	  		pstmt.close();
			}catch (Exception ex) {}
				
			}
			
			
			

			public static void postitad(String ix, String value, String movedat, int posttype, int privacy, String adticket, String country) {
				   
				   Connection conn=null;
		       	   PreparedStatement pstmt = null;
		       	   
		       	   String unamef = uname().concat("i");
		       	   String passf = pass().concat("09");
		       	   
				try {
	  			
		       	   Class.forName(name());
		       	   conn=(Connection)DriverManager.getConnection(urlth(),unamef,passf);
		       	
		       	   int x = countads();
		       	   String fullname = getfullname(ix);
		       	   String postid = uidgen.id();
		       	   
		       	   if (country != null) {
		       	   pstmt=conn.prepareStatement("INSERT INTO `ads`(`no`, `posterid`, `fullname`, `postid`, `text`, `pic`, `posttype`, `privacy`, `countryname`, `time`, `adticket`, `approval` ) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			   	   pstmt.setInt(1, x+1);
			   	   pstmt.setString(2, ix);
			   	   pstmt.setString(3, fullname);
			   	   pstmt.setString(4, postid);
			   	   pstmt.setString(5, value);
			   	   pstmt.setString(6, movedat);
			   	   pstmt.setInt(7, posttype);
			   	   pstmt.setInt(8, privacy);
			   	   pstmt.setString(9, country);
			   	   pstmt.setString(10, time());
			   	   pstmt.setString(11, adticket);
			   	   pstmt.setInt(12, 0);
			   	   pstmt.executeUpdate();
		       	   }
		       	   
		       	   else {
			       	   pstmt=conn.prepareStatement("INSERT INTO `ads`(`no`, `posterid`, `fullname`, `postid`, `text`, `pic`, `posttype`, `privacy`, `time`, `adticket`, `approval` ) VALUES(?,?,?,?,?,?,?,?,?,?,?)", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				   	   pstmt.setInt(1, x+1);
				   	   pstmt.setString(2, ix);
				   	   pstmt.setString(3, fullname);
				   	   pstmt.setString(4, postid);
				   	   pstmt.setString(5, value);
				   	   pstmt.setString(6, movedat);
				   	   pstmt.setInt(7, posttype);
				   	   pstmt.setInt(8, privacy);
				   	   pstmt.setString(9, time());
				   	   pstmt.setString(10, adticket);
				   	   pstmt.setInt(11, 0);
				   	   pstmt.executeUpdate();
			       	   }
		       	   
		    conn.close();
		    pstmt.close();
			}catch (Exception ex) {}
				
			}
			
			
			
			
			public static void postitadnoimg(String ix, String value, int posttype, int privacy, String adticket, String country) {
				   
				   Connection conn=null;
		       	   PreparedStatement pstmt = null;
		       	   
		       	   String unamef = uname().concat("i");
		       	   String passf = pass().concat("09");
		       	   
				try {
	  			
		       	   Class.forName(name());
		       	   conn=(Connection)DriverManager.getConnection(urlth(),unamef,passf);
		       	
		       	   int x = countads();
		       	   String fullname = getfullname(ix);
		       	   String postid = uidgen.id();
			   	   
			   	if (country != null) {
			       	   pstmt=conn.prepareStatement("INSERT INTO `ads`(`no`, `posterid`, `fullname`, `postid`, `text`, `posttype`, `privacy`, `countryname`, `time`, `adticket`, `approval` ) VALUES(?,?,?,?,?,?,?,?,?,?,?)", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				   	   pstmt.setInt(1, x+1);
				   	   pstmt.setString(2, ix);
				   	   pstmt.setString(3, fullname);
				   	   pstmt.setString(4, postid);
				   	   pstmt.setString(5, value);
				   	   pstmt.setInt(6, posttype);
				   	   pstmt.setInt(7, privacy);
				   	   pstmt.setString(8, country);
				   	   pstmt.setString(9, time());
				   	   pstmt.setString(10, adticket);
				   	   pstmt.setInt(11, 0);
				   	   pstmt.executeUpdate();
			       	   }
			       	   
			       	   else {
				       	   pstmt=conn.prepareStatement("INSERT INTO `ads`(`no`, `posterid`, `fullname`, `postid`, `text`, `posttype`, `privacy`, `time`, `adticket`, `approval` ) VALUES(?,?,?,?,?,?,?,?,?,?)", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
					   	   pstmt.setInt(1, x+1);
					   	   pstmt.setString(2, ix);
					   	   pstmt.setString(3, fullname);
					   	   pstmt.setString(4, postid);
					   	   pstmt.setString(5, value);
					   	   pstmt.setInt(6, posttype);
					   	   pstmt.setInt(7, privacy);
					   	   pstmt.setString(8, time());
					   	   pstmt.setString(9, adticket);
					   	   pstmt.setInt(10, 0);
					   	   pstmt.executeUpdate();
				       	   }
			
			conn.close();
	  		pstmt.close();
			}catch (Exception ex) {}
				
			}
			
			
			
			
			
			
			
			
			public static void postiteditdelimg(String ix, String value, int posttype, int privacy, String prevpostid) {
				   
				   Connection conn=null;
		       	   PreparedStatement pstmt = null;
		       	   ResultSet rs = null;
		       	   
		       	   String unamef = uname().concat("i");
		       	   String passf = pass().concat("09");
		       	   String pic = null;
		       	   String dir = null;
		       	   
				try {
	  			
		       	   Class.forName(name());
		       	   conn=(Connection)DriverManager.getConnection(urlth(),unamef,passf);
		       	   
		       	pstmt=conn.prepareStatement("SELECT * FROM posts WHERE postid=? AND posterid=?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
  		    	pstmt.setString(1, prevpostid);
				pstmt.setString(2, ix);
  				rs=pstmt.executeQuery();
  				rs.next();
  				pic=rs.getString(6);
  				if (pic!=null) {
	  		    dir = imagePath.concat(pic);
	  		    File postpic = new File(dir);
	  		  	postpic.delete();
	  			}
		       	   

		       	   pstmt=conn.prepareStatement("UPDATE `posts` SET `text` = ?, `pic` = ?, `posttype` = ?, `privacy` = ? WHERE `posterid` = ? AND `postid` = ?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			   	   pstmt.setString(1, value);
			   	   pstmt.setString(2, null);
			   	   pstmt.setInt(3, posttype);
			   	   pstmt.setInt(4, privacy);
			   	   pstmt.setString(5, ix);
			   	   pstmt.setString(6, prevpostid);
			   	   pstmt.executeUpdate();

			conn.close();
	  		pstmt.close();
	  		rs.close();
			}catch (Exception ex) {}
				
			}
			
			
			public static void postiteditnoimg(String ix, String value, int posttype, int privacy, String prevpostid) {
				   
				   Connection conn=null;
		       	   PreparedStatement pstmt = null;
		       	   
		       	   String unamef = uname().concat("i");
		       	   String passf = pass().concat("09");
		       	   
				try {
	  			
		       	   Class.forName(name());
		       	   conn=(Connection)DriverManager.getConnection(urlth(),unamef,passf);
		       	
		       	pstmt=conn.prepareStatement("UPDATE `posts` SET `text` = ?, `posttype` = ?, `privacy` = ? WHERE `posterid` = ? AND `postid` = ?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			   	   pstmt.setString(1, value);
			   	   pstmt.setInt(2, posttype);
			   	   pstmt.setInt(3, privacy);
			   	   pstmt.setString(4, ix);
			   	   pstmt.setString(5, prevpostid);
			   	   pstmt.executeUpdate();

			conn.close();
	  		pstmt.close();
			}catch (Exception ex) {}
				
			}
			
			
			
			
			public static void postitedit(String ix, String value, String movedat, int posttype, int privacy, String prevpostid) {
				   
				   Connection conn=null;
		       	   PreparedStatement pstmt = null;
		       	   
		       	   String unamef = uname().concat("i");
		       	   String passf = pass().concat("09");
		       	   
				try {
	  			
		       	   Class.forName(name());
		       	   conn=(Connection)DriverManager.getConnection(urlth(),unamef,passf);

		       	   pstmt=conn.prepareStatement("UPDATE `posts` SET `text` = ?, `pic` = ?, `posttype` = ?, `privacy` = ? WHERE `posterid` = ? AND `postid` = ?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			   	   pstmt.setString(1, value);
			   	   pstmt.setString(2, movedat);
			   	   pstmt.setInt(3, posttype);
			   	   pstmt.setInt(4, privacy);
			   	   pstmt.setString(5, ix);
			   	   pstmt.setString(6, prevpostid);
			   	   pstmt.executeUpdate();

			conn.close();
	  		pstmt.close();
			}catch (Exception ex) {}
				
			}
			
			
			

			public static boolean identify(String ix, String userid, int check) {
				
				
				String unamef = uname().concat("i");
		       	String passf = pass().concat("09");
				   
				Connection conn=null;
				Statement st=null;
				ResultSet rs=null;
				boolean identity = false;

				
				try {
					
					
					Class.forName("com.mysql.cj.jdbc.Driver");
					conn=(Connection)DriverManager.getConnection(urlus(),unamef,passf);
					st=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

					String qry="select * from `"+ix+"` WHERE forufid = '"+userid+"' AND yorn = '"+check+"'";
					rs=st.executeQuery(qry);
					
					if(rs.next()) {
						identity = true;
					}
					
			conn.close();
			}catch (Exception ex) {}
				return identity;
			}
			
			
			
			
			public static boolean validuid(String query) {
				
				String unamef = uname().concat("i");
		       	String passf = pass().concat("09");
				   
				Connection conn=null;
				ResultSet rs=null;
				PreparedStatement pstmt = null;
				boolean yesorno = false;

				
				try {
					
					
					Class.forName("com.mysql.cj.jdbc.Driver");
					conn=(Connection)DriverManager.getConnection(urlth(),unamef,passf);

					pstmt=conn.prepareStatement("select * from profileinfo WHERE id =?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
					pstmt.setString(1, query);
					rs=pstmt.executeQuery();
					
					if(rs.next()) {
						yesorno = true;
					}
					
			conn.close();
			pstmt.close();
			}catch (Exception ex) {}
				return yesorno;
			}
			
			
			
			
			public static boolean inputvalidatornum(int num) {

				boolean isvalid = false;
				try {
					
					
					if(num > -1 && num < 7) {
						isvalid = true;
					}
					

			}catch (Exception ex) {}
				return isvalid;
			}
			
			
			
			public static boolean inputvalidatorString(String normal, int key) {

				boolean isvalid = false;
				try {
					
					
					if(normal.length() < 96 && key == 1 && normal.replace("\\s", "").length() != 0) {
						//general
						isvalid = true;
					}
					
					else if(normal.length() < 2048 && key == 2 && normal.replace("\\s", "").length() != 0) {
						//comment
						isvalid = true;
					}
					
					else if(normal.length() < 5120 && key == 3 && normal.replace("\\s", "").length() != 0) {
						//post
						isvalid = true;
					}
					
					else if(normal.length() < 300 && key == 4 && normal.replace("\\s", "").length() != 0) {
						//bio
						isvalid = true;
					}
					

			}catch (Exception ex) {}
				return isvalid;
			}
			
			
			
			public static boolean inputvalidatorDate(String thedate) {

				boolean isvalid = false;
				
				try {
					
		  		    Date date=new SimpleDateFormat("yyyy-MM-dd").parse(thedate);  
		  			
		  		    Calendar cal = Calendar.getInstance();
		  		    cal.setLenient(false);
		  		    cal.setTime(date);
		  		    
					if (cal.getTime() != null) {
						isvalid = true;
					}


			}catch (Exception ex) {}
				return isvalid;
			}
			
			
			
			public static String csrftoken() {

				String token = null;
				
				try {
					
		 	    // TODO: Configure CSRF secret key in external configuration file
		 	    String key = "YOUR_CSRF_SECRET_KEY_HERE"; // Configure in external file
		 	    String random = Integer.toString(((int)(Math.random() * (90000)) + 10000));
		 	    token = random.concat(hasherfast.main(key.concat(random).concat("U9")));
		 	   


			}catch (Exception ex) {}
				return token;
			}
			
			
			
			public static boolean verifycsrftoken(String token) {

				boolean isvalid = false;
				
				try {
					
					String random = token.substring(0, 5);
		 	    // TODO: Configure CSRF secret key in external configuration file
		 	    String key = "YOUR_CSRF_SECRET_KEY_HERE"; // Configure in external file
		 		    
		 		    if(token.equals(random.concat(hasherfast.main(key.concat(random).concat("U9"))))) {
		 		    	isvalid = true;
		 		    }
		 		    


			}catch (Exception ex) {}
				return isvalid;
			}


}