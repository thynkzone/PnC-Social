<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.thynkzone.jsp.*" %>

<!DOCTYPE html>
	<html lang = "en">
	<head>
	
	<%
	String sitekey = "6LeFR-kUAAAAAAi4MTCB_cnMy-qjJJUB2TM7hj6V";
	%>
	
	<script src="https://www.google.com/recaptcha/api.js" async defer></script>
	
	<link rel="icon" href="icon/favicon.ico" type="image/x-icon">
	<title>P&C</title>
	<meta charset = "UTF-8">
	<meta name="description" content="P&C (People and Culture) is a workplace social network for employees to share experiences, updates, memes, and insights about their jobs and organizational life."/>
<meta name="keywords" content="People and Culture, workplace social network, employee community, company culture, office memes, job updates, coworker engagement, P&C app, organizational culture, share work life, employee stories"/>
	<meta name="author" content="Md. Mazidul Haque Farabi"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link rel="preload" as="image" href="icon/thynkzone-32.png">	
<style>
:root {
  --accent-primary: #1da1f2;
  --accent-secondary: #0a8cd8;
  --accent-danger: #e0245e;
  --text-primary: #fff;
  --text-secondary: #b0b3b8;
  --border-primary: #2c2f36;
}

*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
  line-height: 1.5;
  text-decoration: none;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
html {
  box-sizing: border-box;
  scroll-behavior: smooth;
}
body{
  min-height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  background: #f1f5f9;
}
.wrapper{
  position: relative;
  max-width: 430px;
  width: 100%;
  background: #fff;
  padding: 34px;
  border-radius: 6px;
  box-shadow: 0 5px 10px rgba(0,0,0,0.2);
}
.wrapper h1 {
  color: #121212;
  font-size: 2rem;
  font-weight: 600;
}
.wrapper form{
  margin-top: 30px;
}
.wrapper form .input-box{
  height: 52px;
  margin: 18px 0;
}
form .input-box input{
  height: 100%;
  width: 100%;
  outline: none;
  padding: 0 15px;
  font-size: 17px;
  font-weight: 400;
  color: #333;
  border: 1.5px solid #C7BEBE;
  border-bottom-width: 2.5px;
  border-radius: 6px;
  transition: all 0.3s ease;
}
.input-box input:focus,
.input-box input:valid{
  border-color: #4070f4;
}
form .policy{
  display: flex;
  align-items: center;
}
form h3{
  color: #707070;
  font-size: 14px;
  font-weight: 500;
  margin-left: 10px;
}
.input-box.button input{
  color: #fff;
  letter-spacing: 1px;
  border: none;
  background: #06a4ff;
  cursor: pointer;
}
.input-box.button input:hover{
  background: #3aa2df;
}
form .text h3{
 color: #333;
 width: 100%;
 text-align: center;
}
form .text h3 a{
  color: #0448c7;
  text-decoration: none;
}
form .text h3 a:hover{
  text-decoration: underline;
}

#terms {
  color: #0448c7;
  text-decoration: none;
}

#terms:hover {
  text-decoration: underline;
}

#message {
  display:none;
  color: #000;
  position: relative;
  margin-top: 10px;
  width: 100%;
  font-size: 18px;
  max-width:450px;
  margin-left:auto;
  margin-right:auto;
  margin-top: 20px;
}

#message h3 {
  padding: 4px 35px;
}

/* Add a green text color and a checkmark when the requirements are right */
.valid {
  color: green;
}

.valid:before {
  position: relative;
  left: -25px;
  content: "✔";
}

/* Add a text color and an "x" icon when the requirements are wrong */
.invalid {
  color: red;
}

.invalid:before {
  position: relative;
  left: -25px;
  content: "✖";
}

