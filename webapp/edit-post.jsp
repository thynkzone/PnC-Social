<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.thynkzone.jsp.*" %>
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
	<link rel = "stylesheet" type = "text/css" href = "css-pages.css"> 
	<link rel="preconnect" href="https://fonts.googleapis.com"> 
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin> 
	<link rel="preload" href="https://fonts.googleapis.com/css2?family=Oswald:wght@400;700&family=Poppins&display=swap" as ="style" crossorigin> 
	<link href="https://fonts.googleapis.com/css2?family=Oswald:wght@400;700&family=Poppins&display=swap" rel="stylesheet" crossorigin> 
	<link rel="preload" as="image" href="icon/p&c.png"> 
	<link rel="preload" as="image" href="icon/home.png"> 
	<link rel="preload" as="image" href="icon/thynkmates-and-fans.png"> 
	<link rel="preload" as="image" href="icon/notifications.png"> 
	<link rel="preload" as="image" href="icon/drop-settings.png"> 
	<link rel="preload" as="image" href="icon/more.png"> 
	<link rel="preload" as="image" href="icon/searchbutton.png"> 
	<link rel="preload" as="image" href="icon/posts-settings.png"> 
	<link rel="preload" as="image" href="icon/unprioritized.png"> 
	<link rel="preload" as="image" href="icon/neutral.png"> 
	<link rel="preload" as="image" href="icon/comments.png"> 
	<link rel="preload" as="image" href="icon/prioritized.png"> 
	<link rel="preload" as="image" href="icon/inspired.png">
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

