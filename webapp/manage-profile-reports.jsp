<%@ page import="com.thynkzone.jsp.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@ page import="java.util.HashSet" %>

<!DOCTYPE html>
	<html lang = "en">
	<head>
	<link rel="icon" href="icon/favicon.ico" type="image/x-icon">
	<title>P&C - Manage Profile Reports</title>
	<meta charset = "UTF-8">
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
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 0.8rem;
}

h2 i {
  font-size: 1.4rem;
  color: var(--accent-warning);
}

/* Profile cards */
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
  
  .pghead {
    font-size: 1.5rem;
  }
  
  .post {
    padding: 1rem;
  }
  
  .approvereject {
    flex-direction: column;
    align-items: center;
  }
  
  .app1, .app2 {
    width: 100%;
    max-width: 200px;
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
}
</style>

</head>

	<%
  		try
			{
  			 
  			if(session.getAttribute("token") != null) {
  				if (session.getAttribute("token").toString().equals("61a96f63-d480-41f3-b383-437c138d07f8")) {
			
			%>
			
		<body>
			
	<div id="content" class="content">
	
	<h1 class="pghead"><i class="fa-solid fa-user-shield"></i> Manage Profile Reports</h1>
		
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
			PreparedStatement pstmt = null;
			PreparedStatement pstmt2 = null;

			
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
			
			
			
			out.print("<h2><i class='fa-solid fa-landmark'></i> Political Controversy</h2>");
			qry2="select * from reportspro WHERE reporttype = 'Political'";
			pstmt = conn.prepareStatement(qry2, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			rs2=pstmt.executeQuery();
			
			
			while(rs2.next())
			{
				
				posterid = rs2.getString(4);
				reporterid = rs2.getString(2);

				
				String[] psfetches = db.nameico(posterid);
				String psfullname = psfetches[0];
				String pspp = "img/".concat(psfetches[1]);
				
				String[] reporterfetches = db.nameico(reporterid);
				String reporterfullname = reporterfetches[0];
				String reporterpp = "img/".concat(reporterfetches[1]);
				
				if (mylist.add(posterid)) {

						   %>
						   <div class="post" id="<%=posterid%>">
						   <div class="postupper">
						   <a href="profile.jsp?userId=<%=posterid%>"><img id="disc" src="<%=pspp%>">
					       <%=psfullname%></a>
					       <p>Reported by: <a href="profile.jsp?userId=<%=reporterid%>" style="color: var(--accent-warning); text-decoration: none;"><img src="<%=reporterpp%>" style="width: 20px; height: 20px; border-radius: 50%; vertical-align: middle; margin-right: 5px;"><%=reporterfullname%></a></p>
						   </div>
				   
<div class="approvereject">
		   		   <a class="rejectlink" href="javascript:void(0);" onClick="reply_click10('rej<%=posterid%>')"><button class="app1"><i class="fa-solid fa-times"></i> Ignore</button></a>
		   		   <a href="javascript:void(0);" onClick="reply_click10('app<%=posterid%>')"><button class="app2"><i class="fa-solid fa-trash"></i> Delete</button></a>
</div>
				   </div>
				   <%
				   }
				}

			
			
			
			
			
			
			
			
			out.print("<h2><i class='fa-solid fa-user-slash'></i> Fake Account</h2>");
			qry2="select * from reportspro WHERE reporttype = 'Fake Account'";
			pstmt = conn.prepareStatement(qry2, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			rs2=pstmt.executeQuery();
			
				
			while(rs2.next())
			{
				
				posterid = rs2.getString(4);
				reporterid = rs2.getString(2);

				
				String[] psfetches = db.nameico(posterid);
				String psfullname = psfetches[0];
				String pspp = "img/".concat(psfetches[1]);
				
				String[] reporterfetches = db.nameico(reporterid);
				String reporterfullname = reporterfetches[0];
				String reporterpp = "img/".concat(reporterfetches[1]);
				
				if (mylist.add(posterid)) {

						   %>
						   <div class="post" id="<%=posterid%>">
						   <div class="postupper">
						   <a href="profile.jsp?userId=<%=posterid%>"><img id="disc" src="<%=pspp%>">
					       <%=psfullname%></a>
					       <p>Reported by: <a href="profile.jsp?userId=<%=reporterid%>" style="color: var(--accent-warning); text-decoration: none;"><img src="<%=reporterpp%>" style="width: 20px; height: 20px; border-radius: 50%; vertical-align: middle; margin-right: 5px;"><%=reporterfullname%></a></p>
						   </div>
				   
<div class="approvereject">
		   		   <a class="rejectlink" href="javascript:void(0);" onClick="reply_click10('rej<%=posterid%>')"><button class="app1"><i class="fa-solid fa-times"></i> Ignore</button></a>
		   		   <a href="javascript:void(0);" onClick="reply_click10('app<%=posterid%>')"><button class="app2"><i class="fa-solid fa-trash"></i> Delete</button></a>
</div>
				   </div>
				   <%
				   }
				}
			
			
					
			
			
			
			
			out.print("<h2><i class='fa-solid fa-user-secret'></i> Partial or full nudity</h2>");
			qry2="select * from reportspro WHERE reporttype = 'Nudity'";
			pstmt = conn.prepareStatement(qry2, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			rs2=pstmt.executeQuery();
			

			while(rs2.next())
			{
				
				posterid = rs2.getString(4);
				reporterid = rs2.getString(2);

				
				String[] psfetches = db.nameico(posterid);
				String psfullname = psfetches[0];
				String pspp = "img/".concat(psfetches[1]);
				
				String[] reporterfetches = db.nameico(reporterid);
				String reporterfullname = reporterfetches[0];
				String reporterpp = "img/".concat(reporterfetches[1]);
				
				if (mylist.add(posterid)) {

						   %>
						   <div class="post" id="<%=posterid%>">
						   <div class="postupper">
						   <a href="profile.jsp?userId=<%=posterid%>"><img id="disc" src="<%=pspp%>">
					       <%=psfullname%></a>
					       <p>Reported by: <a href="profile.jsp?userId=<%=reporterid%>" style="color: var(--accent-warning); text-decoration: none;"><img src="<%=reporterpp%>" style="width: 20px; height: 20px; border-radius: 50%; vertical-align: middle; margin-right: 5px;"><%=reporterfullname%></a></p>
						   </div>
				   
<div class="approvereject">
		   		   <a class="rejectlink" href="javascript:void(0);" onClick="reply_click10('rej<%=posterid%>')"><button class="app1"><i class="fa-solid fa-times"></i> Ignore</button></a>
		   		   <a href="javascript:void(0);" onClick="reply_click10('app<%=posterid%>')"><button class="app2"><i class="fa-solid fa-trash"></i> Delete</button></a>
</div>
				   </div>
				   <%
				   }
				}
			
			
			out.print("<h2><i class='fa-solid fa-ellipsis-h'></i> Other</h2>");
			qry2="select * from reportspro WHERE reporttype = 'Other'";
			pstmt = conn.prepareStatement(qry2, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			rs2=pstmt.executeQuery();
			
				
			while(rs2.next())
			{
				
				posterid = rs2.getString(4);
				reporterid = rs2.getString(2);

				
				String[] psfetches = db.nameico(posterid);
				String psfullname = psfetches[0];
				String pspp = "img/".concat(psfetches[1]);
				
				String[] reporterfetches = db.nameico(reporterid);
				String reporterfullname = reporterfetches[0];
				String reporterpp = "img/".concat(reporterfetches[1]);
				
				if (mylist.add(posterid)) {

								
						   %>
						   <div class="post" id="<%=posterid%>">
						   <div class="postupper">
						   <a href="profile.jsp?userId=<%=posterid%>"><img id="disc" src="<%=pspp%>">
					       <%=psfullname%></a>
					       <p>Reported by: <a href="profile.jsp?userId=<%=reporterid%>" style="color: var(--accent-warning); text-decoration: none;"><img src="<%=reporterpp%>" style="width: 20px; height: 20px; border-radius: 50%; vertical-align: middle; margin-right: 5px;"><%=reporterfullname%></a></p>
						   </div>
				   
<div class="approvereject">
		   		   <a class="rejectlink" href="javascript:void(0);" onClick="reply_click10('rej<%=posterid%>')"><button class="app1"><i class="fa-solid fa-times"></i> Ignore</button></a>
		   		   <a href="javascript:void(0);" onClick="reply_click10('app<%=posterid%>')"><button class="app2"><i class="fa-solid fa-trash"></i> Delete</button></a>
</div>
				   </div>
				   <%
				   }
				}
				
				
				
				
				
				
  				}
  			}
  			else {
  				response.sendRedirect("index.jsp");
  				return;
  			}
  			

			} catch(Exception ex) {
				System.out.print(ex+"at manage-profile-reports.jsp");
		}
	%>
	
	<p Style="max-width: 700px; font-family: oswald,sans-serif; font-weight: 400; font-style: normal; text-align: center; color: white;">
	You don't have any more reports to see.
	</p>
	<br><br><br>
	</div>
	
	
	
	
	
	<FORM NAME="form10" ACTION = "repproapprove.jsp" METHOD="POST">
			<INPUT TYPE="HIDDEN" NAME="farxes">
			<INPUT TYPE="HIDDEN" NAME="csrf" VALUE="<%=db.csrftoken()%>">
	</FORM>
	
			
			
			<script type="text/javascript">
	  		function reply_click10(apprejposterid)
	  		{
		  document.form10.farxes.value = apprejposterid;
	      form10.submit();
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
	</script>
	

	
</body>
</html>