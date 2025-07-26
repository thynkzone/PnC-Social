<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.thynkzone.jsp.*" %>
<%@page import="java.util.regex.Pattern"%>
<%@page import="org.apache.commons.validator.routines.EmailValidator"%>
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
	
	<link rel = "stylesheet" type = "text/css" href = "css-pages.css"> <link rel="preconnect" href="https://fonts.googleapis.com"> <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin> <link rel="preload" href="https://fonts.googleapis.com/css2?family=Oswald:wght@400;700&family=Poppins&display=swap" as ="style" crossorigin> <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@400;700&family=Poppins&display=swap" rel="stylesheet" crossorigin> <link rel="preload" as="image" href="icon/p&c.png"> <link rel="preload" as="image" href="icon/home.png"> <link rel="preload" as="image" href="icon/thynkmates-and-fans.png"> <link rel="preload" as="image" href="icon/notifications.png"> <link rel="preload" as="image" href="icon/drop-settings.png"> <link rel="preload" as="image" href="icon/more.png"> <link rel="preload" as="image" href="icon/searchbutton.png">

<style>
:root {
  --bg-main: #18181b;
  --bg-card: rgba(36, 37, 46, 0.85);
  --bg-glass: rgba(36, 37, 46, 0.65);
  --bg-tertiary: #23232a;
  --accent-primary: #1da1f2;
  --accent-secondary: #0a8cd8;
  --accent-danger: #e0245e;
  --accent-success: #10b981;
  --text-primary: #fff;
  --text-secondary: #b0b3b8;
  --text-muted: #888;
  --border-primary: #2c2f36;
  --shadow-md: 0 2px 12px 0 rgba(0,0,0,0.18);
  --shadow-lg: 0 8px 32px 0 rgba(0,0,0,0.25);
  --transition: all 0.2s cubic-bezier(.4,0,.2,1);
}
body {
font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Arial, sans-serif;  background: var(--bg-main) !important;
  color: var(--text-primary);
  margin: 0;
  min-height: 100vh;
  transition: background 0.3s, color 0.3s;
}
.main-center-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: flex-start;
  min-height: 100vh;
  padding: 2.5rem 1rem 2rem 1rem;
}
.verify-card {
  margin: 2rem 0 1.5rem 0;
  max-width: 400px;
  width: 100%;
  background: var(--bg-card);
  border-radius: 16px;
  box-shadow: var(--shadow-md);
  padding: 1.5rem 1.2rem 1.2rem 1.2rem;
  border: 1px solid var(--border-primary);
  overflow: hidden;
  display: flex;
  flex-direction: column;
  align-items: center;
}
.verify-card h2 {
  font-size: 1.15rem;
  font-weight: 600;
  color: var(--accent-primary);
  text-align: center;
  margin-bottom: 1.2rem;
}
.input-container {
  display: flex;
  width: 100%;
  margin-bottom: 1.2rem;
}
.input-field {
  width: 100%;
  padding: 0.75rem 1rem;
  border-radius: 25px;
  border: none;
  background: var(--bg-main);
  color: var(--text-primary);
  font-size: 1rem;
  font-family: inherit;
  transition: box-shadow 0.2s;
  margin-bottom: 0.5rem;
  box-shadow: none;
}
.input-field:focus {
  outline: 2px solid var(--accent-primary);
  background: var(--bg-glass);
}
.button {
  background: var(--accent-primary);
  color: #fff;
  border: none;
  border-radius: 8px;
  padding: 0.75rem 2rem;
  font-size: 1rem;
  font-weight: 600;
  cursor: pointer;
  transition: background 0.2s;
  margin-top: 0.5rem;
  box-shadow: var(--shadow-md);
  width: 100%;
  display: block;
}
.button:hover {
  background: var(--accent-secondary);
  color: #fff;
}
.info-box {
  max-width: 400px;
  margin: 1.5rem auto 0 auto;
  color: var(--text-secondary);
  font-size: 0.98rem;
  background: var(--bg-glass);
  border-radius: 10px;
  padding: 1rem 1.2rem;
  text-align: center;
}
@media (max-width: 500px) {
  .verify-card, .info-box {
    max-width: 98vw;
    padding: 0.8rem 0.5rem;
    border-radius: 10px;
  }
  .main-center-container {
    padding: 1.2rem 0.2rem 1.2rem 0.2rem;
  }
}
.topnav {
  width: 100%;
  background: var(--bg-card);
  box-shadow: var(--shadow-md);
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 0.5rem 1.5rem;
  position: sticky;
  top: 0;
  z-index: 100;
}
.topnav .logo-section {
  display: flex;
  align-items: center;
  gap: 0.7rem;
}
.topnav .logo-section img {
  height: 38px;
  width: 38px;
  border-radius: 8px;
}
.topnav .logo-section .name {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Arial, sans-serif;  font-size: 1.25rem;
  font-weight: 700;
  color: var(--accent-primary);
  letter-spacing: 1px;
  text-decoration: none;
}
</style>
	
	</head>
	
	<body>

