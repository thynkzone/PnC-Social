<%@ page import="com.thynkzone.jsp.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
	
	String[] fetches = db.nameico(ix);
	String pname = fetches[0];
	String psmall = "img/".concat(fetches[1]);
	String msg = "Sorry, please try again.";
	
	String token = request.getParameter("csrf");
	if (db.verifycsrftoken(token)) {
	


	if (request.getParameter("bio") != null) {
	String bio=antisamy.safe(request.getParameter("bio"));
	if (bio != null && db.inputvalidatorString(bio, 4)) {
		   bio = base64.en(bio);
		   db.profileedit(ix, bio, -1);
		   msg = "Information Updated Successfully!";
	}
	}

	else if (request.getParameter("timezone") != null) {
		String timezone=antisamy.safe(request.getParameter("timezone"));
	 if (timezone != null && db.inputvalidatorString(timezone, 1)) {
		   db.profileedit(ix, timezone, 0);
		   msg = "Information Updated Successfully!";
	}
	}
	 
	else if (request.getParameter("job") != null) {
		String job=antisamy.safe(request.getParameter("job"));
	 if (job != null && db.inputvalidatorString(job, 1)) {
		   db.profileedit(ix, job, 1);
		   msg = "Information Updated Successfully!";
	}
	}

	 else if (request.getParameter("pos") != null) {
		 String pos=antisamy.safe(request.getParameter("pos"));
	 if (pos != null && db.inputvalidatorString(pos, 1)) {
		   db.profileedit(ix, pos, 2);
		   msg = "Information Updated Successfully!";
	}
	}
	
	 else if (request.getParameter("relationship") != null) {
		 String rel=antisamy.safe(request.getParameter("relationship"));
	 if (rel != null && db.inputvalidatorString(rel, 1)) {
		   db.profileedit(ix, rel, 3);
		   msg = "Information Updated Successfully!";
	}
	}
	
	 else if (request.getParameter("fbid") != null) {
		 String fbid=antisamy.safe(request.getParameter("fbid"));
	 if (fbid != null && db.inputvalidatorString(fbid, 1)) {
		   db.profileedit(ix, fbid, 4);
		   msg = "Information Updated Successfully!";
	}
	}
	
	 else if (request.getParameter("msngr") != null) {
		 String msngr=antisamy.safe(request.getParameter("msngr"));
	 if (msngr != null && db.inputvalidatorString(msngr, 1)) {
		   db.profileedit(ix, msngr, 5);
		   msg = "Information Updated Successfully!";
	}
	}
	
	 else if (request.getParameter("instaid") != null) {
		 String instaid=antisamy.safe(request.getParameter("instaid"));
	 if (instaid != null && db.inputvalidatorString(instaid, 1)) {
		   db.profileedit(ix, instaid, 6);
		   msg = "Information Updated Successfully!";
	}
	}
	

           
           

	session.setAttribute("msg", msg);
	response.sendRedirect("profile.jsp?userId="+ix);
	return;
	
	} else {
		//invalid csrf
		response.sendRedirect("index.jsp");
		session.setAttribute("msg", "Attempt unsuccessful");
		return;
	}
	
	}	catch (Exception ex) {
		response.sendRedirect("index.jsp");
		System.out.print(ex+"at set-one.jsp");
	}
%>

	</html>