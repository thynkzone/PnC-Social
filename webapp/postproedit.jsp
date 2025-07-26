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

        <%
           try {
           
           String ix = db.userid(request);
           String tester = ix.concat("a");


           // Production path: "/usr/local/tomcat9/webapps/ROOT/images"
           // String root="C:\\Users\\Farabi\\eclipse-workspace\\ROOT\\src\\main\\webapp\\images";
           String root="/usr/local/tomcat9/webapps/ROOT/images";
           MultipartRequest mr=new MultipartRequest(request, root, 31457280);
           
           String token = mr.getParameter("csrf");
           if (db.verifycsrftoken(token)) {
           
           
           @SuppressWarnings("unchecked")
           Enumeration<String> files = (Enumeration<String>) mr.getFileNames();

           String name = (String)files.nextElement();
           String fileName = mr.getFilesystemName(name);
           String type = mr.getContentType(name);
           
           String value = base64.en(antisamy.safe(mr.getParameter("text")));
           int posttype = Integer.valueOf(antisamy.safe(mr.getParameter("pstcat")));
           int privacy = Integer.valueOf(antisamy.safe(mr.getParameter("privacy")));
           String prevposterid = antisamy.safe(mr.getParameter("prevposterid"));
           String postid = antisamy.safe(mr.getParameter("prevpostid"));
           String previmgurl = mr.getParameter("previmgurl");
           String deeel = mr.getParameter("delpic");
           String movedat = null;
           
           if (previmgurl != null) {
           previmgurl = antisamy.safe(previmgurl);
           
           if (db.inputvalidatornum(posttype) && db.inputvalidatornum(privacy) && db.inputvalidatorString(value, 3) && db.inputvalidatorString(previmgurl, 2)) {
        	   
           if (ix.equals(prevposterid)) {
        	  

           String fuid = uidgen.id();
           String newfiledir = null;
           
           if (fileName != null) {
           String oldfiledir = root + "/" + fileName;
           newfiledir = root + "/" + fuid + fileName;
           File myFile = new File(oldfiledir);
           File myFile2 = new File(newfiledir);
           myFile.renameTo(myFile2);
           }
           
           if (deeel != null) {
        	   deeel = antisamy.safe(deeel);
           if (deeel.equals("1") && newfiledir != null) {
               movedat = move4.main(newfiledir, previmgurl);
               }
               
           else if (deeel.equals("0") && newfiledir != null) {
               previmgurl = "gref";
               movedat = move4.main(newfiledir, previmgurl);
               }
           
           else if (deeel.equals("1") && newfiledir == null) {
        	   move5.main(previmgurl);
        	   db.postiteditdelimg(ix, value, posttype, privacy, postid);
        	   movedat = "35";
        	   //35 is token so none of below 2 conditions execute code
               }
           
           //if deeel is 0, movedat is null
           }
           
           
           else if (deeel == null && newfiledir != null) {
        	   // Auto-delete previous picture when new image is uploaded
        	   movedat = move4.main(newfiledir, previmgurl);
           }
           
           if (movedat == null && newfiledir != null) {
        	   //uploaded image might be jpeg cmyk which cannot be read
        	   response.sendRedirect("edit-post.jsp");
 			   session.setAttribute("msg", "Invalid Image File!");
 			   return;
           }
           
           if (movedat == null && newfiledir == null) {
        	   db.postiteditnoimg(ix, value, posttype, privacy, postid);
           }
           
           else if (movedat != null && !movedat.equals("35")) {
        	   db.postitedit(ix, value, movedat, posttype, privacy, postid);
           }
           }

	   	   response.sendRedirect("index.jsp");
	   	   session.setAttribute("msg", "Successfully Edited! View in Your Profile.");
	   	   return;
	   	   
           }
			
			else {
	        	   //input invalid
	        	   response.sendRedirect("index.jsp");
	    	   	   session.setAttribute("msg", "Attempt unsuccessful.");
	    	   	   return;
	           }
           }
           
           else {
           	if (db.inputvalidatornum(posttype) && db.inputvalidatornum(privacy) && db.inputvalidatorString(value, 3)) {
           		if (ix.equals(prevposterid)) {
           			db.postiteditnoimg(ix, value, posttype, privacy, postid);
           		}
           		
           	   response.sendRedirect("index.jsp");
        	   	   session.setAttribute("msg", "Successfully Edited! View in Your Profile.");
        	   	   return;
           	}
           	
           	else {
	        	   //input invalid
	        	   response.sendRedirect("index.jsp");
	    	   	   session.setAttribute("msg", "Attempt unsuccessful.");
	    	   	   return;
	           }
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

</html>