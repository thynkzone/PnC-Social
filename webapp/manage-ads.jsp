<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.thynkzone.jsp.*" %>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
	<html lang = "en">
	<head>
	<link rel="icon" href="icon/favicon.ico" type="image/x-icon">
	<title>P&C - Manage Advertisements</title>
	<meta charset="UTF-8">
	<meta name="description" content="P&C (People and Culture) is a workplace social network for employees to share experiences, updates, memes, and insights about their jobs and organizational life."/>
<meta name="keywords" content="People and Culture, workplace social network, employee community, company culture, office memes, job updates, coworker engagement, P&C app, organizational culture, share work life, employee stories"/>
	<meta name="author" content="Md. Mazidul Haque Farabi"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	
	<link rel="preload" href="css-pages.css" as="style">
	<link rel="stylesheet" type="text/css" href="css-pages.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link rel="preload" href="https://fonts.googleapis.com/css2?family=Oswald:wght@400;700&family=Poppins&display=swap" as="style" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Oswald:wght@400;700&family=Poppins&display=swap" rel="stylesheet" crossorigin>
	<link rel="preload" as="image" href="icon/p&c.png">
	
	<link rel="preload" as="image" href="icon/drop-settings.png">
	<link rel="preload" as="image" href="icon/more.png">
	<link rel="preload" as="image" href="icon/searchbutton.png">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Inter:wght@400;600;700&display=swap">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

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
  --accent-warning: #f39c12;
  --text-primary: #fff;
  --text-secondary: #b0b3b8;
  --text-muted: #888;
  --border-primary: #2c2f36;
  --shadow-md: 0 2px 12px 0 rgba(0,0,0,0.18);
  --shadow-lg: 0 8px 32px 0 rgba(0,0,0,0.25);
  --transition: all 0.2s cubic-bezier(.4,0,.2,1);
}

body {
font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Arial, sans-serif;  background: var(--bg-main);
  color: var(--text-primary);
  margin: 0;
  min-height: 100vh;
  transition: background 0.3s, color 0.3s;
}

.dark-mode {
  --bg-main: #fff;
  --bg-card: rgba(255,255,255,0.85);
  --bg-glass: rgba(255,255,255,0.65);
  --bg-tertiary: #f3f4f6;
  --accent-primary: #1da1f2;
  --accent-secondary: #0a8cd8;
  --accent-danger: #e0245e;
  --text-primary: #18181b;
  --text-secondary: #444;
  --text-muted: #888;
  --border-primary: #e5e7eb;
}

/* Dark mode toggle button */
#darkModeToggle {
  background: var(--bg-tertiary);
  border: 1.5px solid var(--accent-primary);
  color: var(--accent-primary);
  border-radius: 50%;
  width: 44px;
  height: 44px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 1.3rem;
  margin-left: 0.5rem;
  cursor: pointer;
  transition: var(--transition);
}

#darkModeToggle:hover {
  background: var(--accent-primary);
  color: #fff;
}

/* Fix icon visibility in both light and dark modes */
.rights a i, .rights button i {
  color: var(--text-primary) !important;
}

.rights a:hover i, .rights button:hover i {
  color: #fff !important;
}

/* Ensure navigation icons are visible in both themes */
.topnav .rights a, .topnav .rights button {
  color: var(--text-primary);
}

.topnav .rights a:hover, .topnav .rights button:hover {
  color: #fff;
  background: var(--accent-primary) !important;
}

/* More specific rules for FontAwesome icons */
.topnav .rights a i.fa-solid,
.topnav .rights button i.fa-solid {
  color: var(--text-primary) !important;
}

.topnav .rights a:hover i.fa-solid,
.topnav .rights button:hover i.fa-solid {
  color: #fff !important;
}

/* Ensure dark mode toggle icon is always visible */
#darkModeToggle i {
  color: var(--accent-primary) !important;
}

#darkModeToggle:hover i {
  color: #fff !important;
}

/* Active navigation state */
.topnav .rights a.active {
  background: var(--accent-primary) !important;
  border-radius: 50%;
}

.topnav .rights a.active i {
  color: #fff !important;
}

/* Ensure navbar logo positioning is consistent with other pages */
.topnav .thinking {
  width: 44px;
  height: 44px;
  border-radius: var(--radius-btn);
}

