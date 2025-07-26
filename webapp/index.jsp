<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.thynkzone.jsp.*" %>
<%@ page import="java.util.HashSet" %>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
	<html lang = "en">
	<head>
	<link rel="icon" href="icon/favicon.ico" type="image/x-icon">
	<title>P&C (People & Culture)</title>
	<meta charset = "UTF-8">
	<meta name="description" content="P&C (People & Culture) is the place to share your ideas with the world. It's a free community for innovators, entrepreneurs, and thinkers."/>
	<meta name="keywords" content="P&C,People & Culture,pc app,social,social networking websites,share,thoughts,projects,ideas,pc ideas,inspire,prioritize,make friends,co-workers"/>
	<meta name="author" content="Md. Mazidul Haque Farabi"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	
	<link rel="preload" href = "css-pages.css" as="style">
	<link rel = "stylesheet" type = "text/css" href = "css-pages.css"> 
	<link rel="preconnect" href="https://fonts.googleapis.com"> 
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin> 
	<link rel="preload" href="https://fonts.googleapis.com/css2?family=Oswald:wght@400;700&family=Poppins&display=swap" as ="style" crossorigin> 
	<link href="https://fonts.googleapis.com/css2?family=Oswald:wght@400;700&family=Poppins&display=swap" rel="stylesheet" crossorigin> 
	<link rel="preload" as="image" href="icon/p&c.png"> 
	<link rel="preload" as="image" href="icon/drop-settings.png"> 
	<link rel="preload" as="image" href="icon/more.png"> 
	<link rel="preload" as="image" href="icon/searchbutton.png"> 
	<link rel="preload" as="image" href="icon/posts-settings.png"> 
	<link rel="preload" as="image" href="icon/comments.png"> 
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

/* Emoji colors in reactor lists */
.reactor-type .fa-face-laugh {
  color: var(--accent-haha) !important;
}

.reactor-type .fa-heart {
  color: var(--accent-love) !important;
}

/* Ensure navbar logo positioning is consistent with other pages */
.topnav .thinking {
  width: 44px;
  height: 44px;
  border-radius: var(--radius-btn);
}

/* Post profile name link styling */
.post-profile-name {
  text-decoration: none !important;
  color: var(--text-primary) !important;
  font-weight: 600;
  transition: var(--transition);
}

.post-profile-name:hover {
  color: var(--accent-primary) !important;
  text-decoration: none !important;
}

/* Modern Comments Styling */
.post-comments-section {
  margin-top: 1rem;
  padding-top: 1rem;
  border-top: 1px solid var(--border-primary);
}

.comment-item {
  display: flex;
  gap: 0.75rem;
  margin-bottom: 1rem;
  padding: 0.5rem 0;
}

.comment-avatar {
  flex-shrink: 0;
  text-decoration: none;
}

.comment-avatar img {
  width: 32px;
  height: 32px;
  border-radius: 50%;
  object-fit: cover;
  border: 1.5px solid var(--border-primary);
  transition: var(--transition);
}

.comment-avatar:hover img {
  border-color: var(--accent-primary);
}

.comment-content {
  flex: 1;
  min-width: 0;
}

.comment-header {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  margin-bottom: 0.25rem;
}

.comment-author {
  font-weight: 600;
  font-size: 0.9rem;
  color: var(--text-primary);
  text-decoration: none;
  transition: var(--transition);
}

.comment-author:hover {
  color: var(--accent-primary);
  text-decoration: none;
}

.comment-time {
  font-size: 0.8rem;
  color: var(--text-muted);
}

.comment-edit {
  margin-left: auto;
  color: var(--text-muted);
  text-decoration: none;
  padding: 0.25rem;
  border-radius: 4px;
  transition: var(--transition);
  font-size: 0.8rem;
}

.comment-edit:hover {
  color: var(--accent-primary);
  background: var(--bg-tertiary);
}

.comment-bubble {
  background: var(--bg-tertiary);
  border-radius: 16px;
  padding: 0.75rem 1rem;
  border: 1px solid var(--border-primary);
  transition: var(--transition);
}

.comment-text {
  font-size: 0.9rem;
  line-height: 1.4;
  color: var(--text-primary);
  word-wrap: break-word;
}

/* Comment Form Styling */
.commstyle {
  width: 100%;
  min-height: 60px;
  padding: 0.75rem 1rem;
  border: 1.5px solid var(--border-primary);
  border-radius: 20px;
  background: var(--bg-tertiary);
  color: var(--text-primary);
  font-family: inherit;
  font-size: 0.9rem;
  resize: vertical;
  transition: var(--transition);
  box-sizing: border-box;
}

.commstyle:focus {
  outline: none;
  border-color: var(--accent-primary);
  box-shadow: 0 0 0 3px rgba(29, 161, 242, 0.1);
}

.commstyle::placeholder {
  color: var(--text-muted);
}

/* Comment Submit Button */
.btn.btn-sm {
  background: var(--accent-primary);
  color: #fff;
  border: none;
  padding: 0.5rem 1.25rem;
  border-radius: 20px;
  font-weight: 600;
  font-size: 0.85rem;
  cursor: pointer;
  transition: var(--transition);
  margin-top: 0.5rem;
}

.btn.btn-sm:hover {
  background: var(--accent-secondary);
  transform: translateY(-1px);
}

.btn.btn-sm:active {
  transform: translateY(0);
}

/* Empty comments state */
.no-comments {
  text-align: center;
  padding: 1.5rem;
  color: var(--text-muted);
  font-style: italic;
  font-size: 0.9rem;
}

