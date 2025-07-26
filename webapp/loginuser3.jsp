<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.thynkzone.jsp.*" %>
<%@page import="java.sql.*" %>
<%@ page import="antisamyfile.antisamy" %>

<!DOCTYPE html>
	<html lang = "en">
	<head>
	<link rel="icon" href="icon/favicon.ico" type="image/x-icon">
	<title>P&C</title>
	<meta charset = "UTF-8">
	<meta name="description" content="P&C (People and Culture) is a workplace social network for employees to share experiences, updates, memes, and insights about their jobs and organizational life."/>
<meta name="keywords" content="People and Culture, workplace social network, employee community, company culture, office memes, job updates, coworker engagement, P&C app, organizational culture, share work life, employee stories"/>
	<meta name="author" content="Md. Mazidul Haque Farabi"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	</head>
	

	<%

	if (db.userid(request) != null) {
		response.sendRedirect("index.jsp");
		return;
	}
	
	else {
	
			try
		{
				String token = request.getParameter("csrf");
				if (db.verifycsrftoken(token)) {
				
				String gtoken=request.getParameter("g-recaptcha-response");
				if(reCaptchaV3.main(gtoken)) {

				String emkx=antisamy.safe(request.getParameter("email"));
				String em =encdecry.encry(emkx, cf.word(), ss.word());
				
				// String pw
				// HIDDEN FOR DEMO
				 
					Connection conn=null;
					
					ResultSet rs=null;
					PreparedStatement pstmt=null;
					PreparedStatement pstmt2=null;
					
					int key = 0;
					int attempts = 0;
				
			// Admin authentication should be implemented securely
			// using database-based admin accounts or external configuration
			
			else if (key == 0) {
				
				Class.forName(db.name());
				String unamef = db.uname().concat("i");
				String passf = db.pass().concat("09");
				conn=(Connection)DriverManager.getConnection(db.urlth(),unamef,passf);
			
			String salt;
			String bcrypted;
			String peppere;
			String peppered;
			
			String keyz;
			String ksaltz;
			
			String qry="select * from registerform where email = ?";
			pstmt = conn.prepareStatement(qry, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			pstmt.setString(1, em);
			rs=pstmt.executeQuery();
			
			if(rs.next())
			{			
				attempts = rs.getInt(11);
						
				if (attempts < 15) {
					
					String usrid = rs.getString(2);
					
					salt = rs.getString(6);
					peppere = rs.getString(7);
					peppered = pw.concat(peppere);
					bcrypted = bcrypt.main(peppered, salt);
					
					keyz = hasher.main(peppere);
					ksaltz = hasher.main(salt).concat(bf.word());
					
						if (bcrypted.equals(encdecry.decry(rs.getString(4), keyz, ksaltz))) {
							
							
					String bx = Rancook.ran();
					String ac = Rund.green();			
					
					String attributesofd = "Thynkzoned="+bx+"; Path=/; HttpOnly; secure; SameSite=strict; Priority=High; max-age="+60*60*24*14;
					response.addHeader("Set-Cookie", attributesofd);
					
					String attributesofa = "Thynkzonea="+ac+"; Path=/; HttpOnly; secure; SameSite=strict; Priority=High; max-age="+60*60*24*14;
					response.addHeader("Set-Cookie", attributesofa);
					
					String bbx = hasher.main(bx);
					String aac = hasher.main(ac);
					
					int t = Integer.parseInt(db.Dateint());
					
					pstmt2=conn.prepareStatement("UPDATE registerform SET d=?, a=?, t=?, try=0 WHERE id=?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
					pstmt2.setString(1, bbx);
				   	pstmt2.setString(2, aac);
				   	pstmt2.setInt(3, t);
				   	pstmt2.setString(4, usrid);
				   	pstmt2.executeUpdate();
				   	// Check if profile is complete
				   	String[] fetches = db.nameico(usrid);
				   	String pname = fetches[0];
				   	if (pname != null && pname.length() > 1) {
				   		response.sendRedirect("index.jsp");
				   		return;
				   	} else {
				   		response.sendRedirect("add-information.jsp");
				   		session.setAttribute("newuser", "newuser");
				   		return;
				   	}
					}
						
						else {
							pstmt2=conn.prepareStatement("UPDATE registerform SET try=? WHERE id=?", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
							pstmt2.setInt(1, attempts+1);
							pstmt2.setString(2, usrid);
							pstmt2.executeUpdate();
							response.sendRedirect("login.jsp");
							session.setAttribute("msg", "Wrong Email or Password.");
							return;
						}
			}
				else {
				//too many login attempts
				response.sendRedirect("forgotpass.jsp");
				return;
					 }
			} 
				else {
    	   		//email incorrect
    	   		response.sendRedirect("login.jsp");
				session.setAttribute("msg", "Wrong Email or Password.");
	   	   		return;
       			}
		}
			
				}
				else {
					   //input g-captcha
		        	   response.sendRedirect("login.jsp");
		        	   session.setAttribute("msg", "Denied by Google reCaptcha. Try again.");
		    	   	   return;
		           }
				
				} else {
					//invalid csrf
					response.sendRedirect("login.jsp");
					session.setAttribute("msg", "Attempt unsuccessful");
				}

			
		} catch(Exception ex) {
			System.out.print(ex+"at loginuser3.jsp");
			response.sendRedirect("login.jsp");
			session.setAttribute("msg", "Wrong Email or Password.");
		}
	%>
	
	<%}%>

	</html>