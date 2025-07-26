<%@ page import="com.thynkzone.jsp.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page import="java.util.ArrayList"%>
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

    <body>
        <%
           try {
           
           String ix = db.userid(request);
           String tester = ix.concat("a");


           // Production path: "/usr/local/tomcat9/webapps/ROOT/images"
           // String root="C:\\Users\\Farabi\\eclipse-workspace\\ROOT\\src\\main\\webapp\\images";
           String root="/usr/local/tomcat9/webapps/ROOT/images";
           MultipartRequest mr=new MultipartRequest(request, root, 31457280);
           
           
           @SuppressWarnings("unchecked")
           Enumeration<String> files = (Enumeration<String>) mr.getFileNames();

           String name = (String)files.nextElement();
           String fileName = mr.getFilesystemName(name);
           String type = mr.getContentType(name);
           
           String value = base64.en(antisamy.safe(mr.getParameter("text")));
           int posttype = Integer.valueOf(antisamy.safe(mr.getParameter("pstcat")));
           int privacy = Integer.valueOf(antisamy.safe(mr.getParameter("privacy")));
           String adticket = antisamy.safe(mr.getParameter("adticket"));
           String country = null;
           
           String token = mr.getParameter("csrf");
           if (db.verifycsrftoken(token)) {
           
           country = antisamy.safe(mr.getParameter("country"));
           if (country.equals("Select Country")) {
        	   country = null;
           }
           
           int flag = 1;
           
           
           if (db.inputvalidatornum(posttype) && db.inputvalidatornum(privacy) && db.inputvalidatorString(adticket, 2)) {
           
           if (value.length() > 50 && (privacy == 1 || privacy == 4) || value.length() > 150 && (privacy == 2 || privacy == 5) || value.length() > 300 && (privacy == 3 || privacy == 6)) {
        	   flag = 0;
        	   response.sendRedirect("advertisements.jsp");
        	   session.setAttribute("msg", "Please keep your text within your ad's character limit.");
        	   return;
           }
           
           if (privacy < 4 && country == null) {
        	   flag = 0;
        	   response.sendRedirect("advertisements.jsp");
        	   session.setAttribute("msg", "Please select a country.");
        	   return;
           }
           
           if (privacy > 4 && country != null) {
        	   flag = 0;
        	   response.sendRedirect("advertisements.jsp");
        	   session.setAttribute("msg", "Please select the correct post type.");
        	   return;
           }
           
           String fuid = uidgen.id();
           String newfiledir = null;
           
           if (flag == 1) {
           if (fileName != null) {
           String oldfiledir = root + "/" + fileName;
           newfiledir = root + "/" + fuid + fileName;
           File myFile = new File(oldfiledir);
           File myFile2 = new File(newfiledir);
           myFile.renameTo(myFile2);
           }
           String movedat = null;
           if (newfiledir != null) { 
           movedat = move3.main(newfiledir);
           }
           
           if (movedat == null && newfiledir != null) {
        	   //uploaded image might be jpeg cmyk which cannot be read
        	   response.sendRedirect("advertisements.jsp");
 			   session.setAttribute("msg", "Invalid Image File!");
 			   return;
           }
           
           if (movedat == null && newfiledir == null) {
        	   db.postitadnoimg(ix, value, posttype, privacy, adticket, country);
           }

           
           else if (movedat != null) {
        	   db.postitad(ix, value, movedat, posttype, privacy, adticket, country);
           }
	   	   

	   	   response.sendRedirect("advertisements.jsp");
	   	   session.setAttribute("msg", "Successfully submitted!");
	   	   return;
           }
           
           }
           
           else {
        	   //input unvalid
        	   response.sendRedirect("advertisements.jsp");
    	   	   session.setAttribute("msg", "Attempt unsuccessful.");
    	   	   return;
           }
           
		   } else {
				//invalid csrf
				response.sendRedirect("index.jsp");
				session.setAttribute("msg", "Attempt unsuccessful");
				return;
			}
           
           
           } catch (Exception e) {
        	   response.sendRedirect("index.jsp");
			   session.setAttribute("msg", "Possibly Invalid File Format.");
           }
        %>
        
    </body>
</html>