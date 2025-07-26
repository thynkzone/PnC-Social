<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.thynkzone.jsp.*" %>

<!DOCTYPE html>
<html lang="en">
	<head>
	<link rel="icon" href="icon/favicon.ico" type="image/x-icon">
	<title>Settings - P&C (People & Culture)</title>
	<meta charset="UTF-8">
	<meta name="description" content="Settings page for P&C (People and Culture) - manage your profile, account settings, and preferences for the workplace social network."/>
<meta name="keywords" content="P&C settings, People and Culture settings, profile settings, account management, workplace social network settings, employee preferences"/>
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
  --accent-warning: #f39c12;
  --text-primary: #fff;
  --text-secondary: #b0b3b8;
  --text-muted: #888;
  --border-primary: #2c2f36;
  --shadow-md: 0 2px 12px 0 rgba(0,0,0,0.18);
  --shadow-lg: 0 8px 32px 0 rgba(0,0,0,0.25);
  --transition: all 0.2s cubic-bezier(.4,0,.2,1);
  --radius-btn: 12px;
  --radius-card: 16px;
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

body {
font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Arial, sans-serif;  background: var(--bg-main) !important; /* Override gradient from css-pages.css */
  color: var(--text-primary);
  margin: 0;
  min-height: 100vh;
  transition: background 0.3s, color 0.3s;
}

/* Override external CSS file styles that conflict */
html {
  min-height: auto !important;
  height: auto !important;
  background-image: none !important;
  background-attachment: initial !important;
  background-size: initial !important;
}

html, body {
  background-image: none !important;
  background-attachment: initial !important;
  background-size: initial !important;
  min-height: auto !important;
}

/* Fix content container */
.content {
  max-width: none !important;
  margin: 0 !important;
  padding: 0 !important;
  background: transparent !important;
  min-height: auto !important;
}

/* Fix search container */
#search.search {
  background: transparent !important;
  border: none !important;
  padding: 1rem !important;
  box-shadow: none !important;
}

/* Remove any utility classes that might cause issues */
.min-h-screen {
  min-height: auto !important;
}

/* Ensure no hidden elements are taking space */
* {
  box-sizing: border-box !important;
}

/* Reset any grid or flex containers that might be causing issues */
body > *:not(.topnav):not(#search):not(#content):not(script) {
  display: none !important;
}

/* Ensure settings container has proper spacing */
.settings-container {
  max-width: 800px;
  margin: 2rem auto;
  padding: 0 1rem;
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

/* Navigation */
.topnav {
  background: var(--bg-glass);
  box-shadow: 0 2px 12px 0 rgba(0,0,0,0.18);
  border-bottom: 1px solid var(--border-primary);
  padding: 0.7rem 0;
  position: sticky;
  top: 0;
  z-index: 100;
  transition: var(--transition);
  backdrop-filter: blur(12px);
}

.topnav .container {
  display: flex;
  align-items: center;
  justify-content: space-between;
  max-width: 1200px;
  margin: 0 auto;
  width: 100%;
}

.topnav .thinking {
  width: 44px;
  height: 44px;
  border-radius: var(--radius-btn);
}

.rights {
  display: flex;
  gap: 1.2rem;
}

.rights a, .rights button {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 44px;
  height: 44px;
  border-radius: 50%;
  background: var(--bg-card);
  border: 1.5px solid var(--border-primary);
  transition: var(--transition);
  color: var(--text-secondary);
  font-size: 1.2rem;
  cursor: pointer;
}

.rights a:hover, .rights button:hover {
  border-color: var(--accent-primary);
  color: #fff !important;
  background: var(--accent-primary) !important;
  transform: translateY(-2px) scale(1.04);
}

.rights img {
  width: 24px;
  height: 24px;
  filter: none !important;
}

#prodisc {
  border-radius: 50%;
  border: 2px solid var(--accent-primary);
  width: 40px;
  height: 40px;
  object-fit: cover;
  display: block;
}

/* Dropdown */
.dropdown {
  position: relative;
}

.dropbtn {
  padding: 0;
  background: none;
  border: none;
  border-radius: 50%;
  width: 44px;
  height: 44px;
  overflow: hidden;
  display: flex;
  align-items: center;
  justify-content: center;
  transition: box-shadow 0.2s;
}

.dropbtn:focus, .dropbtn:hover {
  box-shadow: 0 0 0 3px var(--accent-primary);
  outline: none;
}

