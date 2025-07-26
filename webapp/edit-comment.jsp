<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.thynkzone.jsp.*" %>
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
	<link rel="preload" as="image" href="icon/prioritized.png"> 
	<link rel="preload" as="image" href="icon/inspired.png">
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
  --accent-haha: #f39c12;
  --accent-love: #1da1f2;
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

.main-center-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: flex-start;
  min-height: 100vh;
  padding: 2.5rem 1rem 2rem 1rem;
}

/* Page Header Styling */
.page-header {
  text-align: center;
  padding: 1.5rem;
  background: var(--bg-card);
  border: 1px solid var(--border-primary);
  border-radius: 16px;
  box-shadow: var(--shadow-md);
  max-width: 600px;
  width: 100%;
  margin-bottom: 2rem;
}

.page-title {
font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Arial, sans-serif;  font-size: 1.5rem;
  font-weight: 700;
  color: var(--accent-primary);
  margin: 0;
  text-align: center;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 0.5rem;
}

.page-title i {
  font-size: 1.3rem;
  color: var(--accent-primary);
}

/* Form width matching search bar */
.edit-form-container {
  max-width: 600px;
  width: 100%;
  margin: 0 auto;
}

/* Comment edit card modernized - matching index.jsp frmdsgn */
.edit-card {
  max-width: 480px;
  width: 100%;
  margin: 2.5rem auto 2rem auto;
  box-shadow: var(--shadow-lg);
  padding: 2.5rem 2rem 2rem 2rem;
  border-radius: 22px;
  background: var(--bg-card);
  border: 1.5px solid var(--border-primary);
  position: relative;
}

.edit-card h2 {
  font-size: 1.15rem;
  font-weight: 600;
  color: var(--accent-primary);
  text-align: center;
  margin-bottom: 1.2rem;
}

/* Floating label for textarea - matching index.jsp */
.floating-label {
  position: relative;
  width: 100%;
}

.floating-label textarea {
  min-height: 100px;
  font-size: 1.08rem;
  border-radius: 14px;
  padding: 1.2rem 1rem 0.7rem 1rem;
  width: 100%;
  background: var(--bg-tertiary);
  color: var(--text-primary);
  border: 1.5px solid var(--border-primary);
  box-shadow: 0 1px 4px 0 rgba(0,0,0,0.08);
  transition: border 0.2s, box-shadow 0.2s;
  resize: vertical;
}

.floating-label label {
  position: absolute;
  left: 1.1rem;
  top: 1.1rem;
  color: var(--text-secondary);
  font-size: 1.05rem;
  pointer-events: none;
  background: transparent;
  transition: 0.2s ease all;
}

.floating-label textarea:focus + label,
.floating-label textarea:not(:placeholder-shown) + label {
  top: -0.7rem;
  left: 0.9rem;
  font-size: 0.92rem;
  color: var(--accent-primary);
  background: var(--bg-card);
  padding: 0 0.3rem;
  border-radius: 4px;
}

.floating-label textarea:focus {
  outline: none;
  border-color: var(--accent-primary);
  box-shadow: 0 0 0 4px rgba(29, 161, 242, 0.1);
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
  transition: all 0.2s ease;
  margin-top: 0.5rem;
  box-shadow: var(--shadow-md);
  width: 100%;
  display: block;
}

.button:hover {
  background: var(--accent-secondary);
  color: #fff;
  transform: translateY(-1px);
  box-shadow: var(--shadow-lg);
}

.user-info {
  display: flex;
  align-items: center;
  gap: 0.8rem;
  margin-bottom: 1rem;
  padding: 0.8rem;
  background: var(--bg-glass);
  border-radius: 10px;
}

.user-info img {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  object-fit: cover;
  border: 2px solid var(--accent-primary);
}

.user-info a {
  color: var(--accent-primary);
  text-decoration: none;
  font-weight: 500;
}

.user-info a:hover {
  text-decoration: underline;
}

.titletags {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Arial, sans-serif;  font-weight: 600;
  font-size: 1.4em;
  margin: 0 auto 1rem auto;
  padding: 0;
  color: var(--text-primary);
  text-align: center;
}

