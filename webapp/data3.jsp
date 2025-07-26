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
			
		String ema3=session.getAttribute("ema2").toString();
		String pass3=hasher.main(session.getAttribute("pass2").toString());
		String phone3=session.getAttribute("phone2").toString();
		
		
		String mycode = session.getAttribute("rancodee").toString();
		String entrycode = hasherfast.main(base64.en(request.getParameter("codee")));
		
		String salt;
		String bcrypted;
		String peppere;
		String peppered;
		String keyz;
		String ksaltz;
		String enccrd;
		
		
		if(!mycode.equals(entrycode)) {

				response.sendRedirect("signup.jsp");
				session.setAttribute("msg", "Please enter the correct code.");
				return;

		}
			
			
			salt = bsalt.main();
			peppere = Rancook.ran();
			peppered = pass3.concat(peppere);
			bcrypted = bcrypt.main(peppered, salt);
			
			keyz = hasher.main(peppere);
			ksaltz = hasher.main(salt).concat(bf.word());
			enccrd = encdecry.encry(bcrypted, keyz, ksaltz);
			
			
			
			String uid = uidgen.id();
			db.profileput(uid);
			db.createuserstable(uid);
			db.registerput(uid, ema3, enccrd, phone3, salt, peppere);

			
			response.sendRedirect("add-information.jsp");
			session.setAttribute("newuser", "newuser");
			session.removeAttribute("ema2");
			session.removeAttribute("pass2");
			session.removeAttribute("phone2");
			session.removeAttribute("rancodee");
			return;

		
		} else {
			//invalid csrf
			response.sendRedirect("index.jsp");
			session.setAttribute("msg", "Attempt unsuccessful");
			return;
		}
		
	} catch (Exception ex) {
		response.sendRedirect("signup.jsp");
		System.out.print(ex+"at data3.jsp");
	}
	%>
	
	<%}%>

	</html>