.dropdown-content {
  position: absolute;
  top: 110%;
  right: 0;
  background: var(--bg-card);
  border: 1px solid var(--border-primary);
  border-radius: 8px;
  box-shadow: var(--shadow-lg);
  min-width: 120px;
  z-index: 100;
  opacity: 0;
  visibility: hidden;
  transform: translateY(-10px);
  transition: all 0.2s ease;
  padding: 0.1rem 0;
}

.dropdown-content.show {
  opacity: 1;
  visibility: visible;
  transform: translateY(0);
}

.dropdown-content a {
  display: flex;
  align-items: center;
  gap: 0.4rem;
  padding: 0.32rem 1.2rem 0.32rem 1rem;
  color: var(--text-primary);
  text-decoration: none;
  border-radius: 0;
  width: 100%;
  margin: 0;
  justify-content: flex-start;
  text-align: left;
  background: var(--bg-card);
  border: none;
  font-size: 0.93rem;
  transition: background 0.18s, color 0.18s;
  box-sizing: border-box;
}

.dropdown-content a:first-child {
  border-radius: 8px 8px 0 0;
}

.dropdown-content a:last-child {
  border-radius: 0 0 8px 8px;
}

.dropdown-content a:hover, .dropdown-content a:focus {
  background: var(--accent-primary) !important;
  color: #fff !important;
}

.dropdown-content:not(.show) {
  display: none;
}

/* Modern Search Bar */
.modern-search {
  display: flex;
  align-items: center;
  width: calc(100% - 2rem);
  max-width: 500px;
  margin: 0rem auto 0rem auto;
  background: var(--bg-card);
  border-radius: 9999px;
  box-shadow: var(--shadow-md);
  padding: 0.25rem 0.5rem;
}

.modern-search-input {
  flex: 1;
  background: transparent;
  border: none;
  outline: none;
  color: var(--text-primary);
  font-size: 1rem;
  padding: 0.75rem 1rem;
  border-radius: 9999px;
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Arial, sans-serif;
  min-width: 0;
}

.modern-search-input:focus {
  background: var(--bg-tertiary);
  outline: none;
  box-shadow: none;
}

.modern-search-btn {
  background: var(--accent-primary);
  border: none;
  border-radius: 9999px;
  width: 44px;
  height: 44px;
  display: flex;
  align-items: center;
  justify-content: center;
  margin-left: 0.5rem;
  cursor: pointer;
  transition: background 0.2s;
  flex-shrink: 0;
}

.modern-search-btn:hover, .modern-search-btn:focus {
  background: var(--accent-secondary);
}

.modern-search-btn img {
  width: 22px;
  height: 22px;
  filter: brightness(0) invert(1);
}

/* Settings Page Layout */
.settings-header {
  background: var(--bg-card);
  border-radius: var(--radius-card);
  padding: 2rem;
  margin-bottom: 2rem;
  border: 1px solid var(--border-primary);
  box-shadow: var(--shadow-md);
  text-align: center;
}

.settings-title {
  font-size: 2rem;
  font-weight: 700;
  color: var(--text-primary);
  margin-bottom: 0.5rem;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 0.75rem;
}

.settings-title i {
  font-size: 1.8rem;
  color: var(--accent-primary);
}

.settings-subtitle {
  color: var(--text-secondary);
  font-size: 1rem;
  margin: 0;
}

.settings-grid {
  display: grid;
  grid-template-columns: 1fr;
  gap: 1rem;
}

.settings-card {
  background: var(--bg-card);
  border-radius: var(--radius-card);
  border: 1px solid var(--border-primary);
  overflow: hidden;
  box-shadow: var(--shadow-md);
  transition: var(--transition);
}

.settings-card:hover {
  transform: translateY(-2px);
  box-shadow: var(--shadow-lg);
}

.settings-card a {
  display: flex;
  align-items: center;
  gap: 1rem;
  padding: 1.25rem 1.5rem;
  text-decoration: none;
  color: var(--text-primary);
  transition: var(--transition);
}

.settings-card a:hover {
  background: var(--bg-tertiary);
  color: var(--text-primary);
}

.settings-card.danger a {
  color: var(--accent-danger);
}

.settings-card.danger a:hover {
  background: rgba(224, 36, 94, 0.1);
  color: var(--accent-danger);
}

