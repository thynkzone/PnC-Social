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
			String y = null;
			String z = null;
			x = base64.en(antisamy.safe(request.getParameter("commentbox")));
			y = antisamy.safe(request.getParameter("postid"));
			z = antisamy.safe(request.getParameter("posterid"));
			
		if (db.inputvalidatorString(x, 2)) {

			if (x != null && y != null && z != null) {
				db.thycomm(ix, x, y, z);
				session.setAttribute("msg", "Commented Successfully!");
				response.sendRedirect("profile.jsp?userId="+z+"#"+y);
				return;
			}
			
			
			}
				else {
			   //input invalid
			   response.sendRedirect("index.jsp");
			   session.setAttribute("msg", "Attempt unsuccessful.");
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
				System.out.print(ex+"at sommycommdum.jsp");
				}
	%>

	</html>
				
				
				
				