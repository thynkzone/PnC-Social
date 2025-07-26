<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.thynkzone.jsp.*" %>

	<!DOCTYPE html>
	<html lang = "en">
	<head>
	
	<%
	String sitekey = "6LcQPukUAAAAAN4y7zOxiD3gTVlhhNlRMy7CDXvx";
	%>
	
	<script src="https://www.google.com/recaptcha/api.js?render=<%=sitekey%>"></script>
	
	<link rel="icon" href="icon/favicon.ico" type="image/x-icon">
	<title>P&C</title>
	<meta charset = "UTF-8">
	<meta name="description" content="P&C (People and Culture) is a workplace social network for employees to share experiences, updates, memes, and insights about their jobs and organizational life."/>
<meta name="keywords" content="People and Culture, workplace social network, employee community, company culture, office memes, job updates, coworker engagement, P&C app, organizational culture, share work life, employee stories"/>
	<meta name="author" content="Md. Mazidul Haque Farabi"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="preload" as="image" href="icon/thynkzone-32.png">
	<style>
	
:root {
  --color-white: #ffffff;
  --color-light: #f1f5f9;
  --color-black: #121212;
  --color-blue: #1a73e8;
  --color-gray: #80868b;
  --color-grayish: #dadce0;
  --shadow-normal: 0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px 0 rgba(0, 0, 0, 0.06);
  --shadow-medium: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
  --shadow-large: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
  --accent-primary: #1da1f2;
  --accent-secondary: #0a8cd8;
  --accent-danger: #e0245e;
  --text-primary: #fff;
  --text-secondary: #b0b3b8;
  --border-primary: #2c2f36;
}
html {
  font-size: 100%;
  font-size-adjust: 100%;
  box-sizing: border-box;
  scroll-behavior: smooth;
}
*, *::before, *::after {
  padding: 0;
  margin: 0;
  box-sizing: inherit;
  list-style: none;
  list-style-type: none;
  text-decoration: none;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-rendering: optimizeLegibility;
}
body {
  font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
  font-size: 1rem;
  font-weight: normal;
  line-height: 1.5;
  color: var(--color-black);
  background: var(--color-light);
}
a, button {
  font-family: inherit;
  font-size: inherit;
  line-height: inherit;
  cursor: pointer;
  border: none;
  outline: none;
  background: none;
  text-decoration: none;
}
img {
  display: block;
  width: 100%;
  height: auto;
  object-fit: cover;
}
.container {
  display: flex;
  justify-content: center;
  align-items: center;
  max-width: 80rem;
  min-height: 100vh;
  width: 100%;
  padding: 0 2rem;
  margin: 0 auto;
}
.text {
  font-family: inherit;
  line-height: inherit;
  text-transform: unset;
  text-rendering: optimizeLegibility;
}
.text-large {
  font-size: 2rem;
  font-weight: 600;
  color: var(--color-black);
}
.text-normal {
  font-size: 1rem;
  font-weight: 400;
  color: var(--color-black);
}
.text-links {
  font-size: 1rem;
  font-weight: 400;
  color: var(--color-blue);
}
.text-links:hover {
  text-decoration: underline;
}
.main .wrapper {
  max-width: 28rem;
  width: 100%;
  margin: 2rem auto;
  padding: 2rem 2.5rem;
  border: none;
  outline: none;
  border-radius: 0.25rem;
  color: var(--color-black);
  background: var(--color-white);
  box-shadow: var(--shadow-large);
}
.main .wrapper .form {
  width: 100%;
  height: auto;
  margin-top: 2rem;
}
.main .wrapper .form .input-control {
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-bottom: 1.25rem;
}
.main .wrapper .form .input-field {
  font-family: inherit;
  font-size: 1rem;
  font-weight: 400;
  line-height: inherit;
  width: 100%;
  height: auto;
  padding: 0.75rem 1.25rem;
  border: none;
  outline: none;
  border-radius: 2rem;
  color: var(--color-black);
  background: var(--color-light);
  text-transform: unset;
  text-rendering: optimizeLegibility;
}
.main .wrapper .form .input-submit {
  font-family: inherit;
  font-size: 1rem;
  font-weight: 500;
  line-height: inherit;
  cursor: pointer;
  min-width: 40%;
  height: auto;
  padding: 0.65rem 1.25rem;
  border: none;
  outline: none;
  border-radius: 2rem;
  color: var(--color-white);
  background: var(--color-blue);
  box-shadow: var(--shadow-medium);
  text-transform: capitalize;
  text-rendering: optimizeLegibility;
}
.main .wrapper .striped {
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: center;
  margin: 1rem 0;
}
.main .wrapper .striped-line {
  flex: auto;
  flex-basis: auto;
  border: none;
  outline: none;
  height: 2px;
  background: var(--color-grayish);
}
.main .wrapper .striped-text {
  font-family: inherit;
  font-size: 1rem;
  font-weight: 500;
  line-height: inherit;
  color: var(--color-black);
  margin: 0 1rem;
}
.main .wrapper .method-control {
  margin-bottom: 1rem;
}
.main .wrapper .method-action {
  font-family: inherit;
  font-size: 0.95rem;
  font-weight: 500;
  line-height: inherit;
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100%;
  height: auto;
  padding: 0.35rem 1.25rem;
  outline: none;
  border: 2px solid var(--color-grayish);
  border-radius: 2rem;
  color: var(--color-black);
  background: var(--color-white);
  text-transform: capitalize;
  text-rendering: optimizeLegibility;
  transition: all 0.35s ease;
}
.main .wrapper .method-action:hover {
  background: var(--color-light);
}