.settings-icon {
  width: 48px;
  height: 48px;
  border-radius: 12px;
  background: var(--bg-tertiary);
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 1.5rem;
  color: var(--accent-primary);
  flex-shrink: 0;
}

.settings-card.danger .settings-icon {
  color: var(--accent-danger);
  background: rgba(224, 36, 94, 0.1);
}

.settings-info h3 {
  font-size: 1.1rem;
  font-weight: 600;
  margin: 0 0 0.25rem 0;
  color: inherit;
}

.settings-info p {
  font-size: 0.9rem;
  color: var(--text-secondary);
  margin: 0;
  line-height: 1.4;
}

.settings-card.danger .settings-info p {
  color: rgba(224, 36, 94, 0.8);
}

/* Notification Message */
.notifmsg {
  background: var(--accent-primary);
  color: #fff;
  padding: 1rem 1.5rem;
  border-radius: var(--radius-card);
  margin: 1rem 0;
  border-left: 4px solid var(--accent-secondary);
  box-shadow: var(--shadow-md);
}

/* Mobile-specific fixes */
@media (max-width: 768px) {
  html, body {
    min-height: auto !important;
    height: auto !important;
    background: var(--bg-main) !important;
  }
  
  .content {
    min-height: auto !important;
  }
  
  /* Force mobile viewport behavior */
  * {
    min-height: initial !important;
  }
  
  .settings-container {
    padding: 0 0.5rem;
    margin: 1rem auto;
  }
  
  .settings-header {
    padding: 1.5rem;
    margin-bottom: 1.5rem;
  }
  
  .settings-title {
    font-size: 1.75rem;
  }
  
  .settings-title i {
    font-size: 1.5rem;
  }
  
  .settings-card a {
    padding: 1rem;
    gap: 0.75rem;
  }
  
  .settings-icon {
    width: 40px;
    height: 40px;
    font-size: 1.25rem;
  }
  
  .settings-info h3 {
    font-size: 1rem;
  }
  
  .settings-info p {
    font-size: 0.85rem;
  }
  
  .modern-search {
    width: calc(100% - 1rem);
    max-width: none;
    margin: 1rem 0.5rem;
  }
}

