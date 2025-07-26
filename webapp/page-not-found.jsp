<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.thynkzone.jsp.*" %>
<%@ page import="antisamyfile.antisamy" %>

<!DOCTYPE html>
	<html lang = "en">
	<head>
	<link rel="icon" href="icon/favicon.ico" type="image/x-icon">
	<title>P&C - Page Not Found</title>
	<meta charset = "UTF-8">
	<meta name="description" content="P&C (People and Culture) is a workplace social network for employees to share experiences, updates, memes, and insights about their jobs and organizational life."/>
<meta name="keywords" content="People and Culture, workplace social network, employee community, company culture, office memes, job updates, coworker engagement, P&C app, organizational culture, share work life, employee stories"/>
	<meta name="author" content="Md. Mazidul Haque Farabi"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<link rel = "stylesheet" type = "text/css" href = "css-pages.css"> <link rel="preconnect" href="https://fonts.googleapis.com"> <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin> <link rel="preload" href="https://fonts.googleapis.com/css2?family=Oswald:wght@400;700&family=Poppins&display=swap" as ="style" crossorigin> <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@400;700&family=Poppins&display=swap" rel="stylesheet" crossorigin> <link rel="preload" as="image" href="icon/p&c.png"> <link rel="preload" as="image" href="icon/home.png"> <link rel="preload" as="image" href="icon/thynkmates-and-fans.png"> <link rel="preload" as="image" href="icon/notifications.png"> <link rel="preload" as="image" href="icon/drop-settings.png"> <link rel="preload" as="image" href="icon/more.png"> <link rel="preload" as="image" href="icon/searchbutton.png">
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
  justify-content: center;
  min-height: 80vh;
  padding: 2rem 1rem;
}

/* 404 Error Card */
.error-card {
  max-width: 500px;
  width: 100%;
  text-align: center;
  background: var(--bg-card);
  border: 1.5px solid var(--border-primary);
  border-radius: 22px;
  padding: 3rem 2rem;
  box-shadow: var(--shadow-lg);
  margin: 2rem auto;
}

.error-icon {
  font-size: 4rem;
  color: var(--accent-danger);
  margin-bottom: 1.5rem;
}

.error-title {
  font-size: 2.5rem;
  font-weight: 700;
  color: var(--text-primary);
  margin-bottom: 1rem;
font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Arial, sans-serif;}

.error-subtitle {
  font-size: 1.2rem;
  color: var(--text-secondary);
  margin-bottom: 2rem;
  line-height: 1.6;
}

.error-description {
  font-size: 1rem;
  color: var(--text-muted);
  margin-bottom: 2.5rem;
  line-height: 1.6;
}

.error-actions {
  display: flex;
  gap: 1rem;
  justify-content: center;
  flex-wrap: wrap;
}

.error-btn {
  display: inline-flex;
  align-items: center;
  gap: 0.5rem;
  padding: 0.75rem 1.5rem;
  background: var(--accent-primary);
  color: #fff;
  text-decoration: none;
  border-radius: 10px;
  font-weight: 600;
  transition: var(--transition);
  border: none;
  cursor: pointer;
  font-size: 1rem;
}

.error-btn:hover {
  background: var(--accent-secondary);
  transform: translateY(-2px);
  box-shadow: var(--shadow-md);
}

.error-btn.secondary {
  background: var(--bg-tertiary);
  color: var(--text-primary);
  border: 1.5px solid var(--border-primary);
}

.error-btn.secondary:hover {
  background: var(--bg-card);
  border-color: var(--accent-primary);
}

@media (max-width: 600px) {
  .error-card {
    max-width: 95vw;
    padding: 2rem 1.5rem;
  }
  
  .error-title {
    font-size: 2rem;
  }
  
  .error-subtitle {
    font-size: 1.1rem;
  }
  
  .error-actions {
    flex-direction: column;
    align-items: center;
  }
  
  .error-btn {
    width: 100%;
    max-width: 250px;
    justify-content: center;
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

    <!-- 404 Error Card -->
    <div class="error-card">
      <div class="error-icon">
        <i class="fa-solid fa-exclamation-triangle"></i>
      </div>
      
      <h1 class="error-title">404</h1>
      
      <h2 class="error-subtitle">Page Not Found</h2>
      
      <p class="error-description">
        Oops! The page you're looking for doesn't exist. It might have been moved, deleted, or you entered the wrong URL.
      </p>
      
      <div class="error-actions">
        <a href="index.jsp" class="error-btn">
          <i class="fa-solid fa-home"></i>
          Go Home
        </a>
        <button onclick="history.back()" class="error-btn secondary">
          <i class="fa-solid fa-arrow-left"></i>
          Go Back
        </button>
      </div>
    </div>
	
<%		
			} catch(Exception ex) {
				response.sendRedirect("index.jsp");
				System.out.print(ex+"at page-not-found.jsp");
		}
	%>
	
	</div>
	</body>
	</html>
				
				
				
				