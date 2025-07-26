<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.thynkzone.jsp.*" %>
<%@ page import="java.util.HashSet" %>
<%@page import="java.sql.*" %>
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
	
	<link rel="preload" href = "css-pages.css" as="style">
	<link rel = "stylesheet" type = "text/css" href = "css-pages.css"> <link rel="preconnect" href="https://fonts.googleapis.com"> <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin> <link rel="preload" href="https://fonts.googleapis.com/css2?family=Oswald:wght@400;700&family=Poppins&display=swap" as ="style" crossorigin> <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@400;700&family=Poppins&display=swap" rel="stylesheet" crossorigin> <link rel="preload" as="image" href="icon/p&c.png"> <link rel="preload" as="image" href="icon/home.png"> <link rel="preload" as="image" href="icon/thynkmates-and-fans.png"> <link rel="preload" as="image" href="icon/notifications.png"> <link rel="preload" as="image" href="icon/drop-settings.png"> <link rel="preload" as="image" href="icon/more.png"> <link rel="preload" as="image" href="icon/searchbutton.png">
	
	<style>

.cold {
margin-left: 4%;
}

.cold p {
background-color: rgba(128,128,128,0.5);
border-radius: 8px;
padding: 6px;
}

.cold a {
text-decoration: none;
color: #FF8C00;
font-family: poppins,sans-serif; font-weight: 400; font-style: normal; font-size: 1.2rem;
font-size: 1.2rem;
display: block;
width: 33%;
}

#content {
  padding: 0px;
  margin: 0px;
  display: block;
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
	
	
	
			
			<script>
			window.onscroll = function() {myFunction()};

			var navbar = document.getElementById("myTopnav");
			var navbary = document.getElementById("royal");
			var navbarz = document.getElementById("ss");
			var sticky = navbar.offsetTop;
			var sticky2 = navbary.offsetTop;
			var sticky3 = navbarz.offsetTop;

			function myFunction() {
			  if (window.pageYOffset >= sticky) {
			    navbar.classList.add("sticky")
				navbary.classList.add("sticky2")
				navbarz.classList.add("sticky3")
			    document.getElementById("content").style.paddingTop = "0px";
			    document.getElementById("search").style.paddingTop = "92px";
			  } else {
			    navbar.classList.remove("sticky");
				navbary.classList.remove("sticky2");
				navbarz.classList.remove("sticky3");
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
	
	
	<div id = "search" class = "search">
			<form name="frm" action="search-user.jsp" method="POST">
			<div class="input-container">
			<input class="input-field" type ="text" name="srchtxt" value="" placeholder="Search Profiles" size="50" maxlength="50" required>
			<INPUT TYPE="HIDDEN" NAME="csrf" VALUE="<%=db.csrftoken()%>">
			<button class="btn" type="submit"><img src = "icon/searchbutton.png"/></button>
			</div>
			</form>
			</div>
			
	<div id = "content" class = "content">
	
	<div class = "cold">
	<br>
	
	<%
	
	String token = request.getParameter("csrf");
	if (db.verifycsrftoken(token)) {
	String userid = antisamy.safe(request.getParameter("mutualaxes"));
	
	int mutuals = db.countmutualthy(ix, userid);
	%>
	
	<h1 Style = "font-family: oswald,sans-serif; font-weight: 400; font-style: normal; color: white; cursor: default;"><%=mutuals%> Mutual Thynkmate<%if(mutuals > 1){out.print("s");}%> with <%=db.getfullname(userid)%></h1>
	<br>
	<%

	String yourfullname = null;
	String yourpp = null;
	String fid = null;
	String qrym = null;
	String imdir = null;
	boolean exists = false;
	String myfrnz = null;
	String[] psfetches = null;
				

Connection conn2=null;
Statement st3=null;
Statement st4=null;
ResultSet rscount=null;
ResultSet rscount2=null;

String qrying=null;
String qrybeen=null;

int iscounting = 0;
String fidfuc=null;
int i;

HashSet<String> mylist = new HashSet<String>();
mylist.add(ix);


Class.forName(db.name());
String unamef = db.uname().concat("i");
String passf = db.pass().concat("09");
conn2=(Connection)DriverManager.getConnection(db.urlus(),unamef,passf);
st3=conn2.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
st4=conn2.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);



rscount = st3.executeQuery("select * from `"+ix+"` WHERE yorn=2");

while (rscount.next()) {
myfrnz = rscount.getString(1);
rscount2 = st4.executeQuery("select * from `"+userid+"` WHERE forufid = '"+myfrnz+"' AND yorn=2");
while (rscount2.next()) {
	fid = rscount2.getString(1);

		if (mylist.add(fid)) {

			psfetches = db.nameico(fid);
			yourfullname = psfetches[0];
			imdir = "img/".concat(psfetches[1]);
			iscounting = db.countmutualthy(ix, fid);
	%>
	<a href="profile.jsp?userId=<%=fid%>">
	<p>
<b><img id = "disc" src = "<%=imdir%>"> <%=yourfullname%></b>
<br>
<b><%if(iscounting > 0){out.print(iscounting+" Mutual Thynkmate");}if(iscounting > 1){out.print("s");}%>
</b>
</p>
</a>
<hr Style="width: 33%; float: left;">
<br>
<br>

<%
}
}
	
}
	
	
	
	
	
out.print("Your list of Mutual Thynkmates ends here.");
%>
</div>
<%

	} else {
		//invalid csrf
		response.sendRedirect("index.jsp");
		session.setAttribute("msg", "Attempt unsuccessful");
		return;
	}
			} catch (Exception ex) {
				response.sendRedirect("index.jsp");
				System.out.print(ex+"at mutualthynkmates.jsp");
				}
%>

</div>
	
	
	
	
</body>
</html>