/* Main content container */
.content {
  max-width: 1200px;
  width: 100%;
  margin: 0 auto;
  padding: 2rem;
  text-align: center;
}

/* Page headers */
.pghead {
font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Arial, sans-serif;  font-weight: 700;
  font-size: 2.2rem;
  color: var(--accent-primary);
  text-align: center;
  margin: 2rem 0 2rem 0;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 0.8rem;
}

.pghead i {
  font-size: 2rem;
  color: var(--accent-primary);
}

/* Instructions card */
.instructions-card {
  background: var(--bg-card);
  border: 1px solid var(--border-primary);
  border-radius: 16px;
  padding: 2rem;
  margin: 2rem auto;
  box-shadow: var(--shadow-md);
  color: var(--text-secondary);
  font-size: 1rem;
  line-height: 1.6;
  max-width: 900px;
  text-align: left;
}

.instructions-card h3 {
  color: var(--accent-warning);
  font-size: 1.3rem;
  margin-bottom: 1.5rem;
  display: flex;
  align-items: center;
  gap: 0.8rem;
  text-align: center;
  justify-content: center;
}

.instructions-card h3 i {
  font-size: 1.2rem;
}

.instructions-card ul {
  margin: 1.5rem 0;
  padding-left: 2rem;
}

.instructions-card li {
  margin-bottom: 0.8rem;
}

/* Section headers */
h2 {
font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Arial, sans-serif;  font-size: 1.6rem;
  font-weight: 700;
  color: var(--accent-primary);
  text-align: center;
  margin: 3rem 0 2rem 0;
  padding: 1rem;
  background: var(--bg-card);
  border-radius: 12px;
  border: 1px solid var(--border-primary);
  max-width: 800px;
  margin-left: auto;
  margin-right: auto;
}

/* Post cards */
.post {
  background: var(--bg-card);
  border: 1px solid var(--border-primary);
  border-radius: 16px;
  padding: 2rem;
  margin: 1.5rem auto;
  box-shadow: var(--shadow-md);
  max-width: 800px;
  text-align: left;
  transition: var(--transition);
}

.post:hover {
  box-shadow: var(--shadow-lg);
  transform: translateY(-2px);
}

.postupper {
  display: flex;
  align-items: center;
  gap: 1rem;
  margin-bottom: 1.5rem;
  padding-bottom: 1rem;
  border-bottom: 1px solid var(--border-primary);
}

.postupper a {
  display: flex;
  align-items: center;
  gap: 0.8rem;
  text-decoration: none;
  color: var(--accent-primary);
  font-weight: 600;
  font-size: 1.1rem;
}

.postupper img {
  width: 50px;
  height: 50px;
  border-radius: 50%;
  object-fit: cover;
  border: 3px solid var(--accent-primary);
}

.postupper p {
  margin: 0;
  font-size: 0.9rem;
  color: var(--text-secondary);
  line-height: 1.4;
}

.posttextp {
  color: var(--text-primary);
  line-height: 1.6;
  margin: 1.5rem 0;
  font-size: 1rem;
}

.disc2 {
  max-width: 100%;
  max-height: 400px;
  border-radius: 12px;
  box-shadow: var(--shadow-md);
  margin: 1rem 0;
}

/* Action buttons */
.approvereject {
  display: flex;
  gap: 1rem;
  justify-content: center;
  margin-top: 2rem;
  padding-top: 1.5rem;
  border-top: 1px solid var(--border-primary);
}

.app1, .app2 {
  padding: 0.8rem 2rem;
  border: none;
  border-radius: 10px;
  font-weight: 600;
  font-size: 1rem;
  cursor: pointer;
  transition: var(--transition);
  text-decoration: none;
  display: inline-flex;
  align-items: center;
  gap: 0.5rem;
  min-width: 120px;
  justify-content: center;
}

.app1 {
  background: var(--accent-danger);
  color: #fff;
}

.app1:hover {
  background: #be185d;
  transform: translateY(-2px);
  box-shadow: var(--shadow-lg);
}

.app2 {
  background: var(--accent-success);
  color: #fff;
}

.app2:hover {
  background: #059669;
  transform: translateY(-2px);
  box-shadow: var(--shadow-lg);
}

