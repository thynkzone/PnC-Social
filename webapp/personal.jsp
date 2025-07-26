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
	try
	{
		String ix = db.userid(request);
		String tester = ix.concat("a");

		String[] fetches = db.nameico(ix);
	String pname = fetches[0];
	String psmall = fetches[1];
	int flag = 1;
	
	if (pname != null){
		flag = 0;
		response.sendRedirect("index.jsp");
		session.setAttribute("msg", "Already logged in!");
		return;
	}
	
	else if (psmall != null){
		flag = 0;
		response.sendRedirect("index.jsp");
		session.setAttribute("msg", "Already logged in!");
		return;
	}
	
	else if (pname==null && psmall==null) {
	
	String token = request.getParameter("csrf");
	if (db.verifycsrftoken(token)) {
	
	String fname=antisamy.safe(request.getParameter("first"));
	String sname=antisamy.safe(request.getParameter("sur"));
	String bd=request.getParameter("bday");
	String gen=request.getParameter("gender");
	String about=antisamy.safe(request.getParameter("bio"));
	String country=request.getParameter("country");
	String timezonex=request.getParameter("timezone");
	
	if(fname==null || fname.length() < 2 || sname==null || sname.length() < 2 || about==null || bd==null || gen==null || gen.length() < 3 || country==null || timezonex==null) {
			flag = 0;
			response.sendRedirect("logout.jsp");
			session.setAttribute("msg", "Please fill the form correctly.");
			return;
	}
	
	String fullname=antisamy.safe(fname + " ".concat(sname));
	String timezone = timezonex.substring(0 , timezonex.indexOf("~"));
	String place = timezonex.substring(timezonex.indexOf("~")+1);
	
	int m = Integer.valueOf(bd.substring(8, 10));
	int d = Integer.valueOf(bd.substring(5, 7));
	int y = Integer.valueOf(bd.substring(0, 4));
		
	if (db.inputvalidatorString(fname, 1) && db.inputvalidatorString(sname, 1) && db.inputvalidatorDate(bd) && db.inputvalidatorString(gen, 1) && db.inputvalidatorString(about, 4) && db.inputvalidatorString(country, 1) && db.inputvalidatorString(timezonex, 4)) {
		
	
	if(agecalc.main(m, d, y) < 1 || agecalc.main(m, d, y) > 120) {
			flag = 0;
			response.sendRedirect("logout.jsp");
			session.setAttribute("msg", "Please enter the correct birthdate.");
			return;
	}

	else if((!gen.equals("Male")) && (!gen.equals("Female")) && (!gen.equals("Other"))) {
			flag = 0;
			response.sendRedirect("logout.jsp");
			session.setAttribute("msg", "Please fill up the form as instructed.");
			return;
	}
	
	else if (flag == 1) {
		about = base64.en(about);
        db.setprofileinfos(ix, fname, sname, fullname, bd, gen, about, country, place, timezone);
        db.setprofilepic(ix, "TH_PO_jWrhhqKc_238b3f45-c35a-47fc-afb9-f80800ffbc8b_XUfYX89F.png");
        db.setbgpic(ix, "blank.webp");
        session.removeAttribute("newuser"); // Remove newuser flag after profile completion
	   	response.sendRedirect("index.jsp");
	   	session.setAttribute("msg", "Congratulations on signing up at Thynkzone! Add a profile picture to let your friends know it's you.");
	   	return;
	}
        
        
	}
		else {
 	   //input invalid
 	   response.sendRedirect("logout.jsp");
	   	   session.setAttribute("msg", "Attempt was unsuccessful.");
	   	   return;
    }
	
	
	} else {
		//invalid csrf
		response.sendRedirect("logout.jsp");
		session.setAttribute("msg", "Attempt is unsuccessful.");
		return;
	}
	
}

	
	}	catch (Exception ex) {
		response.sendRedirect("logout.jsp");
		session.setAttribute("msg", "Login and fill up All of the required information. Please try again.");
		System.out.print(ex+"at personal.jsp");
	}
%>

	</html>