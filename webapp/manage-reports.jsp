<%@ page import="com.thynkzone.jsp.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@ page import="java.util.HashSet" %>

<!DOCTYPE html>
	<html lang = "en">
	<head>
	<link rel="icon" href="icon/favicon.ico" type="image/x-icon">
	<title>P&C - Manage Reports</title>
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

/* Modern Posts Styling */
.post-card {
  background: var(--bg-card);
  border-radius: var(--radius-card);
  border: 1px solid var(--border-primary);
  margin-bottom: 1.5rem;
  padding: 1.5rem;
  box-shadow: var(--shadow-md);
  backdrop-filter: blur(10px);
  transition: var(--transition);
  max-width: 800px;
  margin-left: auto;
  margin-right: auto;
}

.post-card:hover {
  transform: translateY(-2px);
  box-shadow: var(--shadow-lg);
}

.post-header {
  display: flex;
  align-items: flex-start;
  gap: 0.75rem;
  margin-bottom: 1rem;
  position: relative;
}

.post-profile-img {
  width: 44px;
  height: 44px;
  border-radius: 50%;
  object-fit: cover;
  border: 2px solid var(--border-primary);
  transition: var(--transition);
}

.post-profile-img:hover {
  border-color: var(--accent-primary);
}

.post-profile-name {
  font-weight: 600;
  font-size: 1rem;
  color: var(--text-primary);
  text-decoration: none;
  transition: var(--transition);
}

.post-profile-name:hover {
  color: var(--accent-primary);
  text-decoration: none;
}

.post-meta-info {
  margin-top: 0.25rem;
}

.post-time {
  font-size: 0.85rem;
  color: var(--text-muted);
  margin-bottom: 0.25rem;
}

.post-cat-priv {
  font-size: 0.8rem;
  color: var(--text-secondary);
}

.post-content {
  font-size: 1rem;
  line-height: 1.6;
  color: var(--text-primary);
  margin-bottom: 1rem;
  word-wrap: break-word;
}

.post-image {
  width: 100%;
  max-height: 400px;
  object-fit: cover;
  border-radius: 12px;
  margin-bottom: 1rem;
  border: 1px solid var(--border-primary);
}

.post-actions {
  border-top: 1px solid var(--border-primary);
  padding-top: 1rem;
}

.post-counts {
  display: flex;
  gap: 1.5rem;
  margin-bottom: 0.75rem;
  font-size: 0.9rem;
}

.reactors-toggle,
.comments-toggle {
  color: var(--text-muted);
  cursor: pointer;
  transition: var(--transition);
  display: flex;
  align-items: center;
  gap: 0.5rem;
}

.reactors-toggle:hover,
.comments-toggle:hover {
  color: var(--accent-primary);
}

.post-action-group {
  display: flex;
  gap: 0.75rem;
}

.post-action-btn {
  background: var(--bg-tertiary);
  color: var(--text-secondary);
  border: 1px solid var(--border-primary);
  padding: 0.6rem 1rem;
  border-radius: 20px;
  font-size: 0.85rem;
  font-weight: 500;
  cursor: pointer;
  transition: var(--transition);
  display: flex;
  align-items: center;
  gap: 0.5rem;
}

.post-action-btn:hover {
  border-color: var(--accent-primary);
  transform: translateY(-1px);
}

.post-action-btn i {
  font-size: 0.9rem;
}

/* Action buttons for reports */
.approvereject {
  display: flex;
  gap: 1rem;
  justify-content: center;
  margin-top: 1rem;
  padding-top: 1rem;
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

/* Like and comment buttons */
.mytablescount {
  width: 100%;
  margin: 1rem 0;
  display: flex;
  justify-content: center;
  gap: 1rem;
  border-collapse: collapse;
}

.mytablescount tr {
  display: flex;
  justify-content: center;
  gap: 1rem;
}

.mytablescount th {
  border: none;
  background-color: transparent;
  text-decoration: none;
  font-size: 0.9rem;
font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Arial, sans-serif;  font-weight: 500;
  text-align: center;
  vertical-align: middle;
  margin: 0;
  padding: 0;
  float: none;
}

.mytablescount button {
  background: var(--bg-tertiary);
  border: 1px solid var(--border-primary);
  border-radius: 8px;
  padding: 0.5rem 1rem;
  color: var(--text-secondary);
  font-size: 0.9rem;
  cursor: pointer;
  transition: var(--transition);
  display: flex;
  align-items: center;
  gap: 0.5rem;
  margin: 0;
}

.mytablescount button:hover {
  background: var(--accent-primary);
  color: #fff;
  transform: translateY(-1px);
}

.mytablescount img {
  height: 16px;
  width: 16px;
  display: inline-block;
  margin: 0;
  vertical-align: middle;
}

.mytablescount a {
  text-decoration: none;
  color: inherit;
}

/* Comments section */
.allcomments {
  display: none;
  margin-top: 1rem;
  padding: 1rem;
  background: var(--bg-tertiary);
  border-radius: 8px;
  border: 1px solid var(--border-primary);
}

.postuppercomm {
  display: flex;
  align-items: center;
  gap: 0.8rem;
  margin-bottom: 1rem;
  padding-bottom: 0.5rem;
  border-bottom: 1px solid var(--border-primary);
}

.postuppercomm a {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  text-decoration: none;
  color: var(--accent-primary);
  font-weight: 600;
  font-size: 1rem;
}

.postuppercomm img {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  object-fit: cover;
  border: 2px solid var(--accent-primary);
}

.postuppercomm p {
  margin: 0;
  font-size: 0.85rem;
  color: var(--text-secondary);
}

.commtextp {
  background: var(--bg-card);
  padding: 1rem;
  margin: 0.5rem 0;
  border-radius: 8px;
  border: 1px solid var(--border-primary);
  color: var(--text-primary);
  line-height: 1.5;
  font-size: 0.95rem;
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
    padding: 1rem;
  }
  
  .approvereject {
    flex-direction: column;
  }
  
  .app1, .app2 {
    justify-content: center;
  }
  
  .pghead {
    font-size: 1.8rem;
  }
  
  .post {
    padding: 1.5rem;
    margin: 1rem auto;
  }
  
  .mytablescount {
    flex-direction: column;
    align-items: center;
  }
}