/* Post creation card modernized */
.frmdsgn {
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
.createapost {
  display: flex;
  align-items: center;
  gap: 0.7rem;
  font-size: 1.35rem;
  font-weight: 700;
  color: var(--text-primary);
  margin-bottom: 1.2rem;
}
.createapost img {
  width: 28px;
  height: 28px;
  filter: brightness(0) invert(1);
}
.writehere {
  gap: 1.5rem;
  margin-bottom: 1.5rem;
  display: flex;
  align-items: flex-start;
}
.usernameandpp {
  display: flex;
  align-items: center;
  gap: 0.7rem;
  text-decoration: none;
  color: var(--text-primary);
  font-weight: 600;
  margin-bottom: 0.7rem;
}
.usernameandpp img {
  width: 52px;
  height: 52px;
  border-radius: 50%;
  object-fit: cover;
  border: 2px solid var(--accent-primary);
}
.usernameandpp span {
  font-size: 1.15rem;
  font-weight: 700;
  margin-left: 0.5rem;
}
/* Floating label for textarea */
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
/* Drag and drop image upload */
.drag-drop-area {
  border: 2px dashed var(--accent-primary);
  border-radius: 10px;
  background: var(--bg-tertiary);
  padding: 1.2rem;
  text-align: center;
  color: var(--text-secondary);
  margin-bottom: 1rem;
  transition: border 0.2s, background 0.2s;
  cursor: pointer;
}
.drag-drop-area.dragover {
  border-color: var(--accent-secondary);
  background: var(--bg-card);
}
.drag-drop-area img {
  max-width: 100%;
  max-height: 180px;
  margin-top: 0.7rem;
  border-radius: 8px;
  box-shadow: var(--shadow-md);
}
.submit-btn {
  background: var(--accent-primary);
  color: #fff;
  border: none;
  padding: 0.85rem 2.5rem;
  border-radius: 10px;
  font-weight: 700;
  font-size: 1.13rem;
  cursor: pointer;
  transition: var(--transition);
    margin-top: 1rem;
}
.submit-btn:hover {
  background: var(--accent-secondary);
  transform: translateY(-2px) scale(1.04);
}

/* Privacy dropdown styles */
.modern-dropdown-group {
  position: relative;
}

.modern-dropdown-menu {
  position: absolute;
  top: 100%;
  right: 0;
  background: var(--bg-card);
  border: 1px solid var(--border-primary);
  border-radius: 12px;
  box-shadow: var(--shadow-lg);
  padding: 1rem;
  min-width: 200px;
  z-index: 1000;
  margin-top: 0.5rem;
}

.modern-dropdown-section {
  margin-bottom: 1rem;
}

.modern-dropdown-section:last-child {
  margin-bottom: 0;
}

.modern-dropdown-label {
  font-size: 0.85rem;
  font-weight: 600;
  color: var(--text-secondary);
  margin-bottom: 0.5rem;
  text-transform: uppercase;
  letter-spacing: 0.5px;
}

.modern-dropdown-select {
  width: 100%;
  padding: 0.5rem 0.75rem;
  border: 1px solid var(--border-primary);
  border-radius: 8px;
  background: var(--bg-tertiary);
  color: var(--text-primary);
  font-size: 0.9rem;
  transition: var(--transition);
}

.modern-dropdown-select:focus {
  outline: none;
  border-color: var(--accent-primary);
  box-shadow: 0 0 0 2px rgba(29, 161, 242, 0.1);
}

.submit-icon-btn {
  background: var(--accent-primary);
  color: #fff;
  border: none;
  border-radius: 50%;
  width: 44px;
  height: 44px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 1.1rem;
  cursor: pointer;
  transition: var(--transition);
  box-shadow: var(--shadow-md);
}

.submit-icon-btn:hover {
  background: var(--accent-secondary);
  transform: translateY(-1px) scale(1.05);
}

.form-center-wrapper {
  display: flex;
  justify-content: center;
  width: 100%;
}

/* Page Header Styling */
.page-header {
  text-align: center;
  padding: 1.5rem;
  background: var(--bg-card);
  border: 1px solid var(--border-primary);
  border-radius: 16px;
  box-shadow: var(--shadow-md);
  max-width: 480px;
  width: 100%;
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

/* Previous image section styling */
.previous-image-section {
  margin-top: 2rem;
  padding-top: 2rem;
  border-top: 1px solid var(--border-primary);
}

.section-title {
font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Arial, sans-serif;  font-size: 1.1rem;
  font-weight: 600;
  color: var(--text-primary);
  margin-bottom: 1rem;
  text-align: center;
}

.image-preview-container {
  width: 100%;
  background: var(--bg-tertiary);
  border: 1px solid var(--border-primary);
  border-radius: 12px;
  padding: 1rem;
  margin-bottom: 1.5rem;
  text-align: center;
}

.previous-image {
  max-width: 100%;
  max-height: 300px;
  border-radius: 8px;
  box-shadow: var(--shadow-md);
}

/* Fix fonts throughout the form */
.frmdsgn {
font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Arial, sans-serif;}

.floating-label textarea {
font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Arial, sans-serif;}

.floating-label label {
font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Arial, sans-serif;}

.modern-dropdown-select {
font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Arial, sans-serif;}

.modern-dropdown-label {
font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Arial, sans-serif;}

.usernameandpp span {
font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Arial, sans-serif;}

.main-center-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: flex-start;
  min-height: 100vh;
  padding: 2.5rem 1rem 2rem 1rem;
}
.edit-card {
  margin: 2rem 0 1.5rem 0;
  max-width: 600px;
  width: 100%;
  background: var(--bg-card);
  border-radius: 16px;
  box-shadow: var(--shadow-md);
  padding: 1.5rem 1.2rem 1.2rem 1.2rem;
  border: 1px solid var(--border-primary);
  overflow: hidden;
}
.edit-card h2 {
  font-size: 1.15rem;
  font-weight: 600;
  color: var(--accent-primary);
  text-align: center;
  margin-bottom: 1.2rem;
}
.input-field {
  width: 100%;
  padding: 0.75rem 1rem;
  border-radius: 25px;
  border: none;
  color: var(--text-primary);
  font-size: 1rem;
  font-family: inherit;
  transition: box-shadow 0.2s;
  margin-bottom: 1.2rem;
  box-shadow: none;
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
  transition: background 0.2s;
  margin-top: 0.5rem;
  box-shadow: var(--shadow-md);
  width: 100%;
  display: block;
}
.button:hover {
  background: var(--accent-secondary);
  color: #fff;
}
.textarea-field {
  width: 100%;
  padding: 0.75rem 1rem;
  border-radius: 12px;
  border: none;
  background: var(--bg-main);
  color: var(--text-primary);
  font-size: 1rem;
  font-family: inherit;
  transition: box-shadow 0.2s;
  margin-bottom: 1.2rem;
  box-shadow: none;
  resize: vertical;
  min-height: 120px;
}
.textarea-field:focus {
  outline: 2px solid var(--accent-primary);
  background: var(--bg-glass);
}
.info-box {
  max-width: 600px;
  margin: 1.5rem auto 0 auto;
  color: var(--text-secondary);
  font-size: 0.98rem;
  background: var(--bg-glass);
  border-radius: 10px;
  padding: 1rem 1.2rem;
  text-align: center;
}
@media (max-width: 500px) {
  .edit-card, .info-box {
    max-width: 98vw;
    padding: 0.8rem 0.5rem;
    border-radius: 10px;
  }
  .main-center-container {
    padding: 1.2rem 0.2rem 1.2rem 0.2rem;
  }
}
.titletags {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Arial, sans-serif;  font-weight: 600;
  font-size: 1.4em;
  margin: 0 auto 1rem auto;
  padding: 0;
  color: var(--text-primary);
  text-align: center;
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
	<div id="search" class="search" style="background: transparent; box-shadow: none; border: none;">
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
	
	<div class="main-center-container">
    
    <!-- Page Header -->
    <div class="page-header">
      <h1 class="page-title"><i class="fa-solid fa-edit"></i> Edit this Post</h1>
    </div>
    
    <%
    try {
      String msg=session.getAttribute("msg").toString();
      out.print("<p class = 'notifmsg'>"+msg+"</p>");
      session.removeAttribute("msg");
    } catch (Exception ex){}
    %>
    
    <%
    Connection conn=null;
    ResultSet rs=null;
    PreparedStatement pstmt = null;

    Class.forName(db.name());
    String unamef = db.uname().concat("i");
    String passf = db.pass().concat("09");
    conn=(Connection)DriverManager.getConnection(db.urlth(),unamef,passf);
    
    String x = null;
    String y = null;
    int posttype = 0;
    int privacy = 0;
    String posttext = null;
    String yourpostp = null;
    String imdir = null;
    String timewas = null;
    
    String token = request.getParameter("csrf");
    if (db.verifycsrftoken(token)) {
      x = antisamy.safe(request.getParameter("caxes"));
      y = antisamy.safe(request.getParameter("caxes2"));
      String postid = x.substring(3);
      String posterid = y.substring(3);
      
      if (x != null && y != null && ix.equals(posterid)) {
        String qry="select * from posts WHERE posterid =? AND postid =?";
        pstmt = conn.prepareStatement(qry, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        pstmt.setString(1, ix);
        pstmt.setString(2, postid);
        rs=pstmt.executeQuery();
        
        while(rs.next()) {
          posterid = rs.getString(2);
          postid = rs.getString(4);
          posttype = rs.getInt(7);
          privacy = rs.getInt(8);
          timewas = rs.getString(9);
          posttext = base64.de(rs.getString(5));
          yourpostp = rs.getString(6);
          if (yourpostp != null) {
            imdir = "img/".concat(yourpostp);
          }
        }
    %>
    
    <div id="prog" class="modern-spinner" style="margin: auto; margin-bottom: 10px; width: 64px; height: 64px; display: none;"></div>
    
    <div class="form-center-wrapper">
        <form class="frmdsgn" name="frm" action="postproedit.jsp" method="POST" enctype="multipart/form-data" style="position: relative; padding: 1.2rem 1rem; max-width: 500px; width: 100%;">
        <button type="button" class="privacy-icon-btn" id="privacyDropdownBtn"
          aria-haspopup="true" aria-expanded="false"
          onclick="togglePrivacyDropdown(event)" title="Privacy"
          style="position: absolute; top: 1rem; right: 1rem;">
          <i class="fa-solid fa-user-shield"></i>
        </button>
        <div class="modern-dropdown-group">
          <div class="modern-dropdown-menu" id="privacyDropdownMenu" role="menu" aria-labelledby="privacyDropdownBtn" style="display:none;">
            <div class="modern-dropdown-section">
              <div class="modern-dropdown-label">Post Category</div>
              <select class="modern-dropdown-select" name="pstcat" required>
                <option value="1" id="onecat">Meme</option>
                <option value="2" id="twocat">Fact</option>
                <option value="3" id="threecat">Update</option>
              </select>
            </div>
            <div class="modern-dropdown-section">
              <div class="modern-dropdown-label">Privacy</div>
              <select class="modern-dropdown-select" name="privacy" required>
                <option value="3" id="onepri">Co-workers &amp; Followers</option>
                <option value="2" id="twopri">Co-workers</option>
                <option value="1" id="threepri">Followers</option>
              </select>
            </div>
          </div>
        </div>
        <a class="usernameandpp" href="profile.jsp?userId=<%=ix%>" style="display: flex; align-items: center; margin-bottom: 1rem;">
          <img id="disc" src="<%=psmall%>" alt="Profile Picture" style="width: 38px; height: 38px;"/>
          <span style="font-size: 0.98rem; font-weight: 600; margin-left: 0.5rem;"><%=pname%></span>
        </a>
        <div style="display: flex; gap: 0.7rem; align-items: flex-start; margin-bottom: 0.2rem;">
          <div class="floating-label" style="flex: 1;">
            <textarea id="postboxtext" class="input-field" name="text" placeholder=" " maxlength="2000" required aria-label="Post text" style="min-height: 100px; font-size: 1rem; padding: 0.7rem 1.5rem;"><%=posttext%></textarea>
            <label for="postboxtext" style="font-size: 0.97rem;">What are you thinking, <%=pname%>?</label>
          </div>
        </div>
        <div class="drag-drop-area" id="dragDropArea" style="margin-bottom: 0.7rem; padding: 0.7rem; font-size: 0.97rem; display: flex; align-items: center; gap: 0.6rem;">
          <i class="fa-regular fa-image" style="font-size: 1.15rem; color: var(--accent-primary);"></i>
          <span id="dragDropText">Add a photo</span>
          <input id="file-input" class="input-field" type="file" name="pp" accept="image/x-png,image/gif,image/jpeg" style="display:none;" onchange="loadFile(event)">
          <img id="output" style="display:none; margin: 0 auto; max-width: 100%; max-height: 120px; border-radius: 8px; box-shadow: var(--shadow-md);"/>
        </div>
        <div style="display: flex; align-items: center; justify-content: flex-end; gap: 0.7rem;">
          <button id="dn" class="submit-icon-btn" type="submit" title="Submit">
            <i class="fa-solid fa-paper-plane"></i>
          </button>
        </div>
        
        <% if (imdir != null) {%>
        <input type = "hidden" name = "previmgurl" value = "<%=imdir%>">
        <%}%>
        <input type = "hidden" name = "prevposterid" value = "<%=posterid%>">
        <input type = "hidden" name = "prevpostid" value = "<%=postid%>">
        
        <% if (imdir != null) {%>
        <div class="previous-image-section">
          <h6 class="section-title">Previously attached image with post</h6>
          <div class="image-preview-container">
            <img src="<%=imdir%>" alt="Previous post image" class="previous-image"/>
          </div>
        </div>
        <%}%>
        
        <input type="hidden" name="csrf" value="<%=db.csrftoken()%>">
        </form>
    </div>

    <script type="text/javascript">
	var cat = parseInt('<%=posttype%>');
	if (cat === 1) {
		document.getElementById("onecat").selected = true;
	}
	else if (cat === 2) {
		document.getElementById("twocat").selected = true;	
	}
	else if (cat === 3) {
		document.getElementById("threecat").selected = true;	
	}
	</script>
	
	<script type="text/javascript">
	var pri = parseInt('<%=privacy%>');
	if (pri === 3) {
		document.getElementById("onepri").selected = true;
	}
	else if (pri === 2) {
		document.getElementById("twopri").selected = true;	
	}
	else if (pri === 1) {
		document.getElementById("threepri").selected = true;	
	}
	</script>
	
	<script type="text/javascript">
			document.getElementById("dn").onclick = function() {progbar()};
			
			function progbar()
			{
				var prog = document.getElementById("prog");
				var postboxtext = document.getElementById("postboxtext").value;
				
				
				  if (postboxtext.length > 0) {
					  prog.style.display = "block";
				  } else {
					  prog.style.display = "none";
				  }
			}
	</script>
	
	<script type="text/javascript">
function togglePrivacyDropdown(event) {
  event.stopPropagation();
  var dropdown = document.getElementById('privacyDropdownMenu');
  var button = document.getElementById('privacyDropdownBtn');
  var expanded = button.getAttribute('aria-expanded') === 'true';
  button.setAttribute('aria-expanded', !expanded);
  if (dropdown.style.display === 'block') {
    dropdown.style.display = 'none';
  } else {
    dropdown.style.display = 'block';
  }
}
// Close privacy dropdown on outside click
window.addEventListener('click', function(e) {
  var dropdown = document.getElementById('privacyDropdownMenu');
  var button = document.getElementById('privacyDropdownBtn');
  if (dropdown && dropdown.style.display === 'block') {
    if (!dropdown.contains(e.target) && !button.contains(e.target)) {
      dropdown.style.display = 'none';
      button.setAttribute('aria-expanded', 'false');
    }
  }
});
</script>

<script>
// Image preview functionality - exactly like index.jsp
const dragDropArea = document.getElementById('dragDropArea');
const fileInput = document.getElementById('file-input');
const output = document.getElementById('output');
const dragDropText = document.getElementById('dragDropText');

function loadFile(event) {
  var output = document.getElementById('output');
  var dragDropText = document.getElementById('dragDropText');
  output.src = URL.createObjectURL(event.target.files[0]);
  output.style.display = "block";
  dragDropText.style.display = "none";
  output.onload = function() {
    URL.revokeObjectURL(output.src);
  }
}

// Drag and drop image upload
dragDropArea.addEventListener('click', () => fileInput.click());
dragDropArea.addEventListener('dragover', (e) => {
  e.preventDefault();
  dragDropArea.classList.add('dragover');
});
dragDropArea.addEventListener('dragleave', (e) => {
  e.preventDefault();
  dragDropArea.classList.remove('dragover');
});
dragDropArea.addEventListener('drop', (e) => {
  e.preventDefault();
  dragDropArea.classList.remove('dragover');
  if(e.dataTransfer.files && e.dataTransfer.files[0]) {
    fileInput.files = e.dataTransfer.files;
    loadFile({target: {files: e.dataTransfer.files}});
  }
});
</script>
	
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
	
	
	<%			
			}
			
			} else {
				//invalid csrf
				response.sendRedirect("index.jsp");
				session.setAttribute("msg", "Attempt unsuccessful");
				return;
			}
			
			} catch(Exception ex) {
				response.sendRedirect("index.jsp");
				System.out.print(ex+"at edit-post.jsp");
		}
	%>
	
	</div>
	</body>
	</html>
				
				
				
				