<%

	if (db.userid(request) != null) {
		response.sendRedirect("index.jsp");
		return;
	}
	
	else {

	

	try {
		
		String token = request.getParameter("csrf");
		if (db.verifycsrftoken(token)) {
			
			String gtoken=request.getParameter("g-recaptcha-response");
			//no use antisamy, they dont accept data-sitekey
			if(reCaptchaV2.main(gtoken)) {
		
	String ema=antisamy.safe(request.getParameter("email"));
	String emaed = encdecry.encry(ema, cf.word(), ss.word());
	
	// String pwd
	// HIDDEN FOR DEMO
	
	String phone=antisamy.safe(request.getParameter("phone"));
	String phonez = encdecry.encry(phone, ss.word(), cf.word());
	
	int flag = 1;
	
	
	if (ema.length() < 5 || !Pattern.matches("^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-.]+$", ema) || !EmailValidator.getInstance().isValid(ema) || !emval.check(ema)) {
		try
		{
				response.sendRedirect("signup.jsp");
				session.setAttribute("msg", "Incorrect format of email address!");
				flag = 0;
				return;
			}catch(Exception ex) {
			}
		}
	
	if(!request.getParameter("pwd").equals(request.getParameter("pwd2"))) {
		try
	{
			response.sendRedirect("signup.jsp");
			session.setAttribute("msg", "Please re-type the password correctly");
			flag = 0;
			return;
		}catch(Exception ex) {
		}
	}
	
	if(request.getParameter("pwd")==null || request.getParameter("pwd").length() < 8 || !Pattern.matches("^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*#?&+=_,.-/(){}])[A-Za-z\\d@$!%*#?&+=_,.-/(){}]{8,}$", request.getParameter("pwd"))) {
		try
	{
			response.sendRedirect("signup.jsp");
			session.setAttribute("msg", "Password must be at least 8 charecters long!<br>(with at least one letter, one number and one special charecter)");
			flag = 0;
			return;
		}catch(Exception ex) {
		}
	}
	
	if(phone==null || phone.length() < 3) {
		try
	{
			response.sendRedirect("signup.jsp");
			session.setAttribute("msg", "Account recovery code must be of more than 3 charecters!");
			flag = 0;
			return;
		}catch(Exception ex) {
		}
	}
	
	if (!request.getParameter("checkboxhidden").equals("1")) {
		try
		{
				response.sendRedirect("signup.jsp");
				session.setAttribute("msg", "Accept the terms and conditions in order to create an account.");
				flag = 0;
				return;
			}catch(Exception ex) {
			}
	}
	
	if (request.getParameter("js") != null) {
		try
		{
				response.sendRedirect("signup.jsp");
				session.setAttribute("msg", "You don't have javascript enabled.<br>Enable/Unblock javascript in browser settings.");
				flag = 0;
				return;
			}catch(Exception ex) {
			}
	}
	
	
	else if (db.checkifemailexists(emaed) == 0) {

	response.sendRedirect("signup.jsp");
	session.setAttribute("msg", "This email already has an account.");
	flag = 0;
	return;
	
	}
	
	if (flag == 1) {
	
	%>
	<noscript>
	<style type="text/css">
        .formx {display:none;}
    </style>
    <meta HTTP-EQUIV="refresh" content=0;url="signup.jsp">
    </noscript>
    <%
	
	int rancode = (int)(Math.random() * 900000) + 100000;
	String randy = Integer.toString(rancode);
	String Mesg = "Hello, "+System.lineSeparator()+System.lineSeparator()+"Thank you for signing up at Thynkzone. Your verification code is "+randy+System.lineSeparator()+System.lineSeparator()+"Please ignore this message if you did not request this."+System.lineSeparator()+System.lineSeparator()+"Best Regards from Thynkzone.";
	Mailer.send("thynkzone.help@gmail.com",db.empass().concat("cox"),ema,"Thynkzone Sign Up Verification Code",Mesg);
	session.setAttribute("rancodee", hasherfast.main(base64.en(randy)));
	session.setAttribute("pass2", pwd);
	session.setAttribute("ema2", emaed);
	session.setAttribute("phone2", phonez);

	session.removeAttribute("ema");
	session.removeAttribute("pwd");
	session.removeAttribute("phone");
	
	%>
	
	<!-- Modern Navbar (logo, app name, no dark mode toggle) -->
<nav class="topnav">
  <div class="logo-section">
    <a href="index.jsp"><img src="icon/p&c.png" alt="P&C Logo"></a>
    <a href="index.jsp" class="name">People & Culture</a>
  </div>
</nav>
<div class="main-center-container">
	
	<form class="verify-card" name="frm" action="data3.jsp" method="POST">
	<h2><i class="fa-solid fa-envelope-circle-check"></i> Verify Email Address</h2>
	<div style="margin-bottom: 0.7rem; color: var(--text-secondary); text-align: center;">Enter the code we sent to your email</div>
	
	<div class="input-container">
	<input class="input-field" type ="number" name="codee" value="" placeholder="######" size="25" required>
	</div>
	
	<INPUT TYPE="HIDDEN" NAME="csrf" VALUE="<%=db.csrftoken()%>">
	
	<button class="button">Done</button>
	</form>
	<br><br>
	
	<div class="info-box">
	Make sure you entered your email address correctly.
	You may want to check your SPAM folder if you didn't get the code.<br><br>
	<a href='signup.jsp' style="text-decoration: none;"><button class="button" style="width: 100%; max-width: 200px; margin: 0 auto;">Register Again</button></a>
	</div>
	
	<div style="max-width:450px; margin: auto; margin-bottom: 40px">
	<%
	try
	{
		String msg=session.getAttribute("msg").toString();
		out.print("<p class = 'notifmsg'>"+msg+"</p>");
		%>
		<script>
		var x = "Fill up the form Correctly";
		alert(x);
		</script>
		<%
		session.removeAttribute("msg");
	} catch(Exception ex) {}
	%>
	
	</div>
	
	<script type="text/javascript">
    if ( window.history.replaceState ) {
        window.history.replaceState( null, null, window.location.href );
    }
	</script>
	
	<script type="text/javascript">
	setTimeout(function(){ window.location = "index.jsp"; },3000000);
	</script>
<%	
}
	
			}
			else {
					//input g-captcha
	        	   response.sendRedirect("signup.jsp");
	    	   	   session.setAttribute("msg", "Denied by Google reCaptcha. Try again.");
	    	   	   return;
	           }
			
	} else {
		//invalid csrf
		response.sendRedirect("index.jsp");
		session.setAttribute("msg", "Attempt unsuccessful");
		return;
	}
	
	
	} catch(Exception ex) {
	System.out.print(ex+"at verify-code.jsp");
	response.sendRedirect("signup.jsp");
	session.setAttribute("msg", "Attempt unsuccessful.");
}
	
	}
%>
	
	</div>
	<script>
document.addEventListener('DOMContentLoaded', function() {
  // Remove dark mode toggle JS and button
});
</script>
	</body>
	</html>