@media (max-width: 600px) {
  .postupper {
    flex-direction: column;
    align-items: flex-start;
    gap: 0.5rem;
  }
  
  .postupper a {
    width: 100%;
  }
  
  h2 {
    font-size: 1.4rem;
    padding: 0.8rem;
  }
}
</style>
</head>

	<%
  		try
			{
  			 
  			if(session.getAttribute("token") != null) {
  				if (session.getAttribute("token").toString().equals("8023d9fd-156a-43f4-ae7c-968936ab86a5")) {
			
			%>
			
		<body>
			
	<div id="content" class="content">
	
	<h1 class="pghead"><i class="fa-solid fa-flag"></i> Manage Reports</h1>
		
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
			ResultSet rs=null;
			ResultSet rs2=null;
			ResultSet rscomments = null;
			PreparedStatement pstmt = null;
			PreparedStatement pstmt2 = null;
			PreparedStatement pstmtcomments = null;
			
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
			String qry2 = null;
			String qry = null;
			String reporterid = null;
			int likescount;
			int commentscount;
			int priorins = 0;
			int ntfno = 0;
			int pstcountfrads = 0;
			String qrycomments = null;
			String commtext = null;
			String posteridcomm = null;
			int xk = -1;
			int i = 0;
			
			
			HashSet<String> mylist = new HashSet<String>();
			
			
			
			out.print("<h2><i class='fa-solid fa-flag'></i> Political Controversy</h2>");
			qry2="select * from reports WHERE reporttype = 'Political'";
			pstmt = conn.prepareStatement(qry2, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			rs2=pstmt.executeQuery();
			
			
			while(rs2.next())
			{
				
				postid = rs2.getString(4);
				posterid = rs2.getString(5);
				reporterid = rs2.getString(2);
				
		   qry = "select * from posts WHERE posterid =? AND postid =?";
		   pstmt2 = conn.prepareStatement(qry, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		   pstmt2.setString(1, posterid);
		   pstmt2.setString(2, postid);
		   rs=pstmt2.executeQuery();
		   
		   while (rs.next()) {
				
			   	posterid = rs.getString(2);
				postid = rs.getString(4);
				posttype = rs.getInt(7);				
				privacy = rs.getInt(8);
				likescount = db.countlikers(postid, posterid);
				commentscount  = db.countcommentators(postid, posterid);
				
				String[] psfetches = db.nameico(posterid);
				String psfullname = psfetches[0];
				String pspp = "img/".concat(psfetches[1]);
				
				if (mylist.add(postid)) {

								posttext = base64.de(rs.getString(5)).replaceAll("(\r\n|\n)", "<br>");
								yourpostp = rs.getString(6);
								
								if (yourpostp != null) {
									imdir = "img/".concat(yourpostp);
								}
								
						   %>
						   <div class="post-card" id="<%=postid%>">
						   <div class="post-header">
						   <img class="post-profile-img" src="<%=pspp%>" alt="<%=psfullname%>" />
						   <div>
						   <a href="profile.jsp?userId=<%=posterid%>" class="post-profile-name"><%=psfullname%></a>
						   <div class="post-meta-info">
						   <div class="post-time"><%=db.timeconsp("6", rs.getString(9))%></div>
						   <div class="post-cat-priv">
						   <%
						   if (posttype == 1) {
							   postistype = "Thought";
						   }
						   else if (posttype == 2) {
							   postistype = "Idea";
						   }
						   else if (posttype == 3) {
							   postistype = "Project";
						   }
						   
						   
						   if (privacy == 3) {
							   postisfor = "Thynkmates &amp; Fans";
						   }
						   else if (privacy == 2) {
							   postisfor = "Thynkmates";
						   }
						   else if (privacy == 1) {
							   postisfor = "Fans";
						   }
						   out.print(postistype+", "+postisfor+"<br>Reported by: "+reporterid);
						   %>
						   </div>
						   </div>
						   </div>
						   </div>

				   <div class="post-content"><%=posttext%></div>
				   <% if (imdir != null) {%>
		   		   <img class="post-image" src="<%=imdir%>" alt="Post image" />
		   		   <%}%>
		   
		   <div class="post-actions">
		   <div class="post-counts">
		   <% if(likescount != 0) {%>
		   <span class="reactors-toggle" onclick="alllikers('<%=postid%>alllikes')"><i class="fa-solid fa-heart"></i> <%=likescount%></span>
		   <%}%>
		   <% if(commentscount != 0) {%>
		   <span class="comments-toggle" onclick="allcomms('<%=postid%>allcomments')"><i class="fa-solid fa-comments"></i> <%=commentscount%></span>
		   <%}%>
		   </div>
		   
		   <div class="approvereject">
		   		   <a class="rejectlink" href="javascript:void(0);" onClick="reply_click9('rej<%=postid%>', 'cou<%=posterid%>')"><button class="app1"><i class="fa-solid fa-times"></i> Ignore</button></a>
		   		   <a href="javascript:void(0);" onClick="reply_click9('app<%=postid%>', 'cou<%=posterid%>')"><button class="app2"><i class="fa-solid fa-trash"></i> Remove</button></a>
		   </div>
		   </div>

			<div class="allcomments" id="<%=postid%>allcomments"><%
			qrycomments="select * from notif WHERE postid =? AND liketype = 3";
			pstmtcomments = conn.prepareStatement(qrycomments, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			pstmtcomments.setString(1, postid);
			rscomments=pstmtcomments.executeQuery();
			xk = -1;
			
			
			while(rscomments.absolute(xk))
			{
				
				posteridcomm = rscomments.getString(2);
				commtext = base64.de(rscomments.getString(7)).replaceAll("(\r\n|\n)", "<br>");
				ntfno = rscomments.getInt(1);
				
				String[] psfetchescomm = db.nameico(posteridcomm);
				String psfullnamecomm = psfetchescomm[0];
				String psppcomm = "img/".concat(psfetchescomm[1]);
				
				%>
				   <div class="postuppercomm">
				   <a href="profile.jsp?userId=<%=posteridcomm%>"><img id="disc" src="<%=psppcomm%>">
			       <%=psfullnamecomm%></a>
				   <br>
				   <%
				   out.print("<p>"+db.timeconsp("6", rscomments.getString(8))+"</p>");
				   %>
				   </div>
				   <p class="commtextp"><%=commtext%></p>
				   
			<% xk--; }%>
			</div>
			</div>

				   </div>
				   <%
						}
				   }
				}

			
			
			
			
			
			
			
			
			
			out.print("<h2><i class='fa-solid fa-newspaper'></i> False news or rumor</h2>");
			qry2="select * from reports WHERE reporttype = 'Falsenews'";
			pstmt = conn.prepareStatement(qry2, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			rs2=pstmt.executeQuery();
			
				
				while(rs2.next())
				{
					
					postid = rs2.getString(4);
					posterid = rs2.getString(5);
					reporterid = rs2.getString(2);
					
			   qry = "select * from posts WHERE posterid =? AND postid =?";
			   pstmt2 = conn.prepareStatement(qry, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			   pstmt2.setString(1, posterid);
			   pstmt2.setString(2, postid);
			   rs=pstmt2.executeQuery();
			   
			   while (rs.next()) {
					
				   	posterid = rs.getString(2);
					postid = rs.getString(4);
					posttype = rs.getInt(7);				
					privacy = rs.getInt(8);
					likescount = db.countlikers(postid, posterid);
					commentscount  = db.countcommentators(postid, posterid);
					
					String[] psfetches = db.nameico(posterid);
					String psfullname = psfetches[0];
					String pspp = "img/".concat(psfetches[1]);
					
					if (mylist.add(postid)) {
							
									posttext = base64.de(rs.getString(5)).replaceAll("(\r\n|\n)", "<br>");
									yourpostp = rs.getString(6);
									
									if (yourpostp != null) {
										imdir = "img/".concat(yourpostp);
									}
									
							   %>
							   <div class="post-card" id="<%=postid%>">
							   <div class="post-header">
							   <img class="post-profile-img" src="<%=pspp%>" alt="<%=psfullname%>" />
							   <div>
							   <a href="profile.jsp?userId=<%=posterid%>" class="post-profile-name"><%=psfullname%></a>
							   <div class="post-meta-info">
							   <div class="post-time"><%=db.timeconsp("6", rs.getString(9))%></div>
							   <div class="post-cat-priv">
							   <%
							   if (posttype == 1) {
								   postistype = "Thought";
							   }
							   else if (posttype == 2) {
								   postistype = "Idea";
							   }
							   else if (posttype == 3) {
								   postistype = "Project";
							   }
							   
							   
							   if (privacy == 3) {
								   postisfor = "Thynkmates &amp; Fans";
							   }
							   else if (privacy == 2) {
								   postisfor = "Thynkmates";
							   }
							   else if (privacy == 1) {
								   postisfor = "Fans";
							   }
							   out.print(postistype+", "+postisfor+"<br>Reported by: "+reporterid);
							   %>
							   </div>
							   </div>
							   </div>
							   </div>

					   <div class="post-content"><%=posttext%></div>
					   <% if (imdir != null) {%>
			   		   <img class="post-image" src="<%=imdir%>" alt="Post image" />
			   		   <%}%>
	   
	   <div class="post-actions">
	   <div class="post-counts">
	   <% if(likescount != 0) {%>
	   <span class="reactors-toggle" onclick="alllikers('<%=postid%>alllikes')"><i class="fa-solid fa-heart"></i> <%=likescount%></span>
	   <%}%>
	   <% if(commentscount != 0) {%>
	   <span class="comments-toggle" onclick="allcomms('<%=postid%>allcomments')"><i class="fa-solid fa-comments"></i> <%=commentscount%></span>
	   <%}%>
	   </div>
	   
	   <div class="approvereject">
		   		   <a class="rejectlink" href="javascript:void(0);" onClick="reply_click9('rej<%=postid%>', 'cou<%=posterid%>')"><button class="app1"><i class="fa-solid fa-times"></i> Ignore</button></a>
		   		   <a href="javascript:void(0);" onClick="reply_click9('app<%=postid%>', 'cou<%=posterid%>')"><button class="app2"><i class="fa-solid fa-trash"></i> Remove</button></a>
	   </div>
	   </div>

		<div class="allcomments" id="<%=postid%>allcomments"><%
		qrycomments="select * from notif WHERE postid =? AND liketype = 3";
		pstmtcomments = conn.prepareStatement(qrycomments, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		pstmtcomments.setString(1, postid);
		rscomments=pstmtcomments.executeQuery();
		xk = -1;
		
		
		while(rscomments.absolute(xk))
		{
			
			posteridcomm = rscomments.getString(2);
			commtext = base64.de(rscomments.getString(7)).replaceAll("(\r\n|\n)", "<br>");
			ntfno = rscomments.getInt(1);
			
			String[] psfetchescomm = db.nameico(posteridcomm);
			String psfullnamecomm = psfetchescomm[0];
			String psppcomm = "img/".concat(psfetchescomm[1]);
			
			%>
			   <div class="postuppercomm">
			   <a href="profile.jsp?userId=<%=posteridcomm%>"><img id="disc" src="<%=psppcomm%>">
		       <%=psfullnamecomm%></a>
			   <br>
			   <%
			   out.print("<p>"+db.timeconsp("6", rscomments.getString(8))+"</p>");
			   %>
			   </div>
			   <p class="commtextp"><%=commtext%></p>
			   
		<% xk--; }%>
		</div>
		</div>
					   
					   </div>
					   <%
						}
					}
				}
			
			
					
			
			
			
			
			
			
			
			
			out.print("<h2><i class='fa-solid fa-user-secret'></i> Partial or full nudity</h2>");
			qry2="select * from reports WHERE reporttype = 'Nudity'";
			pstmt = conn.prepareStatement(qry2, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			rs2=pstmt.executeQuery();
			

				while(rs2.next())
				{
					
					postid = rs2.getString(4);
					posterid = rs2.getString(5);
					reporterid = rs2.getString(2);
					
			   qry = "select * from posts WHERE posterid =? AND postid =?";
			   pstmt2 = conn.prepareStatement(qry, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			   pstmt2.setString(1, posterid);
			   pstmt2.setString(2, postid);
			   rs=pstmt2.executeQuery();
			   
			   while (rs.next()) {
					
				   	posterid = rs.getString(2);
					postid = rs.getString(4);
					posttype = rs.getInt(7);				
					privacy = rs.getInt(8);
					likescount = db.countlikers(postid, posterid);
					commentscount  = db.countcommentators(postid, posterid);
					
					String[] psfetches = db.nameico(posterid);
					String psfullname = psfetches[0];
					String pspp = "img/".concat(psfetches[1]);
					
					if (mylist.add(postid)) {

									posttext = base64.de(rs.getString(5)).replaceAll("(\r\n|\n)", "<br>");
									yourpostp = rs.getString(6);
									
									if (yourpostp != null) {
										imdir = "img/".concat(yourpostp);
									}
									
							   %>
							   <div class="post-card" id="<%=postid%>">
							   <div class="post-header">
							   <img class="post-profile-img" src="<%=pspp%>" alt="<%=psfullname%>" />
							   <div>
							   <a href="profile.jsp?userId=<%=posterid%>" class="post-profile-name"><%=psfullname%></a>
							   <div class="post-meta-info">
							   <div class="post-time"><%=db.timeconsp("6", rs.getString(9))%></div>
							   <div class="post-cat-priv">
							   <%
							   if (posttype == 1) {
								   postistype = "Thought";
							   }
							   else if (posttype == 2) {
								   postistype = "Idea";
							   }
							   else if (posttype == 3) {
								   postistype = "Project";
							   }
							   
							   
							   if (privacy == 3) {
								   postisfor = "Thynkmates &amp; Fans";
							   }
							   else if (privacy == 2) {
								   postisfor = "Thynkmates";
							   }
							   else if (privacy == 1) {
								   postisfor = "Fans";
							   }
							   out.print(postistype+", "+postisfor+"<br>Reported by: "+reporterid);
							   %>
							   </div>
							   </div>
							   </div>
							   </div>

					   <div class="post-content"><%=posttext%></div>
					   <% if (imdir != null) {%>
			   		   <img class="post-image" src="<%=imdir%>" alt="Post image" />
			   		   <%}%>
	   
	   <div class="post-actions">
	   <div class="post-counts">
	   <% if(likescount != 0) {%>
	   <span class="reactors-toggle" onclick="alllikers('<%=postid%>alllikes')"><i class="fa-solid fa-heart"></i> <%=likescount%></span>
	   <%}%>
	   <% if(commentscount != 0) {%>
	   <span class="comments-toggle" onclick="allcomms('<%=postid%>allcomments')"><i class="fa-solid fa-comments"></i> <%=commentscount%></span>
	   <%}%>
	   </div>
	   
	   <div class="approvereject">
		   		   <a class="rejectlink" href="javascript:void(0);" onClick="reply_click9('rej<%=postid%>', 'cou<%=posterid%>')"><button class="app1"><i class="fa-solid fa-times"></i> Ignore</button></a>
		   		   <a href="javascript:void(0);" onClick="reply_click9('app<%=postid%>', 'cou<%=posterid%>')"><button class="app2"><i class="fa-solid fa-trash"></i> Remove</button></a>
	   </div>
	   </div>

		<div class="allcomments" id="<%=postid%>allcomments"><%
		qrycomments="select * from notif WHERE postid =? AND liketype = 3";
		pstmtcomments = conn.prepareStatement(qrycomments, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		pstmtcomments.setString(1, postid);
		rscomments=pstmtcomments.executeQuery();
		xk = -1;
		
		
		while(rscomments.absolute(xk))
		{
			
			posteridcomm = rscomments.getString(2);
			commtext = base64.de(rscomments.getString(7)).replaceAll("(\r\n|\n)", "<br>");
			ntfno = rscomments.getInt(1);
			
			String[] psfetchescomm = db.nameico(posteridcomm);
			String psfullnamecomm = psfetchescomm[0];
			String psppcomm = "img/".concat(psfetchescomm[1]);
			
			%>
			   <div class="postuppercomm">
			   <a href="profile.jsp?userId=<%=posteridcomm%>"><img id="disc" src="<%=psppcomm%>">
		       <%=psfullnamecomm%></a>
			   <br>
			   <%
			   out.print("<p>"+db.timeconsp("6", rscomments.getString(8))+"</p>");
			   %>
			   </div>
			   <p class="commtextp"><%=commtext%></p>
			   
		<% xk--; }%>
		</div>
		</div>
					   
					   </div>
					   <%
						}
					}
				}
			
			
			
			
			
			
			
			
			
			out.print("<h2><i class='fa-solid fa-fist-raised'></i> Violence</h2>");
			qry2="select * from reports WHERE reporttype = 'Violence'";
			pstmt = conn.prepareStatement(qry2, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			rs2=pstmt.executeQuery();
			
				
				while(rs2.next())
				{
					
					postid = rs2.getString(4);
					posterid = rs2.getString(5);
					reporterid = rs2.getString(2);
					
			   qry = "select * from posts WHERE posterid =? AND postid =?";
			   pstmt2 = conn.prepareStatement(qry, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			   pstmt2.setString(1, posterid);
			   pstmt2.setString(2, postid);
			   rs=pstmt2.executeQuery();
			   
			   while (rs.next()) {
					
				   	posterid = rs.getString(2);
					postid = rs.getString(4);
					posttype = rs.getInt(7);				
					privacy = rs.getInt(8);
					likescount = db.countlikers(postid, posterid);
					commentscount  = db.countcommentators(postid, posterid);
					
					String[] psfetches = db.nameico(posterid);
					String psfullname = psfetches[0];
					String pspp = "img/".concat(psfetches[1]);
					
					if (mylist.add(postid)) {

									posttext = base64.de(rs.getString(5)).replaceAll("(\r\n|\n)", "<br>");
									yourpostp = rs.getString(6);
									
									if (yourpostp != null) {
										imdir = "img/".concat(yourpostp);
									}
									
							   %>
							   <div class="post-card" id="<%=postid%>">
							   <div class="post-header">
							   <img class="post-profile-img" src="<%=pspp%>" alt="<%=psfullname%>" />
							   <div>
							   <a href="profile.jsp?userId=<%=posterid%>" class="post-profile-name"><%=psfullname%></a>
							   <div class="post-meta-info">
							   <div class="post-time"><%=db.timeconsp("6", rs.getString(9))%></div>
							   <div class="post-cat-priv">
							   <%
							   if (posttype == 1) {
								   postistype = "Thought";
							   }
							   else if (posttype == 2) {
								   postistype = "Idea";
							   }
							   else if (posttype == 3) {
								   postistype = "Project";
							   }
							   
							   
							   if (privacy == 3) {
								   postisfor = "Thynkmates &amp; Fans";
							   }
							   else if (privacy == 2) {
								   postisfor = "Thynkmates";
							   }
							   else if (privacy == 1) {
								   postisfor = "Fans";
							   }
							   out.print(postistype+", "+postisfor+"<br>Reported by: "+reporterid);
							   %>
							   </div>
							   </div>
							   </div>
							   </div>

					   <div class="post-content"><%=posttext%></div>
					   <% if (imdir != null) {%>
			   		   <img class="post-image" src="<%=imdir%>" alt="Post image" />
			   		   <%}%>
	   
	   <div class="post-actions">
	   <div class="post-counts">
	   <% if(likescount != 0) {%>
	   <span class="reactors-toggle" onclick="alllikers('<%=postid%>alllikes')"><i class="fa-solid fa-heart"></i> <%=likescount%></span>
	   <%}%>
	   <% if(commentscount != 0) {%>
	   <span class="comments-toggle" onclick="allcomms('<%=postid%>allcomments')"><i class="fa-solid fa-comments"></i> <%=commentscount%></span>
	   <%}%>
	   </div>
	   
	   <div class="approvereject">
		   		   <a class="rejectlink" href="javascript:void(0);" onClick="reply_click9('rej<%=postid%>', 'cou<%=posterid%>')"><button class="app1"><i class="fa-solid fa-times"></i> Ignore</button></a>
		   		   <a href="javascript:void(0);" onClick="reply_click9('app<%=postid%>', 'cou<%=posterid%>')"><button class="app2"><i class="fa-solid fa-trash"></i> Remove</button></a>
	   </div>
	   </div>

		<div class="allcomments" id="<%=postid%>allcomments"><%
		qrycomments="select * from notif WHERE postid =? AND liketype = 3";
		pstmtcomments = conn.prepareStatement(qrycomments, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		pstmtcomments.setString(1, postid);
		rscomments=pstmtcomments.executeQuery();
		xk = -1;
		
		
		while(rscomments.absolute(xk))
		{
			
			posteridcomm = rscomments.getString(2);
			commtext = base64.de(rscomments.getString(7)).replaceAll("(\r\n|\n)", "<br>");
			ntfno = rscomments.getInt(1);
			
			String[] psfetchescomm = db.nameico(posteridcomm);
			String psfullnamecomm = psfetchescomm[0];
			String psppcomm = "img/".concat(psfetchescomm[1]);
			
			%>
			   <div class="postuppercomm">
			   <a href="profile.jsp?userId=<%=posteridcomm%>"><img id="disc" src="<%=psppcomm%>">
		       <%=psfullnamecomm%></a>
			   <br>
			   <%
			   out.print("<p>"+db.timeconsp("6", rscomments.getString(8))+"</p>");
			   %>
			   </div>
			   <p class="commtextp"><%=commtext%></p>
			   
		<% xk--; }%>
		</div>
		</div>
					   
					   </div>
					   <%
							}
					   }
					}
			
			
			
			
			
			
			
			
			
			out.print("<h2><i class='fa-solid fa-exclamation-triangle'></i> Harassment</h2>");
			qry2="select * from reports WHERE reporttype = 'Harassment'";
			pstmt = conn.prepareStatement(qry2, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			rs2=pstmt.executeQuery();
			
				
				while(rs2.next())
				{
					
					postid = rs2.getString(4);
					posterid = rs2.getString(5);
					reporterid = rs2.getString(2);
					
			   qry = "select * from posts WHERE posterid =? AND postid =?";
			   pstmt2 = conn.prepareStatement(qry, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			   pstmt2.setString(1, posterid);
			   pstmt2.setString(2, postid);
			   rs=pstmt2.executeQuery();
			   
			   while (rs.next()) {
					
				   	posterid = rs.getString(2);
					postid = rs.getString(4);
					posttype = rs.getInt(7);				
					privacy = rs.getInt(8);
					likescount = db.countlikers(postid, posterid);
					commentscount  = db.countcommentators(postid, posterid);
					
					String[] psfetches = db.nameico(posterid);
					String psfullname = psfetches[0];
					String pspp = "img/".concat(psfetches[1]);
					
					if (mylist.add(postid)) {

									posttext = base64.de(rs.getString(5)).replaceAll("(\r\n|\n)", "<br>");
									yourpostp = rs.getString(6);
									
									if (yourpostp != null) {
										imdir = "img/".concat(yourpostp);
									}
									
							   %>
							   <div class="post-card" id="<%=postid%>">
							   <div class="post-header">
							   <img class="post-profile-img" src="<%=pspp%>" alt="<%=psfullname%>" />
							   <div>
							   <a href="profile.jsp?userId=<%=posterid%>" class="post-profile-name"><%=psfullname%></a>
							   <div class="post-meta-info">
							   <div class="post-time"><%=db.timeconsp("6", rs.getString(9))%></div>
							   <div class="post-cat-priv">
							   <%
							   if (posttype == 1) {
								   postistype = "Thought";
							   }
							   else if (posttype == 2) {
								   postistype = "Idea";
							   }
							   else if (posttype == 3) {
								   postistype = "Project";
							   }
							   
							   
							   if (privacy == 3) {
								   postisfor = "Thynkmates &amp; Fans";
							   }
							   else if (privacy == 2) {
								   postisfor = "Thynkmates";
							   }
							   else if (privacy == 1) {
								   postisfor = "Fans";
							   }
							   out.print(postistype+", "+postisfor+"<br>Reported by: "+reporterid);
							   %>
							   </div>
							   </div>
							   </div>
							   </div>

					   <div class="post-content"><%=posttext%></div>
					   <% if (imdir != null) {%>
			   		   <img class="post-image" src="<%=imdir%>" alt="Post image" />
			   		   <%}%>
	   
	   <div class="post-actions">
	   <div class="post-counts">
	   <% if(likescount != 0) {%>
	   <span class="reactors-toggle" onclick="alllikers('<%=postid%>alllikes')"><i class="fa-solid fa-heart"></i> <%=likescount%></span>
	   <%}%>
	   <% if(commentscount != 0) {%>
	   <span class="comments-toggle" onclick="allcomms('<%=postid%>allcomments')"><i class="fa-solid fa-comments"></i> <%=commentscount%></span>
	   <%}%>
	   </div>
	   
	   <div class="approvereject">
		   		   <a class="rejectlink" href="javascript:void(0);" onClick="reply_click9('rej<%=postid%>', 'cou<%=posterid%>')"><button class="app1"><i class="fa-solid fa-times"></i> Ignore</button></a>
		   		   <a href="javascript:void(0);" onClick="reply_click9('app<%=postid%>', 'cou<%=posterid%>')"><button class="app2"><i class="fa-solid fa-trash"></i> Remove</button></a>
	   </div>
	   </div>

		<div class="allcomments" id="<%=postid%>allcomments"><%
		qrycomments="select * from notif WHERE postid =? AND liketype = 3";
		pstmtcomments = conn.prepareStatement(qrycomments, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		pstmtcomments.setString(1, postid);
		rscomments=pstmtcomments.executeQuery();
		xk = -1;
		
		
		while(rscomments.absolute(xk))
		{
			
			posteridcomm = rscomments.getString(2);
			commtext = base64.de(rscomments.getString(7)).replaceAll("(\r\n|\n)", "<br>");
			ntfno = rscomments.getInt(1);
			
			String[] psfetchescomm = db.nameico(posteridcomm);
			String psfullnamecomm = psfetchescomm[0];
			String psppcomm = "img/".concat(psfetchescomm[1]);
			
			%>
			   <div class="postuppercomm">
			   <a href="profile.jsp?userId=<%=posteridcomm%>"><img id="disc" src="<%=psppcomm%>">
		       <%=psfullnamecomm%></a>
			   <br>
			   <%
			   out.print("<p>"+db.timeconsp("6", rscomments.getString(8))+"</p>");
			   %>
			   </div>
			   <p class="commtextp"><%=commtext%></p>
			   
		<% xk--; }%>
		</div>
		</div>
					   
					   </div>
					   <%
							}
					   }
					}
			
			
			
			
			
			
			
			
			
			out.print("<h2><i class='fa-solid fa-ellipsis-h'></i> Other</h2>");
			qry2="select * from reports WHERE reporttype = 'Other'";
			pstmt = conn.prepareStatement(qry2, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			rs2=pstmt.executeQuery();
			
				
				while(rs2.next())
				{
					
					postid = rs2.getString(4);
					posterid = rs2.getString(5);
					reporterid = rs2.getString(2);
					
			   qry = "select * from posts WHERE posterid =? AND postid =?";
			   pstmt2 = conn.prepareStatement(qry, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			   pstmt2.setString(1, posterid);
			   pstmt2.setString(2, postid);
			   rs=pstmt2.executeQuery();
			   
			   while (rs.next()) {
					
				   	posterid = rs.getString(2);
					postid = rs.getString(4);
					posttype = rs.getInt(7);				
					privacy = rs.getInt(8);
					likescount = db.countlikers(postid, posterid);
					commentscount  = db.countcommentators(postid, posterid);
					
					String[] psfetches = db.nameico(posterid);
					String psfullname = psfetches[0];
					String pspp = "img/".concat(psfetches[1]);
					
					if (mylist.add(postid)) {

									posttext = base64.de(rs.getString(5)).replaceAll("(\r\n|\n)", "<br>");
									yourpostp = rs.getString(6);
									
									if (yourpostp != null) {
										imdir = "img/".concat(yourpostp);
									}
									
							   %>
							   <div class="post-card" id="<%=postid%>">
							   <div class="post-header">
							   <img class="post-profile-img" src="<%=pspp%>" alt="<%=psfullname%>" />
							   <div>
							   <a href="profile.jsp?userId=<%=posterid%>" class="post-profile-name"><%=psfullname%></a>
							   <div class="post-meta-info">
							   <div class="post-time"><%=db.timeconsp("6", rs.getString(9))%></div>
							   <div class="post-cat-priv">
							   <%
							   if (posttype == 1) {
								   postistype = "Thought";
							   }
							   else if (posttype == 2) {
								   postistype = "Idea";
							   }
							   else if (posttype == 3) {
								   postistype = "Project";
							   }
							   
							   
							   if (privacy == 3) {
								   postisfor = "Thynkmates &amp; Fans";
							   }
							   else if (privacy == 2) {
								   postisfor = "Thynkmates";
							   }
							   else if (privacy == 1) {
								   postisfor = "Fans";
							   }
							   out.print(postistype+", "+postisfor+"<br>Reported by: "+reporterid);
							   %>
							   </div>
							   </div>
							   </div>
							   </div>

					   <div class="post-content"><%=posttext%></div>
					   <% if (imdir != null) {%>
			   		   <img class="post-image" src="<%=imdir%>" alt="Post image" />
			   		   <%}%>
	   
	   <div class="post-actions">
	   <div class="post-counts">
	   <% if(likescount != 0) {%>
	   <span class="reactors-toggle" onclick="alllikers('<%=postid%>alllikes')"><i class="fa-solid fa-heart"></i> <%=likescount%></span>
	   <%}%>
	   <% if(commentscount != 0) {%>
	   <span class="comments-toggle" onclick="allcomms('<%=postid%>allcomments')"><i class="fa-solid fa-comments"></i> <%=commentscount%></span>
	   <%}%>
	   </div>
	   
	   <div class="approvereject">
		   		   <a class="rejectlink" href="javascript:void(0);" onClick="reply_click9('rej<%=postid%>', 'cou<%=posterid%>')"><button class="app1"><i class="fa-solid fa-times"></i> Ignore</button></a>
		   		   <a href="javascript:void(0);" onClick="reply_click9('app<%=postid%>', 'cou<%=posterid%>')"><button class="app2"><i class="fa-solid fa-trash"></i> Remove</button></a>
	   </div>
	   </div>

		<div class="allcomments" id="<%=postid%>allcomments"><%
		qrycomments="select * from notif WHERE postid =? AND liketype = 3";
		pstmtcomments = conn.prepareStatement(qrycomments, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		pstmtcomments.setString(1, postid);
		rscomments=pstmtcomments.executeQuery();
		xk = -1;
		
		
		while(rscomments.absolute(xk))
		{
			
			posteridcomm = rscomments.getString(2);
			commtext = base64.de(rscomments.getString(7)).replaceAll("(\r\n|\n)", "<br>");
			ntfno = rscomments.getInt(1);
			
			String[] psfetchescomm = db.nameico(posteridcomm);
			String psfullnamecomm = psfetchescomm[0];
			String psppcomm = "img/".concat(psfetchescomm[1]);
			
			%>
			   <div class="postuppercomm">
			   <a href="profile.jsp?userId=<%=posteridcomm%>"><img id="disc" src="<%=psppcomm%>">
		       <%=psfullnamecomm%></a>
			   <br>
			   <%
			   out.print("<p>"+db.timeconsp("6", rscomments.getString(8))+"</p>");
			   %>
			   </div>
			   <p class="commtextp"><%=commtext%></p>
			   
		<% xk--; }%>
		</div>
		</div>
					   
					   </div>
					   <%
							}
					   }
					}
				
				
				
				
				
				
  				}
  			}
  			else {
  				response.sendRedirect("index.jsp");
  				return;
  			}
  			

			} catch(Exception ex) {
				System.out.print(ex+"at manage-reports.jsp");
		}
	%>
	
	<p Style="max-width: 700px; font-family: oswald,sans-serif; font-weight: 400; font-style: normal; text-align: center; color: white;">
	You don't have any more reports to see.
	</p>
	<br><br><br>
	</div>
	
	

	<FORM NAME="form9" ACTION = "repapprove.jsp" METHOD="POST">
			<INPUT TYPE="HIDDEN" NAME="quixes">
			<INPUT TYPE="HIDDEN" NAME="quixes2">
			<INPUT TYPE="HIDDEN" NAME="csrf" VALUE="<%=db.csrftoken()%>">
	</FORM>
	
			
			
			<script type="text/javascript">
	  		function reply_click9(apprejpostid, postid)
	  		{
		  document.form9.quixes.value = apprejpostid;
		  document.form9.quixes2.value = postid;
	      form9.submit();
	  		}
			</script>
			
			
	<script type="text/javascript">
			function allcomms(allcomments)
			{
				var allcomm = document.getElementById(allcomments);
				  if (allcomm.style.display !== "block") {
					allcomm.style.display = "block";
				  } else {
					allcomm.style.display = "none";
				  }
			}
	</script>
	
	<script>
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
		
		// Enhanced comment toggle functionality
		function allcomms(allcomments) {
			const allcomm = document.getElementById(allcomments);
			if (allcomm.style.display !== "block") {
				allcomm.style.display = "block";
				allcomm.scrollIntoView({ behavior: 'smooth', block: 'nearest' });
			} else {
				allcomm.style.display = "none";
			}
		}
		
		// Enhanced like display functionality
		function alllikers(alllikes) {
			// This function can be enhanced later if needed
			console.log('Likes for:', alllikes);
		}
	</script>
	
</body>
</html>