@media (max-width: 500px) {
  .edit-card {
    max-width: 98vw;
    padding: 0.8rem 0.5rem;
    border-radius: 10px;
  }
  .main-center-container {
    padding: 1.2rem 0.2rem 1.2rem 0.2rem;
  }
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
			
			<!-- Modern App-Style Navigation Bar -->
			<nav class="topnav" id="myTopnav" role="navigation" aria-label="Main Navigation">
			  <div class="container">
			    <a href="index.jsp" aria-label="Home">
			      <img class="thinking" src="icon/p&c.png" alt="P&C Logo" />
			    </a>
			    <div class="rights" id="royal">
			      <a class="topaa active" href="index.jsp" title="Home" aria-label="Home">
			        <i class="fa-solid fa-house"></i>
			      </a>
			      <a href="following.jsp" title="Co-workers &amp; Followers" aria-label="Co-workers &amp; Followers">
			        <i class="fa-solid fa-user-group"></i>
			      </a>
			      <a href="post-updates.jsp" title="Notifications" aria-label="Notifications">
			        <i class="fa-solid fa-bell"></i>
			      </a>
			      <!-- Profile Dropdown -->
			      <div class="dropdown">
			        <button class="dropbtn" id="dropdownMenuButton" aria-haspopup="true" aria-expanded="false" aria-label="Account Menu" onclick="toggleDropdown(event)">
			          <img id="prodisc" src="<%=psmall%>" alt="Profile" />
			        </button>
			        <div class="dropdown-content" id="myDropdown" role="menu" aria-labelledby="dropdownMenuButton">
			          <a href="profile.jsp?userId=<%=ix%>" role="menuitem"><i class="fa-solid fa-user"></i>Profile</a>
			          <a href="settings.jsp" role="menuitem"><i class="fa-solid fa-gear"></i>Settings</a>
			          <a href="logout.jsp" role="menuitem"><i class="fa-solid fa-right-from-bracket"></i>Logout</a>
			        </div>
			      </div>
			      <!-- Dark Mode Toggle -->
			      <button id="darkModeToggle" title="Toggle dark mode" aria-label="Toggle dark mode">
			        <i id="darkModeIcon" class="fa-solid fa-moon"></i>
			      </button>
			    </div>
			  </div>
			</nav>
	
	<!-- Modern Search Bar -->
	<div id="search" class="search" style="background: transparent; box-shadow: none; border: none; margin-bottom: 1rem;">
	  <form name="frm" action="search-user.jsp" method="POST" autocomplete="off" style="width: 100%; max-width: 600px; margin: 0 auto;">
	    <div class="input-container modern-search">
	      <input class="input-field modern-search-input" type="text" name="srchtxt" style="margin-bottom: 0px;" placeholder="Search Profiles" maxlength="50" required aria-label="Search Profiles" />
	      <input type="hidden" name="csrf" value="<%=db.csrftoken()%>">
	      <button class="modern-search-btn" type="submit" aria-label="Search">
	        <img src="icon/searchbutton.png" alt="Search" />
	      </button>
	    </div>
	  </form>
	</div>

	<script type="text/javascript">
	/* When the user clicks on the button, 
	toggle between hiding and showing the dropdown content */
	function toggleDropdown(event) {
	event.stopPropagation();
	const dropdown = document.getElementById('myDropdown');
	const button = document.getElementById('dropdownMenuButton');
	const expanded = button.getAttribute('aria-expanded') === 'true';
	button.setAttribute('aria-expanded', !expanded);
	dropdown.classList.toggle('show');
	}

	// Close dropdown on outside click
	window.addEventListener('click', function(e) {
	  const dropdown = document.getElementById('myDropdown');
	  const button = document.getElementById('dropdownMenuButton');
	  if (dropdown.classList.contains('show')) {
	    if (!dropdown.contains(e.target) && !button.contains(e.target)) {
	      dropdown.classList.remove('show');
	      button.setAttribute('aria-expanded', 'false');
	    }
	  }
	});
	</script>
	
	<script>
	// Dark mode toggle
	const darkModeToggle = document.getElementById('darkModeToggle');
	const darkModeIcon = document.getElementById('darkModeIcon');

	// Check for saved theme preference or use device default
	const savedTheme = localStorage.getItem('theme');
	const devicePrefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
	const currentTheme = savedTheme || (devicePrefersDark ? 'dark' : 'light');

	// Apply the theme on page load
	// CSS: :root = dark theme, .dark-mode class = light theme
	if (currentTheme === 'light') {
	  // Apply light theme
	  if (!document.body.classList.contains('dark-mode')) {
	    document.body.classList.add('dark-mode');
	  }
	  darkModeIcon.className = 'fa-solid fa-sun';
	} else {
	  // Apply dark theme  
	  if (document.body.classList.contains('dark-mode')) {
	    document.body.classList.remove('dark-mode');
	  }
	  darkModeIcon.className = 'fa-solid fa-moon';
	}

	darkModeToggle.onclick = function() {
	  document.body.classList.toggle('dark-mode');
	  
	  let theme;
	  // CSS: :root = dark theme, .dark-mode class = light theme
	  if(document.body.classList.contains('dark-mode')) {
	    darkModeIcon.className = 'fa-solid fa-sun';
	    theme = 'light';
	  } else {
	    darkModeIcon.className = 'fa-solid fa-moon';
	    theme = 'dark';
	  }
	  
	  // Save the theme preference
	  localStorage.setItem('theme', theme);
	};
	</script>
			
	
	<body>		
			
	<div class="main-center-container">

    <!-- Page Header -->
    <div class="page-header">
      <h1 class="page-title"><i class="fa-solid fa-edit"></i> Edit your Comment</h1>
    </div>

<%
	
	
			String posteridcomm = null;
			String postid = null;
			String ntfno = null;
			String commtext = null;
			String posterid = null;
			
			String token = request.getParameter("csrf");
			if (db.verifycsrftoken(token)) {
			
			
			posteridcomm = antisamy.safe(request.getParameter("alixes"));
			postid = antisamy.safe(request.getParameter("alixes2"));
			ntfno = antisamy.safe(request.getParameter("alixes3"));
			commtext = request.getParameter("alixes4");
			posterid = antisamy.safe(request.getParameter("alixes5"));
			
		if (db.inputvalidatorString(commtext, 2)) {
			
			if (posteridcomm != null && postid != null && commtext != null && ix.equals(posteridcomm)) {%>
			
				<div class="edit-form-container">
					<div class="edit-card">
						<h2 class="titletags">At <%if (!posterid.equals(ix)){%><%=db.getfullname(posterid)%>'s<%} else {%>your<%}%> post</h2>
						
						<div class="user-info">
							<a href="profile.jsp?userId=<%=ix%>"><img src="<%=psmall%>" alt="<%=pname%>"></a>
							<a href="profile.jsp?userId=<%=ix%>"><%=pname%></a>
						</div>
						
						<FORM ACTION = "upcommydum.jsp" METHOD="POST">
							<div class="floating-label">
								<textarea name="commtext" placeholder=" " maxlength="2000" required aria-label="Comment text"><%=base64.de(commtext).replaceAll("<br>", "")%></textarea>
								<label for="commtext">Edit your comment...</label>
							</div>
							<INPUT TYPE="hidden" NAME="postid" VALUE = "<%=postid%>">
							<INPUT TYPE="hidden" NAME="posteridcomm" VALUE = "<%=posteridcomm%>">
							<INPUT TYPE="hidden" NAME="ntfno" VALUE = "<%=ntfno%>">
							<INPUT TYPE="HIDDEN" NAME="csrf" VALUE="<%=db.csrftoken()%>">
							<button class = "button" TYPE="submit">Update Comment</button>
						</FORM>
					</div>
				</div>
				
				
				
	<%
			}
			
				}
			
				else {
		        	   //input invalid
		        	   response.sendRedirect("index.jsp");
		    	   	   session.setAttribute("msg", "Attempt unsuccessful.");
		    	   	   return;
		           }
		
		} else {
			//invalid csrf
			response.sendRedirect("index.jsp");
			session.setAttribute("msg", "Attempt unsuccessful");
			return;
		}
			
			} catch(Exception ex) {
				response.sendRedirect("index.jsp");
				System.out.print(ex+"at edit-comment.jsp");
		}
	%>
	
	</div>
	</body>
	</html>
				
				
				
				