<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.thynkzone.jsp.*" %>

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

  		try
			{
  			 
  		 	String ix = db.userid(request);
  		 	String tester = ix.concat("a");

			String[] headers = db.delcookie(ix, request);
			String attributesofd = headers[0];
			String attributesofa = headers[1];
			
			response.addHeader("Set-Cookie", attributesofd);
			response.addHeader("Set-Cookie", attributesofa);
			
			response.sendRedirect("login.jsp");
			return;
			
			
	
	//delete browser cookies + delete db cookies
}
	catch(Exception ex) {
		response.sendRedirect("index.jsp");
		System.out.print(ex+"at logout.jsp");
		}
%>

</body>

</html>		