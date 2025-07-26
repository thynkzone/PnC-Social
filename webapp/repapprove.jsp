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


String token = request.getParameter("csrf");
if (db.verifycsrftoken(token)) {

			String x = null;
			String y = null;

			x = antisamy.safe(request.getParameter("quixes"));
			y = antisamy.safe(request.getParameter("quixes2"));
			if (x != null && y != null) {
				db.thymanagerrepdel(x, y);
				response.sendRedirect("manage-reports.jsp");
				return;
			}
			
} else {
	//invalid csrf
	response.sendRedirect("index.jsp");
	session.setAttribute("msg", "Attempt unsuccessful");
	return;
}
			
			} catch(Exception ex) {
				System.out.print(ex+"at repapprove.jsp");
				}
	%>

	</html>
				
				
				
				