@media (max-width: 480px) {
  .modern-search {
    width: calc(100% - 0.5rem);
    margin: 0.5rem 0.25rem;
  }
  
  .modern-search-input {
    font-size: 0.9rem;
    padding: 0.5rem 0.6rem;
  }
  
  .modern-search-btn {
    width: 32px;
    height: 32px;
  }
  
  .modern-search-btn img {
    width: 18px;
    height: 18px;
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
			
<body>
<!-- Modern App-Style Navigation Bar -->
<nav class="topnav" id="myTopnav" role="navigation" aria-label="Main Navigation">
  <div class="container">
    <a href="index.jsp" aria-label="Home">
      <img class="thinking" src="icon/p&c.png" alt="P&C Logo" />
    </a>
    <div class="rights" id="royal">
      <a href="index.jsp" title="Home" aria-label="Home">
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
<div id="search" class="search" style="background: transparent; box-shadow: none; border: none;">
  <form name="frm" action="search-user.jsp" method="POST" autocomplete="off">
    <div class="input-container modern-search">
      <input class="input-field modern-search-input" type="text" name="srchtxt" style="margin-bottom: 0px;" placeholder="Search Profiles" maxlength="50" required aria-label="Search Profiles" />
      <input type="hidden" name="csrf" value="<%=db.csrftoken()%>">
      <button class="modern-search-btn" type="submit" aria-label="Search">
        <img src="icon/searchbutton.png" alt="Search" />
      </button>
    </div>
  </form>
</div>

<div id="content" class="content">
  <div class="settings-container">
    <!-- Settings Header -->
    <div class="settings-header">
      <h1 class="settings-title">
        <i class="fa-solid fa-gear"></i>
        Settings
      </h1>
      <p class="settings-subtitle">Manage your account preferences and profile settings</p>
    </div>

	<%
	try
	{
		String msg=session.getAttribute("msg").toString();
      out.print("<div class='notifmsg'>"+msg+"</div>");
		session.removeAttribute("msg");
	} catch (Exception ex){}
	%>

    <!-- Settings Grid -->
    <div class="settings-grid">
      <div class="settings-card">
        <a href="update-profile-picture.jsp">
          <div class="settings-icon">
            <i class="fa-solid fa-camera"></i>
          </div>
          <div class="settings-info">
            <h3>Profile Picture</h3>
            <p>Update your profile picture to help colleagues recognize you</p>
          </div>
        </a>
      </div>

      <div class="settings-card">
        <a href="update-background-picture.jsp">
          <div class="settings-icon">
            <i class="fa-solid fa-image"></i>
          </div>
          <div class="settings-info">
            <h3>Background Picture</h3>
            <p>Customize your profile with a personal background image</p>
          </div>
        </a>
      </div>

      <div class="settings-card">
        <a href="update-information.jsp">
          <div class="settings-icon">
            <i class="fa-solid fa-user-edit"></i>
          </div>
          <div class="settings-info">
            <h3>Profile Information</h3>
            <p>Edit your bio, work details, and personal information</p>
          </div>
        </a>
      </div>

      <div class="settings-card">
        <a href="advertisements.jsp">
          <div class="settings-icon">
            <i class="fa-solid fa-bullhorn"></i>
          </div>
          <div class="settings-info">
            <h3>Advertisements</h3>
            <p>Promote your content and reach more colleagues</p>
          </div>
        </a>
      </div>

      <div class="settings-card">
        <a href="about-us.jsp">
          <div class="settings-icon">
            <i class="fa-solid fa-info-circle"></i>
          </div>
          <div class="settings-info">
            <h3>About P&C</h3>
            <p>Learn more about People & Culture and our rating system</p>
          </div>
        </a>
      </div>

      <div class="settings-card">
        <a href="support.jsp">
          <div class="settings-icon">
            <i class="fa-solid fa-life-ring"></i>
          </div>
          <div class="settings-info">
            <h3>Support</h3>
            <p>Get help, report issues, and connect with our community</p>
          </div>
        </a>
      </div>

      <div class="settings-card danger">
        <a href="deleteacc.jsp" onclick="return confirm('Are you sure you want to delete your account?');">
          <div class="settings-icon">
            <i class="fa-solid fa-trash-alt"></i>
          </div>
          <div class="settings-info">
            <h3>Delete Account</h3>
            <p>Permanently delete your account and all associated data</p>
          </div>
        </a>
	</div>
	
      <div class="settings-card">
        <a href="logout.jsp">
          <div class="settings-icon">
            <i class="fa-solid fa-sign-out-alt"></i>
          </div>
          <div class="settings-info">
            <h3>Logout</h3>
            <p>Sign out of your P&C account securely</p>
          </div>
        </a>
      </div>
    </div>
	</div>
	</div>

<script type="text/javascript">
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
if (currentTheme === 'light') {
  if (!document.body.classList.contains('dark-mode')) {
    document.body.classList.add('dark-mode');
  }
  darkModeIcon.className = 'fa-solid fa-sun';
  // Set HTML background for light mode with important flag
  document.documentElement.style.setProperty('background-color', '#fff', 'important');
  document.documentElement.style.setProperty('background', '#fff', 'important');
} else {
  if (document.body.classList.contains('dark-mode')) {
    document.body.classList.remove('dark-mode');
  }
  darkModeIcon.className = 'fa-solid fa-moon';
  // Set HTML background for dark mode with important flag
  document.documentElement.style.setProperty('background-color', '#18181b', 'important');
  document.documentElement.style.setProperty('background', '#18181b', 'important');
}

darkModeToggle.onclick = function() {
  document.body.classList.toggle('dark-mode');
  
  let theme;
  if(document.body.classList.contains('dark-mode')) {
    darkModeIcon.className = 'fa-solid fa-sun';
    theme = 'light';
    // Update HTML background for light mode with important flag
    document.documentElement.style.setProperty('background-color', '#fff', 'important');
    document.documentElement.style.setProperty('background', '#fff', 'important');
  } else {
    darkModeIcon.className = 'fa-solid fa-moon';
    theme = 'dark';
    // Update HTML background for dark mode with important flag
    document.documentElement.style.setProperty('background-color', '#18181b', 'important');
    document.documentElement.style.setProperty('background', '#18181b', 'important');
  }
  
  localStorage.setItem('theme', theme);
};
</script>
	
	<%
	} catch(Exception ex) {
		response.sendRedirect("index.jsp");
		System.out.print(ex+"at settings.jsp");
		}
	%>

	</body>
	</html>