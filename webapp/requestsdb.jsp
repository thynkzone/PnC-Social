<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.thynkzone.jsp.*" %>
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
  		try
			{
  			 
  			String ix = db.userid(request);
  		 	String tester = ix.concat("a");

  		 	String[] fetches = db.nameico(ix);
			String pname = fetches[0];
			String psmall = "img/".concat(fetches[1]);


String token = request.getParameter("csrf");
if (db.verifycsrftoken(token)) {

			String x = null;
			x = antisamy.safe(request.getParameter("jiaxes"));
			if (x != null && x.length() > 3) {
				
				// Extract the user ID from the request type (e.g., "ufr12345" -> "12345")
				String targetUserId = x.substring(3);
				
				// Validate the target user ID before processing
				boolean isValid = db.validuid(targetUserId);
				
				if (isValid) {
					// Process the request
					db.handlingrequests(ix, x);
					
					// Redirect back to the profile with success
					response.sendRedirect("profile.jsp?userId=" + targetUserId);
					return;
				} else {
					// Invalid user ID - redirect back to current user's profile with error message
					response.sendRedirect("profile.jsp?userId=" + ix);
					session.setAttribute("msg", "User not found or action could not be completed. Debug: targetUserId=" + targetUserId);
					return;
				}
			} else {
				// Invalid request format
				response.sendRedirect("index.jsp");
				session.setAttribute("msg", "Invalid request format. Debug: jiaxes=" + x);
				return;
			}
			
} else {
	//invalid csrf
	response.sendRedirect("index.jsp");
	session.setAttribute("msg", "Attempt unsuccessful");
	return;
}
			
			} catch(Exception ex) {
				response.sendRedirect("index.jsp");
				session.setAttribute("msg", "An error occurred while processing your request.");
				System.out.print(ex+"at requestsdb.jsp");
				}
	%>

	</body>
	</html>
				
				
				
				