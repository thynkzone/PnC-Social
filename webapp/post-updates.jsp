<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.thynkzone.jsp.*" %>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
	<head>
	<link rel="icon" href="icon/favicon.ico" type="image/x-icon">
<title>Post Updates - P&C (People & Culture)</title>
<meta charset="UTF-8">
<meta name="description" content="P&C (People & Culture) is the place to share your ideas with the world. It's a free community for innovators, entrepreneurs, and thinkers."/>
<meta name="keywords" content="P&C,People & Culture,pc app,social,social networking websites,share,thoughts,projects,ideas,pc ideas,inspire,prioritize,make friends,co-workers"/>
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
  --text-primary: #fff;
  --text-secondary: #b0b3b8;
  --text-muted: #888;
  --border-primary: #2c2f36;
  --shadow-md: 0 2px 12px 0 rgba(0,0,0,0.18);
  --shadow-lg: 0 8px 32px 0 rgba(0,0,0,0.25);
  --transition: all 0.2s cubic-bezier(.4,0,.2,1);
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

.dark-mode {
  --bg-main: #fff;
  --bg-card: rgba(255,255,255,0.85);
  --bg-glass: rgba(255,255,255,0.65);
  --bg-tertiary: #f3f4f6;
  --accent-primary: #1da1f2;
  --accent-secondary: #0a8cd8;
  --accent-danger: #e0245e;
  --accent-success: #10b981;
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

/* Modern tab navigation */
.tab-navigation {
  max-width: 800px;
  margin: 0.5rem auto 1.5rem auto;
  background: var(--bg-card);
  border-radius: 16px;
  padding: 0.5rem;
  box-shadow: var(--shadow-md);
  border: 1px solid var(--border-primary);
}

.tab-nav-list {
  display: flex;
  list-style: none;
  margin: 0;
  padding: 0;
  gap: 0.5rem;
}

.tab-nav-item {
  flex: 1;
}

.tab-nav-link {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 0.5rem;
  padding: 0.75rem 1rem;
  text-decoration: none;
  color: var(--text-secondary);
  border-radius: 12px;
  transition: var(--transition);
  font-weight: 500;
  font-size: 0.95rem;
}

.tab-nav-link:hover {
  background: var(--bg-tertiary);
  color: var(--text-primary);
}

.tab-nav-link.active {
  background: var(--accent-primary);
  color: #fff;
}

.tab-nav-icon {
  width: 20px;
  height: 20px;
  filter: brightness(0) invert(1);
  transition: var(--transition);
}

.tab-nav-link.active .tab-nav-icon {
  filter: brightness(0) invert(1);
}

/* Make tab icons adapt to theme */
.dark-mode .tab-nav-icon {
  filter: brightness(0) invert(0);
}

.dark-mode .tab-nav-link.active .tab-nav-icon {
  filter: brightness(0) invert(1);
}

/* Page header */
.page-header {
  max-width: 600px;
  margin: 1.5rem auto;
  background: var(--bg-card);
  border-radius: 16px;
  padding: 1.5rem;
  border: 1px solid var(--border-primary);
  box-shadow: var(--shadow-md);
  text-align: center;
  backdrop-filter: blur(10px);
}

.page-title {
  font-size: 1.4rem;
  font-weight: 600;
  color: var(--text-primary);
  margin-bottom: 0.4rem;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 0.6rem;
}

.page-title i {
  font-size: 1.2rem;
  color: var(--accent-primary);
}

.page-subtitle {
  color: var(--text-secondary);
  font-size: 0.95rem;
  line-height: 1.5;
  font-weight: 400;
}

/* Responsive page headers */
@media (max-width: 768px) {
  .page-header {
    margin: 1rem;
    padding: 1rem;
  }
  
  .page-title {
    font-size: 1.2rem;
  }
  
  .page-title i {
    font-size: 1rem;
  }
  
  .page-subtitle {
    font-size: 0.85rem;
  }
}

/* Notifications section */
.notifications-section {
  max-width: 800px;
  margin: 2rem auto;
  background: var(--bg-card);
  border-radius: 16px;
  padding: 2rem;
  border: 1px solid var(--border-primary);
  box-shadow: var(--shadow-md);
}

.notification-item {
  display: flex;
  align-items: center;
  gap: 1rem;
  padding: 1rem;
  border-radius: 12px;
  margin-bottom: 0.75rem;
  border: 1px solid var(--border-primary);
  background: var(--bg-tertiary);
  transition: var(--transition);
  text-decoration: none;
  color: var(--text-primary);
}

.notification-item:hover {
  transform: translateY(-2px);
  box-shadow: var(--shadow-md);
  border-color: var(--accent-primary);
  color: var(--text-primary);
}

.notification-icon {
  width: 40px;
  height: 40px;
  background: var(--accent-primary);
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  color: #fff;
  font-size: 1.1rem;
  flex-shrink: 0;
}

.notification-icon.love {
  background: var(--accent-danger);
}

.notification-icon.haha {
  background: var(--accent-success);
}

.notification-icon.comment {
  background: var(--accent-secondary);
}

.notification-icon.ad {
  background: var(--accent-success);
}

.notification-content {
  flex: 1;
  min-width: 0;
}

.notification-text {
  font-size: 1rem;
  color: var(--text-primary);
  margin-bottom: 0.25rem;
  line-height: 1.4;
}

.notification-time {
  font-size: 0.85rem;
  color: var(--text-secondary);
}

.empty-state {
  text-align: center;
  padding: 3rem;
  color: var(--text-secondary);
}

.empty-state h3 {
  font-size: 1.3rem;
  margin-bottom: 0.5rem;
  color: var(--text-primary);
}

.empty-state p {
  font-size: 1rem;
  margin-bottom: 1.5rem;
}

.end-message {
  text-align: center;
  padding: 2rem;
  color: var(--text-secondary);
  font-style: italic;
  margin-top: 2rem;
}

@media (max-width: 768px) {
  .tab-nav-link {
    font-size: 0.85rem;
    padding: 0.6rem 0.8rem;
  }
  
  .tab-nav-icon {
    width: 16px;
    height: 16px;
  }
  
  .notification-item {
    padding: 0.75rem;
  }
  
  .notification-text {
    font-size: 0.9rem;
  }
  
  .notification-time {
    font-size: 0.8rem;
  }
  
  .notification-icon {
    width: 32px;
    height: 32px;
    font-size: 1rem;
  }
  
  .empty-state h3 {
    font-size: 1.2rem;
  }
  
  .empty-state p {
    font-size: 0.9rem;
  }
  
  .end-message {
    font-size: 0.85rem;
    padding: 1.5rem;
  }
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

@media (max-width: 768px) {
  .modern-search {
    width: calc(100% - 1rem);
    max-width: none;
    margin: 1rem 0.5rem;
  }
  
  .modern-search-input {
    font-size: 0.95rem;
    padding: 0.6rem 0.8rem;
  }
  
  .modern-search-btn {
    width: 38px;
    height: 38px;
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
      <a class="topaa" href="index.jsp" title="Home" aria-label="Home">
        <i class="fa-solid fa-house"></i>
      </a>
      <a href="following.jsp" title="Co-workers &amp; Followers" aria-label="Co-workers &amp; Followers">
        <i class="fa-solid fa-user-group"></i>
      </a>
      <a href="post-updates.jsp" class="active" title="Notifications" aria-label="Notifications">
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
  <!-- Modern Tab Navigation -->
  <nav class="tab-navigation">
    <ul class="tab-nav-list">
      <li class="tab-nav-item">
        <a href="post-updates.jsp" class="tab-nav-link active">
          <img src="icon/one.png" alt="" class="tab-nav-icon"/>
          <span style="white-space:nowrap;overflow:hidden;text-overflow:ellipsis;display:inline-block;max-width:90px;">Post Updates</span>
        </a>
      </li>
      <li class="tab-nav-item">
        <a href="friends-and-fans-updates.jsp" class="tab-nav-link">
          <img src="icon/two.png" alt="" class="tab-nav-icon"/>
          <span style="white-space:nowrap;overflow:hidden;text-overflow:ellipsis;display:inline-block;max-width:90px;">Co-workers & Followers</span>
        </a>
      </li>
    </ul>
  </nav>

  <!-- Page Header -->
  <div class="page-header">
    <h1 class="page-title">
      <i class="fa-solid fa-bell" style="color: var(--accent-primary);"></i>
      Post Updates
    </h1>
    <p class="page-subtitle">Stay updated with interactions on your posts</p>
  </div>

  <!-- Notifications Section -->
  <div class="notifications-section">
		
			<%
			
			Connection conn=null;
			ResultSet rs=null;
			PreparedStatement pstmt = null;

			
			Class.forName(db.name());
			String unamef = db.uname().concat("i");
			String passf = db.pass().concat("09");
			conn=(Connection)DriverManager.getConnection(db.urlth(),unamef,passf);
				
			
			String yourfullname = null;
			String yourpp = null;
			String posterid = null;
			int postfor;
			int mylink;
			String liker;
			int liketype;
			String postid;
			int i = -1;
			boolean hasNotifications = false;

			
			// Check for ads
			String qry="select * from ads WHERE posterid =?";
			pstmt = conn.prepareStatement(qry, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			pstmt.setString(1, ix);
			rs=pstmt.executeQuery();
			
			while(rs.absolute(i)) {
				if (rs.getInt(12) == 1) {
					hasNotifications = true;
					postid = rs.getString(2);
			%>
			<a href="advertisements.jsp" class="notification-item">
				<div class="notification-icon ad">
					<i class="fa-solid fa-bullhorn"></i>
				</div>
				<div class="notification-content">
					<div class="notification-text">Your Ad is running now!</div>
					<div class="notification-time"><%=db.timecon(ix, rs.getString(10))%></div>
				</div>
			</a>
			<%
				}
				i--;
			}
			
			// Check for post interactions
			qry="select * from notif WHERE posterid =?";
			pstmt = conn.prepareStatement(qry, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			pstmt.setString(1, ix);
			rs=pstmt.executeQuery();
			i = -1;
			
			while(rs.absolute(i))
			{	
				hasNotifications = true;
				liker = rs.getString(3);
				if (rs.getString(2).equals(ix)) {
					liker = "You";
				}
				liketype = rs.getInt(6);
				postid = rs.getString(4);
				if (liketype == 1) {
					%>
					<a href="profile.jsp?userId=<%=ix%>#<%=postid%>" class="notification-item">
						<div class="notification-icon haha">
							<i class="fa-solid fa-face-laugh"></i>
						</div>
						<div class="notification-content">
							<div class="notification-text"><%=liker%> reacted "Haha" to your post.</div>
							<div class="notification-time"><%=db.timecon(ix, rs.getString(8))%></div>
						</div>
					</a>
					<%
				}
				else if (liketype == 2) {
					%>
					<a href="profile.jsp?userId=<%=ix%>#<%=postid%>" class="notification-item">
						<div class="notification-icon love">
							<i class="fa-solid fa-heart"></i>
						</div>
						<div class="notification-content">
							<div class="notification-text"><%=liker%> reacted "Love" to your post.</div>
							<div class="notification-time"><%=db.timecon(ix, rs.getString(8))%></div>
						</div>
					</a>
					<%
				}
				else if (liketype == 3) {
					%>
					<a href="profile.jsp?userId=<%=ix%>#<%=postid%>" class="notification-item">
						<div class="notification-icon comment">
							<i class="fa-solid fa-comment"></i>
						</div>
						<div class="notification-content">
							<div class="notification-text"><%=liker%> commented on your post.</div>
							<div class="notification-time"><%=db.timecon(ix, rs.getString(8))%></div>
						</div>
					</a>
					<%
				}
				i--;
			}
			
			if (!hasNotifications) {
			%>
				<div class="empty-state">
					<h3>No Updates Yet</h3>
					<p>You'll see notifications here when people interact with your posts.</p>
					<p>Start sharing your thoughts and ideas to get engagement!</p>
				</div>
			<%
			} else {
			%>
				<div class="end-message">
					That's all the updates we have from your posts.
				</div>
			<%
			}
			
			   } catch(Exception ex) {
				   response.sendRedirect("index.jsp");
				   System.out.print(ex+"at post-updates.jsp");
		}
	%>
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
  // Set HTML background for light mode
  document.documentElement.style.backgroundColor = '#fff';
} else {
  if (document.body.classList.contains('dark-mode')) {
    document.body.classList.remove('dark-mode');
  }
  darkModeIcon.className = 'fa-solid fa-moon';
  // Set HTML background for dark mode
  document.documentElement.style.backgroundColor = '#18181b';
}

darkModeToggle.onclick = function() {
  document.body.classList.toggle('dark-mode');
  
  let theme;
  if(document.body.classList.contains('dark-mode')) {
    darkModeIcon.className = 'fa-solid fa-sun';
    theme = 'light';
    // Update HTML background for light mode
    document.documentElement.style.backgroundColor = '#fff';
  } else {
    darkModeIcon.className = 'fa-solid fa-moon';
    theme = 'dark';
    // Update HTML background for dark mode
    document.documentElement.style.backgroundColor = '#18181b';
  }
  
  localStorage.setItem('theme', theme);
};
</script>

</body>
</html>