/* Empty state message */
p[Style*="max-width: 700px"] {
  max-width: 600px !important;
  font-family: 'Inter', 'Poppins', Arial, sans-serif !important;
  font-weight: 400 !important;
  font-style: normal !important;
  text-align: center !important;
  color: var(--text-secondary) !important;
  margin: 3rem auto !important;
  padding: 2rem !important;
  background: var(--bg-card) !important;
  border-radius: 16px !important;
  border: 1px solid var(--border-primary) !important;
  font-size: 1.1rem !important;
  line-height: 1.6 !important;
}

/* Responsive design */
@media (max-width: 768px) {
  .content {
    padding: 0.5rem;
  }
  
  .ad-details {
    grid-template-columns: 1fr;
  }
  
  .ad-actions {
    flex-direction: column;
  }
  
  .action-btn {
    justify-content: center;
  }
  
  .pghead {
    font-size: 1.5rem;
  }
  
  .instructions-card,
  .ad-section {
    padding: 1rem;
  }
}

@media (max-width: 600px) {
  .ad-header {
    flex-direction: column;
    align-items: flex-start;
    gap: 0.5rem;
  }
  
  .ad-user-info {
    width: 100%;
  }
}
</style>
</head>

	<%
  		try
			{
  			 
  			if(session.getAttribute("token") != null) {
  				if (session.getAttribute("token").toString().equals("ac9a6d34-20ba-4d7b-9c80-7e7b77a0c63b")) {
			
			%>
			
		<body>
			
	<div id="content" class="content">
	
	<h1 class="pghead"><i class="fa-solid fa-ad"></i> Manage Advertisements</h1>
	
	<div class="instructions-card">
		<h3><i class="fa-solid fa-info-circle"></i> Important Instructions</h3>
		<ul>
			<li><strong>Only 1 World AD runs at a time.</strong> Stopping/Approving New World AD/Country AD will move the already running World AD/Country AD to done and it cannot be reverted using this manager page.</li>
			<li><strong>How World ADs are displayed:</strong> It uses a random number, after the n'th number of posts, which is minimum 3 posts for World ADs, and minimum 5 posts for Country ADs. Wherever the World AD gets displayed, the country AD will be displayed just 2 posts later (ie 4, 6).</li>
			<li><strong>Priority order:</strong> Always approve World 3x → World 2x → World, and Country ADs also in similar order (3x → 2x → 1) so that at the time of the Running AD ends, priority first of 3-2-1.</li>
			<li><strong>Multiple country ADs:</strong> You can approve many country ADs of different countries to Run at the same time but only 1 World AD to run at a time.</li>
			<li><strong>Before approving:</strong> 1. Match Bkash Reference No./Paypal Ad-ticket with AD's Adticket, 2. Check character limit of AD to it's AD category limit, 3. Set reminder to turn off AD after display time is over.</li>
		</ul>
	</div>
		
			<%
	try
	{
		String msg=session.getAttribute("msg").toString();
		out.print("<p class='notifmsg'>"+msg+"</p>");
		session.removeAttribute("msg");
	} catch (Exception ex){}
	%>
		
			<%
			
			Connection conn=null;
			PreparedStatement pstmt = null;
			ResultSet rs=null;

			
			Class.forName(db.name());
			String unamef = db.uname().concat("i");
			String passf = db.pass().concat("09");
			conn=(Connection)DriverManager.getConnection(db.urlth(),unamef,passf);
				
			
			String yourfullname = null;
			String posttext = null;
			String yourpostp = null;
			String posterid = null;
			int privacy;
			String postid;
			String imdir = null;
			boolean exists = false;
			String postistype = null;
			String postisfor = null;
			int posttype;
			int i;
			int approval;
			String approvestatus = null;
			String trxid = null;
			String countryname = null;
			
			String[] psfetches = null;
			String psfullname = null;
			String pspp = null;


			
			
			
			
			
			
			
			
			
			out.print("<h2>Running World Ad</h2>");
			String qry="select * from ads WHERE approval=1 AND privacy > 3";
			pstmt = conn.prepareStatement(qry, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			rs=pstmt.executeQuery();
			
			
			while(rs.next())
			{
				
				postid = rs.getString(4);
				posttype = rs.getInt(7);				
				privacy = rs.getInt(8);
				approval = rs.getInt(12);
				trxid = rs.getString(11);
				countryname = rs.getString(9);
				posterid = rs.getString(2);
				
				psfetches = db.nameico(posterid);
				psfullname = psfetches[0];
				pspp = "img/".concat(psfetches[1]);


						posttext = base64.de(rs.getString(5)).replaceAll("(\r\n|\n)", "<br>");
						yourpostp = rs.getString(6);
						if (yourpostp != null) {
							imdir = "img/".concat(yourpostp);
						}
				   %>
				   <div class = "post" id = "<%=postid%>">
				   <div class = "postupper">
				   <a href="profile.jsp?userId=<%=posterid%>"><img id = "disc" src = "<%=pspp%>">
			       <%=psfullname%></a>
				   <br>
				   <%
				   if (approval == 0) {
					   approvestatus = "In Queue";
				   }
				   else if (approval == 1) {
					   approvestatus = "Running";
				   }
				   else if (approval == -1) {
					   approvestatus = "Rejected";
				   }
				   else if (approval == 3) {
					   approvestatus = "Done";
				   }
				   
				   
				   if (posttype == 1) {
					   postistype = "Person";
				   }
				   else if (posttype == 2) {
					   postistype = "Brand";
				   }
				   
				   
				   
				   if (privacy == 6) {
					   postisfor = "World 3x";
				   }
				   else if (privacy == 5) {
					   postisfor = "World 2x";
				   }
				   else if (privacy == 4) {
					   postisfor = "World";
				   }
				   else if (privacy == 3) {
					   postisfor = "Country 3x";
				   }
				   else if (privacy == 2) {
					   postisfor = "Country 2x";
				   }
				   else if (privacy == 1) {
					   postisfor = "Country";
				   }
				   if (countryname != null) {
				   out.print("<p>"+db.timeconsp("6", rs.getString(10))+"<br>"+postistype+", "+postisfor+"<br>"+approvestatus+"<br>"+trxid+"<br>"+countryname+"</p>");
				   }
				   else {
				   out.print("<p>"+db.timeconsp("6", rs.getString(10))+"<br>"+postistype+", "+postisfor+"<br>"+approvestatus+"<br>"+trxid+"</p>");
				   }%>
				   </div>
				   <br>
				   <p class="posttextp">
				   <%=posttext%>
				   </p>
				   <% if (imdir != null) {%>
		   		   <img class = "disc2" id = "disc2" src="<%=imdir%>" alt="loading image, refresh page"/>
		   		   <%}%>
		   		   
		   		   <div class = "approvereject">
		   		   <a href="javascript:void(0);" onClick="reply_click8('stp<%=postid%>', 'wor<%=posterid%>')"><button class ="app1">Stop</button></a>
		   		   </div>
		   		   
				   </div>
				   <%
								}
			
			
			
			
			
			
			
			
			
			out.print("<h2>Running Country Ads</h2>");
			qry="select * from ads WHERE approval=1 AND privacy < 4";
			pstmt = conn.prepareStatement(qry, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			rs=pstmt.executeQuery();
			
			
			while(rs.next())
			{
				
				postid = rs.getString(4);
				posttype = rs.getInt(7);				
				privacy = rs.getInt(8);
				approval = rs.getInt(12);
				trxid = rs.getString(11);
				countryname = rs.getString(9);
				posterid = rs.getString(2);
				
				psfetches = db.nameico(posterid);
				psfullname = psfetches[0];
				pspp = "img/".concat(psfetches[1]);


						posttext = base64.de(rs.getString(5)).replaceAll("(\r\n|\n)", "<br>");
						yourpostp = rs.getString(6);
						if (yourpostp != null) {
							imdir = "img/".concat(yourpostp);
						}
				   %>
				   <div class = "post" id = "<%=postid%>">
				   <div class = "postupper">
				   <a href="profile.jsp?userId=<%=posterid%>"><img id = "disc" src = "<%=pspp%>">
			       <%=psfullname%></a>
				   <br>
				   <%
				   if (approval == 0) {
					   approvestatus = "In Queue";
				   }
				   else if (approval == 1) {
					   approvestatus = "Running";
				   }
				   else if (approval == -1) {
					   approvestatus = "Rejected";
				   }
				   else if (approval == 3) {
					   approvestatus = "Done";
				   }
				   
				   
				   if (posttype == 1) {
					   postistype = "Person";
				   }
				   else if (posttype == 2) {
					   postistype = "Brand";
				   }
				   
				   
				   
				   if (privacy == 6) {
					   postisfor = "World 3x";
				   }
				   else if (privacy == 5) {
					   postisfor = "World 2x";
				   }
				   else if (privacy == 4) {
					   postisfor = "World";
				   }
				   else if (privacy == 3) {
					   postisfor = "Country 3x";
				   }
				   else if (privacy == 2) {
					   postisfor = "Country 2x";
				   }
				   else if (privacy == 1) {
					   postisfor = "Country";
				   }
				   if (countryname != null) {
				   out.print("<p>"+db.timeconsp("6", rs.getString(10))+"<br>"+postistype+", "+postisfor+"<br>"+approvestatus+"<br>"+trxid+"<br><b><u>"+countryname+"</u></b></p>");
				   }
				   else {
				   out.print("<p>"+db.timeconsp("6", rs.getString(10))+"<br>"+postistype+", "+postisfor+"<br>"+approvestatus+"<br>"+trxid+"</p>");
				   }%>
				   </div>
				   <br>
				   <p class="posttextp">
				   <%=posttext%>
				   </p>
				   <% if (imdir != null) {%>
		   		   <img class = "disc2" id = "disc2" src="<%=imdir%>" alt="loading image, refresh page"/>
		   		   <%}%>
		   		   
		   		   <div class = "approvereject">
		   		   <a href="javascript:void(0);" onClick="reply_click8('stp<%=postid%>', 'cou<%=posterid%>')"><button class ="app1">Stop</button></a>
		   		   </div>
		   		   
				   </div>
				   <%
								}
			
			
			
					
			
			
			
			
			out.print("<h2>Received World Ads</h2>");
			qry="select * from ads WHERE approval=0 AND privacy > 3";
			pstmt = conn.prepareStatement(qry, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			rs=pstmt.executeQuery();
			
			
			while(rs.next())
			{
				
				postid = rs.getString(4);
				posttype = rs.getInt(7);				
				privacy = rs.getInt(8);
				approval = rs.getInt(12);
				trxid = rs.getString(11);
				countryname = rs.getString(9);
				posterid = rs.getString(2);
				
				psfetches = db.nameico(posterid);
				psfullname = psfetches[0];
				pspp = "img/".concat(psfetches[1]);


						posttext = base64.de(rs.getString(5)).replaceAll("(\r\n|\n)", "<br>");
						yourpostp = rs.getString(6);
						if (yourpostp != null) {
							imdir = "img/".concat(yourpostp);
						}
				   %>
				   <div class = "post" id = "<%=postid%>">
				   <div class = "postupper">
				   <a href="profile.jsp?userId=<%=posterid%>"><img id = "disc" src = "<%=pspp%>">
			       <%=psfullname%></a>
				   <br>
				   <%
				   if (approval == 0) {
					   approvestatus = "In Queue";
				   }
				   else if (approval == 1) {
					   approvestatus = "Running";
				   }
				   else if (approval == -1) {
					   approvestatus = "Rejected";
				   }
				   else if (approval == 3) {
					   approvestatus = "Done";
				   }
				   
				   
				   if (posttype == 1) {
					   postistype = "Person";
				   }
				   else if (posttype == 2) {
					   postistype = "Brand";
				   }
				   
				   
				   
				   if (privacy == 6) {
					   postisfor = "World 3x";
				   }
				   else if (privacy == 5) {
					   postisfor = "World 2x";
				   }
				   else if (privacy == 4) {
					   postisfor = "World";
				   }
				   else if (privacy == 3) {
					   postisfor = "Country 3x";
				   }
				   else if (privacy == 2) {
					   postisfor = "Country 2x";
				   }
				   else if (privacy == 1) {
					   postisfor = "Country";
				   }
				   if (countryname != null) {
				   out.print("<p>"+db.timeconsp("6", rs.getString(10))+"<br>"+postistype+", "+postisfor+"<br>"+approvestatus+"<br>"+trxid+"<br>"+countryname+"</p>");
				   }
				   else {
				   out.print("<p>"+db.timeconsp("6", rs.getString(10))+"<br>"+postistype+", "+postisfor+"<br>"+approvestatus+"<br>"+trxid+"</p>");
				   }%>
				   </div>
				   <br>
				   <p class="posttextp">
				   <%=posttext%>
				   </p>
				   <% if (imdir != null) {%>
		   		   <img class = "disc2" id = "disc2" src="<%=imdir%>" alt="loading image, refresh page"/>
		   		   <%}%>
		   		   
		   		   <div class = "approvereject">
		   		   <a class = "rejectlink" href="javascript:void(0);" onClick="reply_click8('rej<%=postid%>', 'wor<%=posterid%>')"><button class ="app1">Reject</button></a>
		   		   <a href="javascript:void(0);" onClick="reply_click8('app<%=postid%>', 'wor<%=posterid%>')"><button class ="app2">Approve</button></a>
		   		   </div>
		   		   
				   </div>
				   <%
								}
			
			
			
			
			
			
					
			out.print("<h2>Received Country Ads</h2>");
			qry="select * from ads WHERE approval=0 AND privacy < 4";
			pstmt = conn.prepareStatement(qry, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			rs=pstmt.executeQuery();
			
			
			while(rs.next())
			{
				
				postid = rs.getString(4);
				posttype = rs.getInt(7);				
				privacy = rs.getInt(8);
				approval = rs.getInt(12);
				trxid = rs.getString(11);
				countryname = rs.getString(9);
				posterid = rs.getString(2);
				
				psfetches = db.nameico(posterid);
				psfullname = psfetches[0];
				pspp = "img/".concat(psfetches[1]);


						posttext = base64.de(rs.getString(5)).replaceAll("(\r\n|\n)", "<br>");
						yourpostp = rs.getString(6);
						if (yourpostp != null) {
							imdir = "img/".concat(yourpostp);
						}
					%>
				   <div class = "post" id = "<%=postid%>">
				   <div class = "postupper">
				   <a href="profile.jsp?userId=<%=posterid%>"><img id = "disc" src = "<%=pspp%>">
			       <%=psfullname%></a>
				   <br>
				   <%
				   if (approval == 0) {
					   approvestatus = "In Queue";
				   }
				   else if (approval == 1) {
					   approvestatus = "Running";
				   }
				   else if (approval == -1) {
					   approvestatus = "Rejected";
				   }
				   else if (approval == 3) {
					   approvestatus = "Done";
				   }
				   
				   
				   if (posttype == 1) {
					   postistype = "Person";
				   }
				   else if (posttype == 2) {
					   postistype = "Brand";
				   }
				   
				   
				   
				   if (privacy == 6) {
					   postisfor = "World 3x";
				   }
				   else if (privacy == 5) {
					   postisfor = "World 2x";
				   }
				   else if (privacy == 4) {
					   postisfor = "World";
				   }
				   else if (privacy == 3) {
					   postisfor = "Country 3x";
				   }
				   else if (privacy == 2) {
					   postisfor = "Country 2x";
				   }
				   else if (privacy == 1) {
					   postisfor = "Country";
				   }
				   if (countryname != null) {
				   out.print("<p>"+db.timeconsp("6", rs.getString(10))+"<br>"+postistype+", "+postisfor+"<br>"+approvestatus+"<br>"+trxid+"<br><b><u>"+countryname+"</u></b></p>");
				   }
				   else {
				   out.print("<p>"+db.timeconsp("6", rs.getString(10))+"<br>"+postistype+", "+postisfor+"<br>"+approvestatus+"<br>"+trxid+"</p>");
				   }%>
				   </div>
				   <br>
				   <p class="posttextp">
				   <%=posttext%>
				   </p>
				   <% if (imdir != null) {%>
		   		   <img class = "disc2" id = "disc2" src="<%=imdir%>" alt="loading image, refresh page"/>
		   		   <%}%>
		   		   
		   		   <div class = "approvereject">
		   		   <a class = "rejectlink" href="javascript:void(0);" onClick="reply_click8('rej<%=postid%>', 'cou<%=posterid%>')"><button class ="app1">Reject</button></a>
		   		   <a href="javascript:void(0);" onClick="reply_click8('app<%=postid%>', 'cou<%=posterid%>')"><button class ="app2">Approve</button></a>
		   		   </div>
		   		   
				   </div>
				   <%
								}
			
			
			
			
			
			
			
			
			
			out.print("<h2>Rejected Ads</h2>");
			qry="select * from ads WHERE approval=-1";
			pstmt = conn.prepareStatement(qry, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			rs=pstmt.executeQuery();
			
			
			while(rs.next())
			{
				
				postid = rs.getString(4);
				posttype = rs.getInt(7);				
				privacy = rs.getInt(8);
				approval = rs.getInt(12);
				trxid = rs.getString(11);
				countryname = rs.getString(9);
				posterid = rs.getString(2);
				
				psfetches = db.nameico(posterid);
				psfullname = psfetches[0];
				pspp = "img/".concat(psfetches[1]);


						posttext = base64.de(rs.getString(5)).replaceAll("(\r\n|\n)", "<br>");
						yourpostp = rs.getString(6);
						if (yourpostp != null) {
							imdir = "img/".concat(yourpostp);
						}
				   %>
				   <div class = "post" id = "<%=postid%>">
				   <div class = "postupper">
				   <a href="profile.jsp?userId=<%=posterid%>"><img id = "disc" src = "<%=pspp%>">
			       <%=psfullname%></a>
				   <br>
				   <%
				   if (approval == 0) {
					   approvestatus = "In Queue";
				   }
				   else if (approval == 1) {
					   approvestatus = "Running";
				   }
				   else if (approval == -1) {
					   approvestatus = "Rejected";
				   }
				   else if (approval == 3) {
					   approvestatus = "Done";
				   }
				   
				   
				   if (posttype == 1) {
					   postistype = "Person";
				   }
				   else if (posttype == 2) {
					   postistype = "Brand";
				   }
				   
				   
				   
				   if (privacy == 6) {
					   postisfor = "World 3x";
				   }
				   else if (privacy == 5) {
					   postisfor = "World 2x";
				   }
				   else if (privacy == 4) {
					   postisfor = "World";
				   }
				   else if (privacy == 3) {
					   postisfor = "Country 3x";
				   }
				   else if (privacy == 2) {
					   postisfor = "Country 2x";
				   }
				   else if (privacy == 1) {
					   postisfor = "Country";
				   }
				   if (countryname != null) {
				   out.print("<p>"+db.timeconsp("6", rs.getString(10))+"<br>"+postistype+", "+postisfor+"<br>"+approvestatus+"<br>"+trxid+"<br>"+countryname+"</p>");
				   }
				   else {
				   out.print("<p>"+db.timeconsp("6", rs.getString(10))+"<br>"+postistype+", "+postisfor+"<br>"+approvestatus+"<br>"+trxid+"</p>");
				   }%>
				   </div>
				   <br>
				   <p class="posttextp">
				   <%=posttext%>
				   </p>
				   <% if (imdir != null) {%>
		   		   <img class = "disc2" id = "disc2" src="<%=imdir%>" alt="loading image, refresh page"/>
		   		   <%}%>
				   </div>
				   <%
								}
			
			
			
			
			
			out.print("<h2>Done Ads</h2>");
			qry="select * from ads WHERE approval=3";
			pstmt = conn.prepareStatement(qry, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			rs=pstmt.executeQuery();
			
			
			while(rs.next())
			{
				
				postid = rs.getString(4);
				posttype = rs.getInt(7);				
				privacy = rs.getInt(8);
				approval = rs.getInt(12);
				trxid = rs.getString(11);
				countryname = rs.getString(9);
				posterid = rs.getString(2);
				
				psfetches = db.nameico(posterid);
				psfullname = psfetches[0];
				pspp = "img/".concat(psfetches[1]);


						posttext = base64.de(rs.getString(5)).replaceAll("(\r\n|\n)", "<br>");
						yourpostp = rs.getString(6);
						if (yourpostp != null) {
							imdir = "img/".concat(yourpostp);
						}
				   %>
				   <div class = "post" id = "<%=postid%>">
				   <div class = "postupper">
				   <a href="profile.jsp?userId=<%=posterid%>"><img id = "disc" src = "<%=pspp%>">
			       <%=psfullname%></a>
				   <br>
				   <%
				   if (approval == 0) {
					   approvestatus = "In Queue";
				   }
				   else if (approval == 1) {
					   approvestatus = "Running";
				   }
				   else if (approval == -1) {
					   approvestatus = "Rejected";
				   }
				   else if (approval == 3) {
					   approvestatus = "Done";
				   }
				   
				   
				   if (posttype == 1) {
					   postistype = "Person";
				   }
				   else if (posttype == 2) {
					   postistype = "Brand";
				   }
				   
				   
				   
				   if (privacy == 6) {
					   postisfor = "World 3x";
				   }
				   else if (privacy == 5) {
					   postisfor = "World 2x";
				   }
				   else if (privacy == 4) {
					   postisfor = "World";
				   }
				   else if (privacy == 3) {
					   postisfor = "Country 3x";
				   }
				   else if (privacy == 2) {
					   postisfor = "Country 2x";
				   }
				   else if (privacy == 1) {
					   postisfor = "Country";
				   }
				   if (countryname != null) {
				   out.print("<p>"+db.timeconsp("6", rs.getString(10))+"<br>"+postistype+", "+postisfor+"<br>"+approvestatus+"<br>"+trxid+"<br>"+countryname+"</p>");
				   }
				   else {
				   out.print("<p>"+db.timeconsp("6", rs.getString(10))+"<br>"+postistype+", "+postisfor+"<br>"+approvestatus+"<br>"+trxid+"</p>");
				   }%>
				   </div>
				   <br>
				   <p class="posttextp">
				   <%=posttext%>
				   </p>
				   <% if (imdir != null) {%>
		   		   <img class = "disc2" id = "disc2" src="<%=imdir%>" alt="loading image, refresh page"/>
		   		   <%}%>
				   </div>
				   <%
								}
			
			
			
			
			
			
			}
		}
		else {
		response.sendRedirect("index.jsp");
		return;
		}
	
	
	


			} catch(Exception ex) {
				System.out.print(ex+"at manage-ads.jsp");
		}
	%>
	
	
	
	<FORM NAME="form8" ACTION = "adapprove.jsp" METHOD="POST">
			<INPUT TYPE="HIDDEN" NAME="tixes">
			<INPUT TYPE="HIDDEN" NAME="tixes2">
			<INPUT TYPE="HIDDEN" NAME="csrf" VALUE="<%=db.csrftoken()%>">
	</FORM>
	
			
			
			<script type="text/javascript">
	  		function reply_click8(apprejpostid, postid)
	  		{
		  document.form8.tixes.value = apprejpostid;
		  document.form8.tixes2.value = postid;
	      form8.submit();
	  		}
			</script>
			
	<p Style="max-width: 700px; font-family: oswald,sans-serif; font-weight: 400; font-style: normal; text-align: center; color: white;">
	You don't have any more advertisements to see.
	</p>
	<br><br><br>
	</div>
	
	<script>
		// Dark mode toggle functionality
		const darkModeToggle = document.getElementById('darkModeToggle');
		const darkModeIcon = document.getElementById('darkModeIcon');
		const body = document.body;
		
		// Check for saved dark mode preference
		const darkMode = localStorage.getItem('darkMode');
		if (darkMode === 'enabled') {
			body.classList.add('dark-mode');
			darkModeIcon.className = 'fa-solid fa-sun';
		}
		
		darkModeToggle.addEventListener('click', () => {
			body.classList.toggle('dark-mode');
			
			if (body.classList.contains('dark-mode')) {
				localStorage.setItem('darkMode', 'enabled');
				darkModeIcon.className = 'fa-solid fa-sun';
			} else {
				localStorage.setItem('darkMode', null);
				darkModeIcon.className = 'fa-solid fa-moon';
			}
		});
		
		// Smooth scrolling for better UX
		document.addEventListener('DOMContentLoaded', function() {
			const links = document.querySelectorAll('a[href^="#"]');
			links.forEach(link => {
				link.addEventListener('click', function(e) {
					e.preventDefault();
					const target = document.querySelector(this.getAttribute('href'));
					if (target) {
						target.scrollIntoView({
							behavior: 'smooth',
							block: 'start'
						});
					}
				});
			});
		});
	</script>
	
</body>
</html>