.notifmsg {
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

#toggler {
            position: relative;
            bottom: 38px;
            left: 330px;
            transform: translateY(-50%);
            cursor: pointer;
}
#psw::-ms-reveal {
  display: none;
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




	
	<div class="wrapper">
    <h1>Create an account</h1>
    <form name ="signupform" action="verify-code.jsp" method="POST">
      <div class="input-box">
        <input type ="email" name="email" value="" placeholder="Email address" size="25" maxlength="50" required>
      </div>
      <div class="input-box">
        <input id = "psw" type ="password" name="pwd" value="" placeholder="Create password" size="25" minlength="8" maxlength="50" onkeyup="passwordmustcontain()" onblur="passwordmustcontain()" required>
        <span><i id="toggler"class="far fa-eye fa-lg"></i></span>
      </div>

      
      <div id="message">
  <h3 style="color: black; padding: 0px;">*Password must contain the following:</h3>
  <h3 id="letter" class="invalid">A letter</h3>
  <h3 id="number" class="invalid">A number</h3>
  <h3 id="symbol" class="invalid">A special character</h3>
  <h3 id="length" class="invalid">Minimum 8 characters</h3>
	</div>
      
      
      <div class="input-box">
        <input id = "psw2" type ="password" name="pwd2" value="" placeholder="Confirm password" size="25" minlength="8" maxlength="50" onkeyup="validate()" onblur="validate()" required>
      </div>
      <h3 id = "pswvalidate" style="color: black;"></h3>
      <div class="input-box">
        <input type ="text" name="phone" value="" placeholder="Create account recovery code" size="25" minlength="3" onkeyup="remind()" required>
      </div>
      		<h3 id = "remindwhy" style="color: black;"></h3>                                                              
     
     
     <noscript>
	 <input type="hidden" name="js" value="x"> 
	 </noscript>
   <INPUT TYPE="HIDDEN" NAME="csrf" VALUE="<%=db.csrftoken()%>">
	 <div class="g-recaptcha" data-sitekey="<%=sitekey%>"></div>
	 <br>
	 
        
        <div class="policy">           
        <input type="hidden" name="checkboxhidden" id="checkboxhidden" value="2">                         
        <input type="checkbox" name="checkbox" id="checkbox">
        <h3>I have read &amp; agree to the <a id = "terms" href="terms-and-conditions.jsp">privacy policy.</a></h3>
      </div>
      <div class="input-box button">
        <input type="Submit" onclick="checkfunc()" value="Sign Up">
      </div>
      <div class="text">
        <h3>Already have an account? <a href="login.jsp">Login now</a></h3>
      </div>
    </form>
    <%
	try
	{
		String msg=session.getAttribute("msg").toString();
		out.print("<p class = 'notifmsg'>"+msg+"</p>");
		session.removeAttribute("msg");
	} catch (Exception ex){}
	%>
  <br>
  <img src="icon/thynkzone-32.png" style="width: 32px; height: 32px; display: inline;"/> Powered by Thynkzone
  </div>

	
	<script type="text/javascript">
	function checkfunc() {
	var checkbox = document.getElementById("checkbox");
	var checkboxhidden = document.getElementById("checkboxhidden");
 if(checkbox.checked) {
	 checkboxhidden.value="1";
 }
	}
 	</script>
 	
	

	<script type="text/javascript">
var myInput = document.getElementById("psw");
var letter = document.getElementById("letter");
var symbol = document.getElementById("symbol");
var number = document.getElementById("number");
var length = document.getElementById("length");

// When the user clicks on the password field, show the message box
myInput.onfocus = function() {
  document.getElementById("message").style.display = "block";
}

// When the user starts to type something inside the password field
function passwordmustcontain() {
  // Validate lowercase letters
  var lowerCaseLetters = /[a-z]/g;
  var upperCaseLetters = /[A-Z]/g;
  if(myInput.value.match(lowerCaseLetters) || myInput.value.match(upperCaseLetters)) {
    letter.classList.remove("invalid");
    letter.classList.add("valid");
  } else {
    letter.classList.remove("valid");
    letter.classList.add("invalid");
}
  
//Validate symbols
  var symbols = /[@$!%*#?&+=_,.-/(){}]/g;
  if(myInput.value.match(symbols)) {
	  symbol.classList.remove("invalid");
	  symbol.classList.add("valid");
  } else {
	  symbol.classList.remove("valid");
	  symbol.classList.add("invalid");
  }

  // Validate numbers
  var numbers = /[0-9]/g;
  if(myInput.value.match(numbers)) {
    number.classList.remove("invalid");
    number.classList.add("valid");
  } else {
    number.classList.remove("valid");
    number.classList.add("invalid");
  }

  // Validate length
  if(myInput.value.length >= 8) {
    length.classList.remove("invalid");
    length.classList.add("valid");
  } else {
    length.classList.remove("valid");
    length.classList.add("invalid");
  }
}
</script>

<script type="text/javascript">
var password = document.getElementById('psw');
      var toggler = document.getElementById('toggler');

      showHidePassword = () => {
        if (password.type == 'password') {
          password.setAttribute('type', 'text');
          toggler.classList.add('fa-eye-slash');
        } else {
          toggler.classList.remove('fa-eye-slash');
          password.setAttribute('type', 'password');
        }
      };

      toggler.addEventListener('click', showHidePassword);
</script>	

<script type="text/javascript">
function validate() {
var x= document.getElementById("psw");
var y= document.getElementById("psw2");

	if(x.value==y.value)  {
		document.getElementById("pswvalidate").innerHTML = "Passwords matched.";
		document.getElementById("pswvalidate").style.color = "green";
	}
	else {
		document.getElementById("pswvalidate").innerHTML = "Passwords don't match.";
		document.getElementById("pswvalidate").style.color = "red";
	}
}
</script>

<script type="text/javascript">
function remind() {
document.getElementById("remindwhy").innerHTML = "You will need this if you forget your password.";
document.getElementById("remindwhy").style.marginBottom = "30px";
}
</script>

<%}%>
</body>
</html>