.notifmsg2 {
  display: flex;
  align-items: center;
  justify-content: space-between;
  background: var(--accent-primary);
  color: #fff;
  padding: 1rem 1.5rem;
  border-radius: 10px;
  box-shadow: 0 4px 24px 0 rgba(0,0,0,0.18);
  font-size: 1.08rem;
  max-width: 480px;
  margin: 1.5rem auto 0 auto;
  position: relative;
  animation: fadeIn 0.4s;
}
.notifmsg2 .toast-close {
  background: none;
  border: none;
  color: #fff;
  font-size: 1.5rem;
  cursor: pointer;
  margin-left: 1.2rem;
  line-height: 1;
  padding: 0 0.5rem;
  border-radius: 6px;
  transition: background 0.18s;
}
.notifmsg2 .toast-close:hover {
  background: rgba(0,0,0,0.12);
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
	%>
	
	
<main class="main">
	<div class="container">
		<section class="wrapper">
			<div class="heading">
				<h1 class="text text-large">Sign In</h1>
				<p class="text text-normal">New user? <span><a href="signup.jsp" class="text text-links">Create an account</a></span>
				</p>
			</div>
			<form name="signin" class="form" action="loginuser3.jsp" method="POST">
				<div class="input-control">
					<label for="email" class="input-label" hidden>Email Address</label>
					<input type="email" name="email" id="email" class="input-field" placeholder="Email Address" required autofocus>
				</div>
				<div class="input-control">
					<label for="password" class="input-label" hidden>Password</label>
					<input type="password" name="pwd" id="password" class="input-field" placeholder="Password" required>
				</div>
				<div class="input-control">
					<a href="forgotpass.jsp" class="text text-links">Forgot Password</a>
					<input type="submit" name="submit" class="input-submit" value="Sign In">
				</div>
				
				<INPUT TYPE="HIDDEN" NAME="csrf" VALUE="<%=db.csrftoken()%>">
	
				<INPUT TYPE="HIDDEN" id ="g-recaptcha-response" NAME="g-recaptcha-response" />
				
			</form>
			      <%
	try
	{
		String msg=session.getAttribute("msg").toString();
		out.print("<div class='notifmsg2'>"+msg+"</div>");
		session.removeAttribute("msg");
	} catch (Exception ex){}
	%>
	   <br>
      <img src="icon/thynkzone-32.png" style="width: 32px; height: 32px; display: inline;"/> Powered by Thynkzone	
    </section>
  </div>
</main>
	
	
	
	<script>
grecaptcha.ready(function() {
    grecaptcha.execute('<%=sitekey%>', {action: 'login'})
    .then(function(token) {
    	document.getElementById('g-recaptcha-response').value=token;
    });
});
	</script>

	
<%}%>
</body>
</html>