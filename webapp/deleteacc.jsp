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
	
	<link rel = "stylesheet" type = "text/css" href = "css-pages.css"> <link rel="preconnect" href="https://fonts.googleapis.com"> <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin> <link rel="preload" href="https://fonts.googleapis.com/css2?family=Oswald:wght@400;700&family=Poppins&display=swap" as ="style" crossorigin> <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@400;700&family=Poppins&display=swap" rel="stylesheet" crossorigin> <link rel="preload" as="image" href="icon/p&c.png"> <link rel="preload" as="image" href="icon/home.png"> <link rel="preload" as="image" href="icon/thynkmates-and-fans.png"> <link rel="preload" as="image" href="icon/notifications.png"> <link rel="preload" as="image" href="icon/drop-settings.png"> <link rel="preload" as="image" href="icon/more.png"> <link rel="preload" as="image" href="icon/searchbutton.png">
	
	<style>



/* Style the input container */
.input-container {
  display: flex;
  width: 100%;
  margin-bottom: 15px;
}

/* Style the form icons */
.icon {
  padding: 10px;
  background: #383838;
  color: #FF4500;
  min-width: 50px;
  text-align: center;
}

/* Style the input fields */
.input-field {
  width: 100%;
  padding: 10px;
  outline: none;
}

.input-field:focus {
  border: 2px solid dodgerblue;
}

/* Set a style for the submit button */
.button {
  background-color: #2d2d2d;
  color: white;
  padding: 15px 20px;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
  font-family: oswald,sans-serif; font-weight: 400; font-style: normal;
  font-size: 15px;
  font-weight: 700;
}

.button:hover {
  opacity: 1;
  color: #FF4500;
}
	</style>
	
	</head>

	<%
  		try
			{
  			 
  			String ix = db.userid(request);
  		 	String tester = ix.concat("a");

  		 	String[] fetches = db.nameico(ix);
			String pname = fetches[0];
			String psmall = "img/".concat(fetches[1]);
			
			%>
			
			
			
			
			<div class="topnav" id="myTopnav">
			  <a href="index.jsp"><img class = "thinking" src = "icon/p&c.png"></a>
			  <a href="index.jsp" class = "name">Thynkzone</a>
			  <div id = "royal" class = "rights">
			  <a href="index.jsp" title="Home"><img src = "icon/home.png"></a>
			  <a href="following.jsp" title="Thynkmates &amp; Fans"><img src = "icon/thynkmates-and-fans.png"></a>
			  <a href="post-updates.jsp" title="Notifications"><img src = "icon/notifications.png"></a>
			  <div class="dropdown">
			  <a href="javascript:void(0)" onclick="myFunctionss()"><img class="dropbtn" id = "prodisc" src="<%=psmall%>" src = "icon/settings3.png"/><img class="dropbtn" id="gdot"src = "icon/drop-settings.png"/></a>
			  <div class="dropdown-content" id="myDropdown">
			    <a href="profile.jsp?userId=<%=ix%>">Profile</a>
			    <a href="settings.jsp">Settings</a>
			    <a href="logout.jsp">Logout</a>
			  </div>
			  </div>
			  <a href="javascript:void(0);" class="icon" onclick="myFunctions()" id="ss" title="Menu"><img src="icon/more.png"/></a>
			  </div>
			</div>


			
			<div id = "search" class = "search">
			<form name="frm" action="search-user.jsp" method="POST">
			<div class="input-container">
			<input class="input-field" type ="text" name="srchtxt" value="" placeholder="Search Profiles" size="50" maxlength="50" required>
			<INPUT TYPE="HIDDEN" NAME="csrf" VALUE="<%=db.csrftoken()%>">
			<button class="btn" type="submit"><img src = "icon/searchbutton.png"/></button>
			</div>
			</form>
			</div>

	
	
	
	
	
			
			<script>
			window.onscroll = function() {myFunction()};

			var navbar = document.getElementById("myTopnav");
			var navbary = document.getElementById("royal");
			var navbarz = document.getElementById("ss");
			var searchz = document.getElementById("search");
			var sticky = navbar.offsetTop;
			var sticky2 = navbary.offsetTop;
			var sticky3 = navbarz.offsetTop;

			function myFunction() {
			  if (window.pageYOffset >= sticky) {
			    navbar.classList.add("sticky")
				navbary.classList.add("sticky2")
				navbarz.classList.add("sticky3")
				searchz.style.display = "none";
			    searchz.style.width = "0px";
			  } else {
			    navbar.classList.remove("sticky");
				navbary.classList.remove("sticky2");
				navbarz.classList.remove("sticky3");
				searchz.style.display = "block";
			  }
			}
			</script>

			<script>
			function myFunctions() {
			  var x = document.getElementById("royal");
			  if (x.className === "rights") {
			    x.className += " responsive";
			  } else {
			    x.className = "rights";
			  }
			}
			</script>





			<script>
			/* When the user clicks on the button, 
			toggle between hiding and showing the dropdown content */
			function myFunctionss() {
			  document.getElementById("myDropdown").classList.toggle("show");
			}

			// Close the dropdown if the user clicks outside of it
			window.onclick = function(e) {
			  if (!e.target.matches('.dropbtn')) {
			  var myDropdown = document.getElementById("myDropdown");
			    if (myDropdown.classList.contains('show')) {
			      myDropdown.classList.remove('show');
			    }
			  }
			}
			</script>
			
			
			
			
			
	<body>		
			
	<div class = "content">


			
			
			
			<form name="frm" action="delconf.jsp" method="POST" style="max-width:450px; margin-top: 200px; margin-left:auto; margin-right:auto">
	<h2>Confirm to delete your account</h2>
	<br>
	
	<div class="input-container">
	<input class="input-field" type ="password" name="pwd" value="" placeholder="Enter your password" size="25" maxlength="50" required>
	</div>
	
	<INPUT TYPE="HIDDEN" NAME="csrf" VALUE="<%=db.csrftoken()%>">
	
	<button class="button">Delete Account</button>
	
		</form>
		
	<script type="text/javascript">
	setTimeout(function(){ window.location = "index.jsp"; },300000);
	</script>
		
			<%
			
			} catch(Exception ex) {
				response.sendRedirect("index.jsp");
				System.out.print(ex+"at deleteacc.jsp");
		}
	%>
	
	</div>
	</body>
	</html>
				
				
				
				