/* Mobile responsive comments */
@media (max-width: 768px) {
  .comment-item {
    gap: 0.5rem;
  }
  
  .comment-avatar img {
    width: 28px;
    height: 28px;
  }
  
  .comment-bubble {
    padding: 0.6rem 0.8rem;
  }
  
  .comment-text {
    font-size: 0.85rem;
  }
  
  .commstyle {
    font-size: 0.85rem;
    padding: 0.6rem 0.8rem;
  }
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

/* Specific hover colors for different reaction types */
.post-action-btn[title*="Haha"]:hover {
  background: var(--accent-haha) !important;
  color: #fff !important;
}

.post-action-btn[title*="Love"]:hover {
  background: var(--accent-love) !important;
  color: #fff !important;
}

/* Post Action Button Base Styles */
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

/* More specific selectors for buttons inside links */
.post-action-group a .post-action-btn[title="Haha"]:hover,
.post-action-group a .post-action-btn[title="Haha'd"]:hover {
  background: var(--accent-haha) !important;
  color: #fff !important;
  transform: translateY(-1px);
}

.post-action-group a .post-action-btn[title="Love"]:hover,
.post-action-group a .post-action-btn[title="Loved"]:hover {
  background: var(--accent-love) !important;
  color: #fff !important;
  transform: translateY(-1px);
}

/* Comment button hover */
.post-action-group .post-action-btn[title="Comment"]:hover {
  background: var(--accent-primary) !important;
  color: #fff !important;
  transform: translateY(-1px);
}

/* Default hover for any other post action buttons */
.post-action-btn:hover:not([title*="Haha"]):not([title*="Love"]):not([title="Comment"]) {
  background: var(--bg-card) !important;
  color: var(--text-primary) !important;
  transform: translateY(-1px);
}

/* Emoji colors in reactor lists */
.close-report-modal {
  position: absolute;
  top: 8px;
  right: 12px;
  font-size: 1.5rem;
  background: none;
  border: none;
  color: #888;
  cursor: pointer;
  z-index: 2;
  transition: color 0.2s;
}
.close-report-modal:hover {
  color: var(--accent-danger, #e0245e) !important;
}
</style>

</head>

	<%
  		try
			{
  			
  			if (db.userid(request) != null) {

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
	
	<div id = "content" class = "content">
	
	
	<!-- --------------------------------------------------------------------------------------------------------------------------------------- -->

    <div class="form-center-wrapper">
        <form class="frmdsgn" name="frm" action="postpro.jsp" method="POST" enctype="multipart/form-data" style="position: relative; padding: 1.2rem 1rem; max-width: 500px; width: 100%;">
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
                <option value="1" selected>Meme</option>
                <option value="2">Fact</option>
                <option value="3">Update</option>
              </select>
            </div>
            <div class="modern-dropdown-section">
              <div class="modern-dropdown-label">Privacy</div>
              <select class="modern-dropdown-select" name="privacy" required>
                <option value="3" selected>Co-workers &amp; Followers</option>
                <option value="2">Co-workers</option>
                <option value="1">Followers</option>
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
            <textarea id="postboxtext" class="input-field" name="text" placeholder=" " maxlength="2000" required aria-label="Post text" style="min-height: 100px; font-size: 1rem; padding: 0.7rem 1.5rem;"></textarea>
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
        <input type="hidden" name="csrf" value="<%=db.csrftoken()%>">
        </form>
    </div>

    <div id="prog" class="modern-spinner" style="margin: auto; margin-bottom: 10px; width: 64px; height: 64px; display: none;"></div>
    
    <p style="display: none; text-align: center; margin-bottom: 20px; color: var(--text-primary);" id="output-title">Preview Image:<br></p>
    <div id="output-div" style="display: none; width:700px; background: var(--bg-card); border: 1px solid var(--border-primary); border-radius: 8px; padding: 10px; margin-bottom: 20px;"><img style="max-height: 100%; max-width: 100%; display: none; margin-left: auto; margin-right: auto; border-radius: 6px;" id="output"/></div>
    <script>
  	var loadFile = function(event) {
    var output = document.getElementById('output');
    var outputtitle = document.getElementById('output-title');
    var outputdiv = document.getElementById('output-div');
    output.src = URL.createObjectURL(event.target.files[0]);
    output.style.display = "block";
    outputtitle.style.display = "block";
    outputdiv.style.display = "block";
    output.onload = function() {
      URL.revokeObjectURL(output.src);
    	}
  	};
	</script>
	
	
	<!-- --------------------------------------------------------------------------------------------------------------------------------------- -->
		
	<%
	try
	{
		String msg=session.getAttribute("msg").toString();
		%>
		<div id="notifMsg" class="modern-toast">
		  <span><%=msg%></span>
		  <button class="toast-close" onclick="document.getElementById('notifMsg').style.display='none';">&times;</button>
		</div>
		<%
		session.removeAttribute("msg");
	} catch (Exception ex){}
	%>
		
		
			<%
			
			Connection conn=null;
			Connection conn2=null;
			Statement st2=null;
			ResultSet rs=null;
			ResultSet rs2=null;
			ResultSet rsspc=null;
			ResultSet rsspc2=null;
			ResultSet rscomments = null;
			PreparedStatement pstmt = null;
			PreparedStatement pstmt2 = null;
			PreparedStatement pstmt3 = null;
			PreparedStatement pstmt4 = null;
			PreparedStatement pstmt5 = null;

			
			Class.forName(db.name());
			String unamef = db.uname().concat("i");
			String passf = db.pass().concat("09");
			conn=(Connection)DriverManager.getConnection(db.urlth(),unamef,passf);
			conn2=(Connection)DriverManager.getConnection(db.urlus(),unamef,passf);
			st2=conn2.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				
				
			String yourfname = null;
			String yoursname = null;
			String yourfullname = null;
			String posttext = null;
			String yourgen = null;
			String yourbio = null;
			String yourpostp = null;
			String posterid = null;
			String qrycomments = null;
			String commtext = null;
			String posteridcomm = null;
			int privacy;
			int mylink;
			int gui = -1;
			int xk = -1;
			int i;
			String postid = null;
			String imdir = null;
			boolean exists = false;
			String hiaposter = null;
			String postistype = null;
			String postisfor = null;
			int posttype;
			int likescount;
			int commentscount;
			int priorins = 0;
			int ntfno = 0;
			int pstcountfrads = 0;
			int adluck = (int)(Math.random() * 5) + 3; //which means at least 3 and 6 posts for world & country respectively
			String cntry = null;
			cntry = db.getCurrentBid(ix, 0);
			int approval = 0;
			String trxid = null;
			String approvestatus = null;
			String[] psfetches = null;
			String psfullname = null;
			String pspp = null;
			

			HashSet<String> mylist = new HashSet<String>();
			
			String qryspc="select * from notif WHERE liker =? AND liketype > 5";
			pstmt = conn.prepareStatement(qryspc, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			pstmt.setString(1, ix);
			rsspc=pstmt.executeQuery();
			
//adding the people you've hidden all posts of to a hashset which will be blocked from displaying for user
			while (rsspc.next()) {
				if (rsspc.getInt(6) == 6) {
					hiaposter = rsspc.getString(5);
					
					String qryspc2="select * from posts WHERE posterid =?";
					pstmt2 = conn.prepareStatement(qryspc2, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
					pstmt2.setString(1, hiaposter);
					rsspc2=pstmt2.executeQuery();
					
					while (rsspc2.next()) {
						mylist.add(rsspc2.getString(4));
					}
					continue;
				}
				mylist.add(rsspc.getString(4));
			}
			
			
			//select from ALL the posts in database with privacy thynkmates (2) or fans(1) or both(3)
			String qry="select * from posts WHERE privacy = 2 OR privacy = 1 OR privacy = 3";
			pstmt3 = conn.prepareStatement(qry, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			rs=pstmt3.executeQuery();

			// Declare variables for use in the post loop
			String qryReacted = null;
			PreparedStatement pstmtReacted = null;
			ResultSet rsReacted = null;
			boolean hasReacted = false;

			// Check if user has any connections
			String qryConnections = "select count(*) from `"+ix+"` WHERE yorn = 2 OR yorn = 0";
			PreparedStatement pstmtConnections = conn2.prepareStatement(qryConnections);
			ResultSet rsConnections = pstmtConnections.executeQuery();
			rsConnections.next();
			int connectionCount = rsConnections.getInt(1);
			
			// If user has no connections, show random posts with privacy=1 (Followers)
			if (connectionCount == 0) {
				String qryRandom = "select * from posts WHERE privacy = 1 ORDER BY RAND() LIMIT 10";
				PreparedStatement pstmtRandom = conn.prepareStatement(qryRandom, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				ResultSet rsRandom = pstmtRandom.executeQuery();
				
				%>
				<!-- Welcome message for new users -->
				<div class="welcome-section" style="background: var(--bg-card); border: 1.5px solid var(--border-primary); border-radius: 16px; padding: 2rem; margin: 2rem auto; max-width: 600px; text-align: center;">
					<h2 style="color: var(--text-primary); margin-bottom: 1rem;">Welcome to P&C! 👋</h2>
					<p style="color: var(--text-secondary); margin-bottom: 1.5rem;">Discover amazing content from our community. Follow people to see their posts in your feed!</p>
				</div>
				<%
				
				while(rsRandom.next()) {
					posterid = rsRandom.getString(2);
					postid = rsRandom.getString(4);
					posttype = rsRandom.getInt(7);				
					privacy = rsRandom.getInt(8);
					likescount = db.countlikers(postid, posterid);
					commentscount = db.countcommentators(postid, posterid);
					
					if (db.nameico(posterid) != null) {
						psfetches = db.nameico(posterid);
						psfullname = psfetches[0];
						pspp = "img/".concat(psfetches[1]);
					}
					
					imdir = null;
					posttext = base64.de(rsRandom.getString(5)).replaceAll("(\r\n|\n)", "<br>");
					yourpostp = rsRandom.getString(6);
					if (yourpostp != null) {
						imdir = "img/".concat(yourpostp);
					}
					%>
					<div id="ajaxify<%=postid%>">
						<div class="post-card" id="<%=postid%>" style="position: relative;">
							<!-- Big Follow Button for New Users -->
							<div style="position: absolute; top: 1rem; right: 1rem; z-index: 10;">
								<button class="big-follow-btn" onclick="followUser('<%=posterid%>', '<%=psfullname%>')" style="background: var(--accent-primary); color: #fff; border: none; padding: 0.75rem 1.5rem; border-radius: 25px; font-weight: 600; font-size: 0.9rem; cursor: pointer; transition: var(--transition); box-shadow: var(--shadow-md);">
									<i class="fa-solid fa-user-plus" style="margin-right: 0.5rem;"></i>Follow
								</button>
							</div>
							
							<div class="post-header">
								<img class="post-profile-img" src="<%=pspp%>" alt="<%=psfullname%>" />
								<div>
									<a href="profile.jsp?userId=<%=posterid%>" class="post-profile-name" style="text-decoration: none; color: var(--text-primary);"><%=psfullname%></a>
									<div class="post-meta-info">
										<div class="post-time"><%=db.timecon(ix, rsRandom.getString(9))%></div>
										<div class="post-cat-priv">
											<% if (posttype == 1) { %>Meme<% } else if (posttype == 2) { %>Fact<% } else if (posttype == 3) { %>Update<% } %>
											&nbsp;•&nbsp;
											<% if (privacy == 3) { %>Co-workers &amp; Followers<% } else if (privacy == 2) { %>Co-workers<% } else if (privacy == 1) { %>Followers<% } %>
										</div>
									</div>
								</div>
							</div>
							
							<div class="post-content"><%=posttext%></div>
							<% if (imdir != null) { %>
								<img class="post-image" src="<%=imdir%>" loading="lazy" alt="Post image" />
							<% } %>
							
							<div class="post-actions">
								<div class="post-counts">
									<span class="reactors-toggle" onclick="toggleReactedList('<%=postid%>', event)"><i class="fa-solid fa-heart"></i> <%=likescount%></span>
									<span class="comments-toggle" onclick="toggleCommentsList('<%=postid%>', event)" style="cursor: pointer;"><i class="fa-solid fa-comments"></i> <%=commentscount%></span>
									<div class="post-reacted-list" id="reacted-list-<%=postid%>">
										<button class="close-reacted-list" onclick="closeReactedList('<%=postid%>'); event.stopPropagation();">&times;</button>
										<% 
											qryReacted = "select * from notif WHERE postid =? AND (liketype = 1 OR liketype = 2)";
											pstmtReacted = conn.prepareStatement(qryReacted, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
											pstmtReacted.setString(1, postid);
											rsReacted = pstmtReacted.executeQuery();
											hasReacted = false;
											int reactorCount = 0;
											int totalReactors = 0;
											
											// First, count total reactors
											while(rsReacted.next()) {
												totalReactors++;
											}
											
											// Reset result set and display reactors (limited to 25)
											rsReacted.beforeFirst();
											while(rsReacted.next() && reactorCount < 25) {
												hasReacted = true;
												reactorCount++;
												String reactedUserId = rsReacted.getString(2);
												int reactType = rsReacted.getInt(6); // 1 = Prioritize, 2 = Inspire
												String[] reactedUser = db.nameico(reactedUserId);
												String reactedName = reactedUser[0];
												String reactedPp = "img/".concat(reactedUser[1]);
										%>
											<div class="reactor-entry">
												<a href="profile.jsp?userId=<%=reactedUserId%>" style="display: flex; align-items: center; gap: 0.5em; text-decoration: none; color: inherit;">
													<img src="<%=reactedPp%>" alt="<%=reactedName%>" class="reacted-avatar" />
													<span class="reactor-name"><%=reactedName%></span>
												</a>
												<span class="reactor-type">
													<% if (reactType == 1) { %>
														<i class="fa-solid fa-face-laugh"></i>
													<% } else if (reactType == 2) { %>
														<i class="fa-solid fa-heart"></i>
													<% } %>
												</span>
											</div>
										<% } %>
          
										<% if (totalReactors > 25) { %>
											<div class="reactor-entry" style="justify-content: center; color: var(--text-muted); font-style: italic;">
												<span>... and <%=totalReactors - 25%> more</span>
											</div>
										<% } %>
          
										<% if (!hasReacted) { %>
											<span class="no-reacts">No reactions yet</span>
										<% } %>
									</div>
								</div>
								<div class="post-action-group">
									<% if (db.getifliked(ix, postid, posterid) == 0) { %>
										<a id="lke<%=postid%>" href="javascript:void(0);" onClick="reply_click(this.id, '<%=posterid%>')">
											<button class="post-action-btn" title="Haha"><i class="fa-solid fa-face-laugh"></i> Haha</button>
										</a>
									<% } else if (db.getifliked(ix, postid, posterid) == 1) { %>
										<a id="ulk<%=postid%>" href="javascript:void(0);" onClick="reply_click(this.id, '<%=posterid%>')">
											<button class="post-action-btn" title="Haha'd" style="background: var(--accent-haha); color: #fff;"><i class="fa-solid fa-face-laugh"></i> Haha'd</button>
										</a>
									<% } %>
									<% if (db.getifdisliked(ix, postid, posterid) == 5) { %>
										<a id="dlk<%=postid%>" href="javascript:void(0);" onClick="reply_click(this.id, '<%=posterid%>')">
											<button class="post-action-btn" title="Love"><i class="fa-solid fa-heart"></i> Love</button>
										</a>
									<% } else if (db.getifdisliked(ix, postid, posterid) == 6) { %>
										<a id="udk<%=postid%>" href="javascript:void(0);" onClick="reply_click(this.id, '<%=posterid%>')">
											<button class="post-action-btn" title="Loved" style="background: var(--accent-love); color: #fff;"><i class="fa-solid fa-heart"></i> Loved</button>
										</a>
									<% } %>
									<button class="post-action-btn" id="<%=postid%>comm" onclick="mycomm(this.id)" title="Comment"><i class="fa-solid fa-comment"></i> Comment</button>
								</div>
								
								<!-- Comments section - inline like Facebook -->
								<div class="post-comments-section" id="comments-section-<%=postid%>" style="display: none;">
									<% if (commentscount > 0) { %>
										<% 
											qrycomments = "select * from notif WHERE postid =? AND liketype = 3 ORDER BY time DESC";
											PreparedStatement pstmtComments = conn.prepareStatement(qrycomments, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
											pstmtComments.setString(1, postid);
											ResultSet rsComments = pstmtComments.executeQuery();
											while(rsComments.next()) {
												String commenterId = rsComments.getString(2); // liker field
												String commentText = base64.de(rsComments.getString(7)).replaceAll("(\r\n|\n)", "<br>"); // commtext field
												String commentTime = rsComments.getString(8); // time field
												ntfno = rsComments.getInt(1); // notification ID for editing
												String[] commenterUser = db.nameico(commenterId);
												String commenterName = commenterUser[0];
												String commenterPp = "img/".concat(commenterUser[1]);
										%>
											<div class="comment-item">
												<a href="profile.jsp?userId=<%=commenterId%>" class="comment-avatar">
													<img src="<%=commenterPp%>" alt="<%=commenterName%>" />
												</a>
												<div class="comment-content">
													<div class="comment-header">
														<a href="profile.jsp?userId=<%=commenterId%>" class="comment-author"><%=commenterName%></a>
														<span class="comment-time"><%=db.timecon(ix, commentTime)%></span>
														<% if (commenterId.equals(ix)) { %>
															<a href="javascript:void(0);" onClick="reply_click7('<%=commenterId%>', '<%=postid%>', '<%=ntfno%>', '<%=base64.en(commentText)%>', '<%=posterid%>')" class="comment-edit">
																<i class="fa-solid fa-pen"></i>
															</a>
														<% } %>
													</div>
													<div class="comment-bubble">
														<div class="comment-text"><%=commentText%></div>
													</div>
												</div>
											</div>
										<% } %>
									<% } %>
								</div>
								
								<!-- Comment form for this post -->
								<form id="<%=postid%>commform" style="display:none; margin-top:10px;" name="formcomm" action="sommycommdum.jsp" method="POST">
									<textarea id="<%=postid%>commfoc" name="commentbox" class="commstyle" placeholder="Write a comment..." required></textarea>
									<input type="hidden" name="postid" value="<%=postid%>" />
									<input type="hidden" name="posterid" value="<%=posterid%>" />
									<input type="hidden" name="csrf" value="<%=db.csrftoken()%>">
									<button type="submit" class="btn btn-sm" style="margin-top:0.5em;">Submit</button>
								</form>
							</div>
						</div>
					</div>
					<%
				}
				
				// Close the random posts result set
				rsRandom.close();
				pstmtRandom.close();
				
				%>
				<!-- End of random posts section -->
				<div style="text-align: center; margin: 3rem 0; padding: 2rem; background: var(--bg-card); border-radius: 16px; border: 1.5px solid var(--border-primary);">
					<h3 style="color: var(--text-primary); margin-bottom: 1rem;">Want to see more posts?</h3>
					<p style="color: var(--text-secondary); margin-bottom: 1.5rem;">Follow more people to see their posts in your feed!</p>
					<a href="following.jsp" class="btn btn-sm" style="background: var(--accent-primary); color: #fff; text-decoration: none; padding: 0.75rem 1.5rem; border-radius: 25px; font-weight: 600;">
						<i class="fa-solid fa-user-group" style="margin-right: 0.5rem;"></i>Find People to Follow
					</a>
				</div>
				<%
				
			} else {
				// Original logic for users with connections
				while(rs.absolute(gui)) {
				posterid = rs.getString(2);
				postid = rs.getString(4);
				posttype = rs.getInt(7);				
				privacy = rs.getInt(8);
				likescount = db.countlikers(postid, posterid);
				commentscount  = db.countcommentators(postid, posterid);
				String[] cntryadfetch = db.countryad(cntry);
				String[] worldfetch = db.worldad();
				if (db.nameico(posterid) != null) {
				psfetches = db.nameico(posterid);
				psfullname = psfetches[0];
				pspp = "img/".concat(psfetches[1]);
				}
				String qry2="select * from `"+ix+"` WHERE yorn = 2 OR yorn = 0";
				rs2=st2.executeQuery(qry2);
				boolean shouldRenderPost = false;
				while(rs2.next()) {
					mylink = rs2.getInt(2);
					if((posterid.equals(rs2.getString(1)) && privacy == 3 && (mylink == 2 || mylink == 0)) || (posterid.equals(rs2.getString(1)) && privacy == mylink) || (posterid.equals(rs2.getString(1)) && (privacy == 1 && mylink == 0))) {
							if (mylist.add(postid)) {
								pstcountfrads++;
								exists = false;
							shouldRenderPost = true;
						}
					}
				}
				// Output ad at top level if needed
						if (pstcountfrads == adluck && worldfetch != null) {
								imdir = null;
								postid = worldfetch[0];
								posterid = worldfetch[1];
								posttext  = base64.de(worldfetch[2]).replaceAll("(\r\n|\n)", "<br>");
								yourpostp = worldfetch[3];
								if (db.nameico(posterid) != null) {
									psfetches = db.nameico(posterid);
									psfullname = psfetches[0];
									pspp = "img/".concat(psfetches[1]);
								}
								if (yourpostp != null) {
									imdir = "img/".concat(yourpostp);
					}
%>
<div class="ad-card" id="ajaxify<%=postid%>">
								<div class="post-card" id="<%=postid%>">
								  <div class="post-header">
								      <img class="post-profile-img" src="<%=pspp%>" alt="<%=psfullname%>" />
      <div>
								      <a href="profile.jsp?userId=<%=posterid%>" class="post-profile-name" style="text-decoration: none; color: var(--text-primary);"><%=psfullname%></a>
        <div class="post-meta-info">
          <div class="post-time"><%=db.timecon(ix, rs.getString(9))%></div>
          <div class="post-type">Sponsored</div>
        </div>
								    </div>
								  </div>
								  <div class="post-content"><%=posttext%></div>
								  <% if (imdir != null) { %>
								    <img class="post-image" src="<%=imdir%>" loading="lazy" alt="Post image" />
								  <% } %>
  </div>
								</div>
								<%
								exists = true;
				} else if (pstcountfrads == adluck + 3 && cntryadfetch != null) {
								imdir = null;
								postid = cntryadfetch[0];
								posterid = cntryadfetch[1];
								posttext  = base64.de(cntryadfetch[2]).replaceAll("(\r\n|\n)", "<br>");
								yourpostp = cntryadfetch[3];
								if (db.nameico(posterid) != null) {
									psfetches = db.nameico(posterid);
									psfullname = psfetches[0];
									pspp = "img/".concat(psfetches[1]);
								}
								if (yourpostp != null) {
									imdir = "img/".concat(yourpostp);
					}
%>
<div class="ad-card" id="ajaxify<%=postid%>">
								<div class="post-card" id="<%=postid%>">
								  <div class="post-header">
								      <img class="post-profile-img" src="<%=pspp%>" alt="<%=psfullname%>" />
      <div>
								      <a href="profile.jsp?userId=<%=posterid%>" class="post-profile-name" style="text-decoration: none; color: var(--text-primary);"><%=psfullname%></a>
        <div class="post-meta-info">
          <div class="post-time"><%=db.timecon(ix, rs.getString(9))%></div>
          <div class="post-type">Sponsored</div>
        </div>
								    </div>
								  </div>
								  <div class="post-content"><%=posttext%></div>
								  <% if (imdir != null) { %>
								    <img class="post-image" src="<%=imdir%>" loading="lazy" alt="Post image" />
								  <% } %>
  </div>
								</div>
								<%
								exists = true;
				} else if (shouldRenderPost) {
					   	imdir = null;
						posttext = base64.de(rs.getString(5)).replaceAll("(\r\n|\n)", "<br>");
						yourpostp = rs.getString(6);
						if (yourpostp != null) {
							imdir = "img/".concat(yourpostp);
						}
				   %>
<div id="ajaxify<%=postid%>">
				   <div class="post-card" id="<%=postid%>">
				   <div class="post-header">
				   <img class="post-profile-img" src="<%=pspp%>" alt="<%=psfullname%>" />
      <div>
				   <a href="profile.jsp?userId=<%=posterid%>" class="post-profile-name" style="text-decoration: none; color: var(--text-primary);"><%=psfullname%></a>
        <div class="post-meta-info">
          <div class="post-time"><%=db.timecon(ix, rs.getString(9))%></div>
          <div class="post-cat-priv">
            <% if (posttype == 1) { %>Meme<% } else if (posttype == 2) { %>Fact<% } else if (posttype == 3) { %>Update<% } %>
            &nbsp;•&nbsp;
            <% if (privacy == 3) { %>Co-workers &amp; Followers<% } else if (privacy == 2) { %>Co-workers<% } else if (privacy == 1) { %>Followers<% } %>
          </div>
        </div>
      </div>
      <!-- Post Settings Menu -->
      <div class="postsett">
        <span id="<%=postid%>edit" onclick="postedits(this.id)"><img class="postinge" src="icon/posts-settings.png" /></span>
        <div id="<%=postid%>editpost" class="editpost">
          <% if (ix.equals(posterid)) { %>
            <a class="edt<%=posterid%>" id="edt<%=postid%>" href="javascript:void(0);" onClick="reply_click4(this.id, this.className)">Edit post</a>
            <hr>
            <a class="dlt<%=posterid%>" id="dlt<%=postid%>" href="javascript:void(0);" onClick="reply_click3(this.id, this.className)">Delete post</a>
          <% } else { %>
            <a class="hid<%=posterid%>" id="hid<%=postid%>" href="javascript:void(0);" onClick="reply_click2(this.id, this.className)">Hide Post</a>
            <hr>
            <a class="hia<%=posterid%>" id="hia<%=postid%>" href="javascript:void(0);" onClick="reply_click2(this.id, this.className)">Hide all posts of <%
            if(psfullname.contains(" ")){
              String psfullname2= psfullname.substring(0, psfullname.indexOf(" ")); 
              out.println(psfullname2);
            }%></a>
            <hr>
            <a class="report" id="report" href="javascript:void(0);" onclick="toggle_visibility('<%=postid%>editpostrep');">Report Post</a>
          <% } %>
        </div>
      </div>
      <!-- Report Post Modal -->
      <% if (!ix.equals(posterid)) { %>
        <div id="<%=postid%>editpostrep" class="editpostrep">
          <button type="button" class="close-report-modal" onclick="document.getElementById('<%=postid%>editpostrep').style.display='none';" style="position:absolute;top:8px;right:12px;font-size:1.5rem;background:none;border:none;color:#888;cursor:pointer;z-index:2;">&times;</button>
          <br>
          <p style="color:black;">Report this post on the basis of</p><br>
          <a id="re1<%=postid%>" href="javascript:void(0);" onClick="reply_click2(this.id, 'rep<%=posterid%>')">Political controversy</a>
          <hr>
          <a id="re2<%=postid%>" href="javascript:void(0);" onClick="reply_click2(this.id, 'rep<%=posterid%>')">False news or rumor</a>
          <hr>
          <a id="re3<%=postid%>" href="javascript:void(0);" onClick="reply_click2(this.id, 'rep<%=posterid%>')">Partial or full nudity</a>
          <hr>
          <a id="re4<%=postid%>" href="javascript:void(0);" onClick="reply_click2(this.id, 'rep<%=posterid%>')">Violence</a>
          <hr>
          <a id="re5<%=postid%>" href="javascript:void(0);" onClick="reply_click2(this.id, 'rep<%=posterid%>')">Harassment</a>
          <hr>
          <a id="re6<%=postid%>" href="javascript:void(0);" onClick="reply_click2(this.id, 'rep<%=posterid%>')">Other</a>
        </div>
      <% } %>
    </div>
    <div class="post-content"><%=posttext%></div>
    <% if (imdir != null) { %>
      <img class="post-image" src="<%=imdir%>" loading="lazy" alt="Post image" />
    <% } %>
    <div class="post-actions">
      <div class="post-counts">
        <span class="reactors-toggle" onclick="toggleReactedList('<%=postid%>', event)"><i class="fa-solid fa-heart"></i> <%=likescount%></span>
        <span class="comments-toggle" onclick="toggleCommentsList('<%=postid%>', event)" style="cursor: pointer;"><i class="fa-solid fa-comments"></i> <%=commentscount%></span>
        <div class="post-reacted-list" id="reacted-list-<%=postid%>">
          <button class="close-reacted-list" onclick="closeReactedList('<%=postid%>'); event.stopPropagation();">&times;</button>
          <% 
             qryReacted = "select * from notif WHERE postid =? AND (liketype = 1 OR liketype = 2)";
             pstmtReacted = conn.prepareStatement(qryReacted, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
             pstmtReacted.setString(1, postid);
             rsReacted = pstmtReacted.executeQuery();
             hasReacted = false;
             int reactorCount = 0;
             int totalReactors = 0;
             
             // First, count total reactors
             while(rsReacted.next()) {
               totalReactors++;
             }
             
             // Reset result set and display reactors (limited to 25)
             rsReacted.beforeFirst();
             while(rsReacted.next() && reactorCount < 25) {
               hasReacted = true;
               reactorCount++;
               String reactedUserId = rsReacted.getString(2);
               int reactType = rsReacted.getInt(6); // 1 = Prioritize, 2 = Inspire
               String[] reactedUser = db.nameico(reactedUserId);
               String reactedName = reactedUser[0];
               String reactedPp = "img/".concat(reactedUser[1]);
          %>
            <div class="reactor-entry">
              <a href="profile.jsp?userId=<%=reactedUserId%>" style="display: flex; align-items: center; gap: 0.5em; text-decoration: none; color: inherit;">
                <img src="<%=reactedPp%>" alt="<%=reactedName%>" class="reacted-avatar" />
                <span class="reactor-name"><%=reactedName%></span>
              </a>
              <span class="reactor-type">
                <% if (reactType == 1) { %>
                  <i class="fa-solid fa-face-laugh"></i>
                <% } else if (reactType == 2) { %>
                  <i class="fa-solid fa-heart"></i>
                <% } %>
              </span>
            </div>
          <% } %>
          
          <% if (totalReactors > 25) { %>
            <div class="reactor-entry" style="justify-content: center; color: var(--text-muted); font-style: italic;">
              <span>... and <%=totalReactors - 25%> more</span>
            </div>
          <% } %>
          
          <% if (!hasReacted) { %>
            <span class="no-reacts">No reactions yet</span>
          <% } %>
        </div>
      </div>
      <div class="post-action-group">
        <% if (db.getifliked(ix, postid, posterid) == 0) { %>
          <a id="lke<%=postid%>" href="javascript:void(0);" onClick="reply_click(this.id, '<%=posterid%>')">
				   <button class="post-action-btn" title="Haha"><i class="fa-solid fa-face-laugh"></i> Haha</button>
          </a>
        <% } else if (db.getifliked(ix, postid, posterid) == 1) { %>
          <a id="ulk<%=postid%>" href="javascript:void(0);" onClick="reply_click(this.id, '<%=posterid%>')">
            <button class="post-action-btn" title="Haha'd" style="background: var(--accent-haha); color: #fff;"><i class="fa-solid fa-face-laugh"></i> Haha'd</button>
          </a>
        <% } %>
        <% if (db.getifdisliked(ix, postid, posterid) == 5) { %>
          <a id="dlk<%=postid%>" href="javascript:void(0);" onClick="reply_click(this.id, '<%=posterid%>')">
				   <button class="post-action-btn" title="Love"><i class="fa-solid fa-heart"></i> Love</button>
          </a>
        <% } else if (db.getifdisliked(ix, postid, posterid) == 6) { %>
          <a id="udk<%=postid%>" href="javascript:void(0);" onClick="reply_click(this.id, '<%=posterid%>')">
            <button class="post-action-btn" title="Loved" style="background: var(--accent-love); color: #fff;"><i class="fa-solid fa-heart"></i> Loved</button>
          </a>
        <% } %>
        <button class="post-action-btn" id="<%=postid%>comm" onclick="mycomm(this.id)" title="Comment"><i class="fa-solid fa-comment"></i> Comment</button>
      </div>
      
      <!-- Comments section - inline like Facebook -->
      <div class="post-comments-section" id="comments-section-<%=postid%>" style="display: none;">
        <% if (commentscount > 0) { %>
          <% 
             qrycomments = "select * from notif WHERE postid =? AND liketype = 3 ORDER BY time DESC";
             PreparedStatement pstmtComments = conn.prepareStatement(qrycomments, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
             pstmtComments.setString(1, postid);
             ResultSet rsComments = pstmtComments.executeQuery();
             while(rsComments.next()) {
               String commenterId = rsComments.getString(2); // liker field
               String commentText = base64.de(rsComments.getString(7)).replaceAll("(\r\n|\n)", "<br>"); // commtext field
               String commentTime = rsComments.getString(8); // time field
               ntfno = rsComments.getInt(1); // notification ID for editing
               String[] commenterUser = db.nameico(commenterId);
               String commenterName = commenterUser[0];
               String commenterPp = "img/".concat(commenterUser[1]);
          %>
            <div class="comment-item">
              <a href="profile.jsp?userId=<%=commenterId%>" class="comment-avatar">
                <img src="<%=commenterPp%>" alt="<%=commenterName%>" />
              </a>
              <div class="comment-content">
                <div class="comment-header">
                  <a href="profile.jsp?userId=<%=commenterId%>" class="comment-author"><%=commenterName%></a>
                  <span class="comment-time"><%=db.timecon(ix, commentTime)%></span>
                  <% if (commenterId.equals(ix)) { %>
                    <a href="javascript:void(0);" onClick="reply_click7('<%=commenterId%>', '<%=postid%>', '<%=ntfno%>', '<%=base64.en(commentText)%>', '<%=posterid%>')" class="comment-edit">
                      <i class="fa-solid fa-pen"></i>
                    </a>
                  <% } %>
                </div>
                <div class="comment-bubble">
                  <div class="comment-text"><%=commentText%></div>
                </div>
              </div>
            </div>
          <% } %>
        <% } %>
      </div>
      
      <!-- Comment form for this post -->
      <form id="<%=postid%>commform" style="display:none; margin-top:10px;" name="formcomm" action="sommycommdum.jsp" method="POST">
        <textarea id="<%=postid%>commfoc" name="commentbox" class="commstyle" placeholder="Write a comment..." required></textarea>
        <input type="hidden" name="postid" value="<%=postid%>" />
        <input type="hidden" name="posterid" value="<%=posterid%>" />
        <input type="hidden" name="csrf" value="<%=db.csrftoken()%>">
        <button type="submit" class="btn btn-sm" style="margin-top:0.5em;">Submit</button>
      </form>
    </div>
  </div>
</div>
				   <% 
				   }
				gui--;
			}
			}
			
			// Close result sets and statements
			if (rsConnections != null) rsConnections.close();
			if (pstmtConnections != null) pstmtConnections.close();
			if (rs != null) rs.close();
			if (pstmt3 != null) pstmt3.close();

			} else {
				response.sendRedirect("login.jsp");
				return;
			}

			} catch(Exception ex) {
				out.print("<br><br><p class = 'showBox'><a href='logout.jsp'><button>Log Out</button></a></p>");
				System.out.print(ex+"index.jsp");
		}
	%>
	<br><br><br>
	<p class="empty-state-message" Style="max-width: 700px; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Arial, sans-serif; font-weight: 400; text-align: center; color: var(--text-secondary); padding: 2rem;">
	You don't have any more posts to see.<br>Refresh to see if you have newer posts.
	</p>
	<br><br><br>
	</div>
	
	
	



	
<script type="text/javascript">
			function myFunctions() {
			  var x = document.getElementById("royal");
			  if (x.className === "rights") {
			    x.className += " responsive";
			  } else {
			    x.className = "rights";
			  }
			}
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
	
	<script type="text/javascript">
    function toggle_visibility(rep_id) {
       var e = document.getElementById(rep_id);
       if(e.style.display == 'block') {
          e.style.display = 'none';
       }
       else {
          e.style.display = 'block';
       }
       }
	</script>
	
	
	
	
	
	
	
	
	
	
	
	<INPUT TYPE="HIDDEN" NAME="csrf" VALUE="<%=db.csrftoken()%>" id="csrf-reply_click">
	<script type="text/javascript" src="jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
	  function reply_click(clicked_id, clicked_class)
	  {
		  document.getElementById(clicked_id).removeAttribute("onClick");
		  var axes = clicked_id;
		  var axes2 = clicked_class;
		  var csrf = document.getElementById("csrf-reply_click").value;

		  
		  $.ajax({
				type:"POST",
				data: {axes: axes,
					   axes2: axes2,
					   csrf: csrf
					  },
				url:"summydum.jsp",
				success: function(result){
				var postid=axes.substring(3);
				var posterid=axes2;
					   $("#ajaxify"+postid).load(" #ajaxify"+postid);
					   window.history.pushState({} , "", "#"+postid);
				}
			});
		  return false;
	  }
	</script>
			
			
			<FORM NAME="form2" ACTION = "postrepdel.jsp" METHOD="POST">
    		<INPUT TYPE="HIDDEN" NAME="taxes">
    		<INPUT TYPE="HIDDEN" NAME="taxes2">
    		<INPUT TYPE="HIDDEN" NAME="csrf" VALUE="<%=db.csrftoken()%>">
			</FORM>



			<script type="text/javascript">
			  function reply_click2(clicked_id, clicked_class)
			  {
				  var warn = confirm("Are you sure you want to do this?");
				  if (warn) {
				  document.form2.taxes.value = clicked_id;
				  document.form2.taxes2.value = clicked_class;
			      form2.submit();
				  }
			  }
			</script>
			
			
			
			
			<FORM NAME="form7" ACTION = "edit-comment.jsp" METHOD="POST">
			<INPUT TYPE="HIDDEN" NAME="alixes">
			<INPUT TYPE="HIDDEN" NAME="alixes2">
			<INPUT TYPE="HIDDEN" NAME="alixes3">
			<INPUT TYPE="HIDDEN" NAME="alixes4">
			<INPUT TYPE="HIDDEN" NAME="alixes5">
			<INPUT TYPE="HIDDEN" NAME="csrf" VALUE="<%=db.csrftoken()%>">
			</FORM>
	
			
			
			<script type="text/javascript">
	  		function reply_click7(posteridcomm, postid, ntfno, commtext, posterid)
	  		{
		  document.form7.alixes.value = posteridcomm;
		  document.form7.alixes2.value = postid;
		  document.form7.alixes3.value = ntfno;
		  document.form7.alixes4.value = commtext;
		  document.form7.alixes5.value = posterid;
	      form7.submit();
	  		}
			</script>
			
			
			
			
			<script type="text/javascript">
			function mycomm(comm_id)
			{
				var comm = document.getElementById(comm_id+"form");
				//comm_id returns an extra comm as set
				  if (comm.style.display !== "block") {
				    comm.style.display = "block";
				    document.getElementById(comm_id+"foc").focus();
				  } else {
				    comm.style.display = "none";
				  }
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
	
	
	
</body>
</html>

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

// Drag and drop image upload
const dragDropArea = document.getElementById('dragDropArea');
const fileInput = document.getElementById('file-input');
const output = document.getElementById('output');
const dragDropText = document.getElementById('dragDropText');
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
function loadFile(event) {
  const file = event.target.files[0];
  if(file) {
    output.src = URL.createObjectURL(file);
    output.style.display = 'block';
    dragDropText.style.display = 'none';
    output.onload = function() { URL.revokeObjectURL(output.src); };
  }
}
</script>

<script>
function toggleReactedList(postid, event) {
  event.stopPropagation();
  var el = document.getElementById('reacted-list-' + postid);
  if (el) el.classList.toggle('show');
  // Close others
  document.querySelectorAll('.post-reacted-list').forEach(function(list) {
    if (list !== el) list.classList.remove('show');
  });
  // Close comments lists
  document.querySelectorAll('.post-comments-list').forEach(function(list) {
    list.classList.remove('show');
  });
}

function toggleCommentsList(postid, event) {
  event.stopPropagation();
  var el = document.getElementById('comments-section-' + postid);
  if (el) {
    if (el.style.display === 'none' || el.style.display === '') {
      el.style.display = 'block';
    } else {
      el.style.display = 'none';
    }
  }
  // Close reactors lists
  document.querySelectorAll('.post-reacted-list').forEach(function(list) {
    list.classList.remove('show');
  });
}

document.addEventListener('click', function(e) {
  if (!e.target.closest('.post-counts') && !e.target.closest('.post-reacted-list') && !e.target.closest('.post-comments-section')) {
    document.querySelectorAll('.post-reacted-list').forEach(function(list) {
      list.classList.remove('show');
    });
  }
});

function closeReactedList(postid) {
  var el = document.getElementById('reacted-list-' + postid);
  if (el) el.classList.remove('show');
}

function closeCommentsList(postid) {
  var el = document.getElementById('comments-section-' + postid);
  if (el) el.classList.remove('show');
}
</script>

<script>
// Post settings functions
function postedits(postid_edit) {
  var dropdown = document.getElementById(postid_edit.replace('edit', 'editpost'));
  if (dropdown) {
    dropdown.classList.toggle('show3');
  }
  // Close all other dropdowns
  var allDropdowns = document.querySelectorAll('.editpost');
  allDropdowns.forEach(function(dd) {
    if (dd !== dropdown && dd.classList.contains('show3')) {
      dd.classList.remove('show3');
    }
  });
}

function toggle_visibility(elementId) {
  var element = document.getElementById(elementId);
  if (element) {
    element.style.display = element.style.display === 'block' ? 'none' : 'block';
  }
}

// Close post settings on outside click
document.addEventListener('click', function(e) {
  if (!e.target.closest('.postsett') && !e.target.closest('.editpost')) {
    document.querySelectorAll('.editpost.show3').forEach(function(dropdown) {
      dropdown.classList.remove('show3');
    });
  }
});
</script>

<script>
// Follow user function for new users
function followUser(userId, userName) {
  if (confirm('Follow ' + userName + '?')) {
    // Create a form to submit the follow request
    var form = document.createElement('form');
    form.method = 'POST';
    form.action = 'follow-user.jsp';
    
    var userIdInput = document.createElement('input');
    userIdInput.type = 'hidden';
    userIdInput.name = 'userId';
    userIdInput.value = userId;
    
    var csrfInput = document.createElement('input');
    csrfInput.type = 'hidden';
    csrfInput.name = 'csrf';
    csrfInput.value = document.getElementById('csrf-reply_click').value;
    
    form.appendChild(userIdInput);
    form.appendChild(csrfInput);
    document.body.appendChild(form);
    form.submit();
  }
}

// Big follow button hover effects
document.addEventListener('DOMContentLoaded', function() {
  const followButtons = document.querySelectorAll('.big-follow-btn');
  followButtons.forEach(button => {
    button.addEventListener('mouseenter', function() {
      this.style.transform = 'translateY(-2px) scale(1.05)';
      this.style.boxShadow = '0 8px 25px rgba(29, 161, 242, 0.3)';
    });
    
    button.addEventListener('mouseleave', function() {
      this.style.transform = 'translateY(0) scale(1)';
      this.style.boxShadow = 'var(--shadow-md)';
    });
  });
});
</script>