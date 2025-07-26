<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.thynkzone.jsp.*" %>
<%@page import="java.sql.*" %>
<%@ page import="java.util.HashSet" %>
<%@ page import="antisamyfile.antisamy" %>

<!DOCTYPE html>
	<html lang = "en">
	<head>
	<link rel="icon" href="icon/favicon.ico" type="image/x-icon">
	
	<%
		try
		{
			 
		 	String ix = db.userid(request);
		 	String tester = ix.concat("a");

		 	String[] fetches = db.nameico(ix);
		String pname = fetches[0];
		String psmall = "img/".concat(fetches[1]);
		String useris=null;
		String usname=null;

		if(request.getParameter("userId") != null) {
		useris = antisamy.safe(request.getParameter("userId"));
		if(!db.validuid(useris)) {
			useris = null;
		}
		}
		

		if (useris != null) {
		usname = db.usinfo(useris, 0);
		}
		
		else if (useris == null) {
			response.sendRedirect("page-not-found.jsp");
			return;
		}
	%>
	
	<title>P&C | <%=usname%></title>
	<meta charset = "UTF-8">
	<meta name="description" content="<%=usname%>'s P&C (People and Culture) profile. P&C is a workplace social network for employees to share experiences, updates, memes, and insights about their jobs and organizational life."/>
<meta name="keywords" content="<%=usname%>, People and Culture, workplace social network, employee community, company culture, office memes, job updates, coworker engagement, P&C app, organizational culture, share work life, employee stories"/>
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
  --accent-haha: #f39c12;
  --accent-love: #1da1f2;
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
font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Arial, sans-serif;  background: var(--bg-main);
  color: var(--text-primary);
  margin: 0;
  min-height: 100vh;
  transition: background 0.3s, color 0.3s;
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

/* Modern Profile Layout */
.profile-banner {
  width: 100%;
  height: 320px;
  background: linear-gradient(135deg, var(--accent-primary), var(--accent-secondary));
  position: relative;
  border-radius: 0 0 var(--radius-card) var(--radius-card);
  margin-bottom: 80px;
}

.profile-banner-image {
  width: 100%;
  height: 100%;
  object-fit: cover;
  border-radius: 0 0 var(--radius-card) var(--radius-card);
}

.profile-avatar-container {
  position: absolute;
  bottom: -60px;
  left: 50%;
  transform: translateX(-50%);
  z-index: 10;
}

.profile-avatar {
  width: 140px;
  height: 140px;
  border-radius: 50%;
  border: 4px solid var(--bg-main);
  object-fit: cover;
  box-shadow: var(--shadow-lg);
}

.profile-content {
  position: relative;
  z-index: 1;
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 2rem;
  display: grid;
  grid-template-columns: 280px 1fr;
  gap: 1.5rem;
  align-items: start;
}

.profile-sidebar {
  position: sticky;
  top: 120px;
  width: 280px;
}

.profile-card {
  background: var(--bg-card);
  border-radius: var(--radius-card);
  border: 1px solid var(--border-primary);
  padding: 1rem;
  margin-bottom: 1rem;
  box-shadow: var(--shadow-md);
  backdrop-filter: blur(10px);
  transition: var(--transition);
}

.profile-card:hover {
  transform: translateY(-2px);
  box-shadow: var(--shadow-lg);
}

.profile-main {
  min-width: 0;
  max-width: 650px;
  margin: 0;
  /* Ensure posts start at the right height */
  padding-top: 0;
  /* Align to start of grid area */
  align-self: start;
}

.profile-header {
  text-align: center;
  margin-bottom: 1rem;
}

.profile-name {
  font-size: 1.5rem;
  font-weight: 700;
  margin: 0 0 1rem 0;
  color: var(--text-primary);
  text-align: center;
}

.profile-username {
  font-size: 1.1rem;
  color: var(--text-secondary);
  margin-bottom: 1rem;
}

.profile-stats {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 0.5rem;
  margin-bottom: 1rem;
}

.stat-item {
  background: var(--bg-tertiary);
  padding: 0.75rem 0.5rem;
  border-radius: 8px;
  text-align: center;
  border: 1px solid var(--border-primary);
  transition: var(--transition);
}

.stat-item:hover {
  transform: translateY(-2px);
  background: var(--bg-card);
}

.stat-number {
  font-size: 1.2rem;
  font-weight: 700;
  color: var(--accent-primary);
  display: block;
  margin-bottom: 0.2rem;
}

.stat-label {
  font-size: 0.75rem;
  color: var(--text-secondary);
  font-weight: 500;
}

.profile-bio {
  font-size: 0.9rem;
  line-height: 1.4;
  color: var(--text-secondary);
  margin-bottom: 1rem;
  text-align: center;
}

.profile-actions {
  display: flex;
  gap: 0.5rem;
  justify-content: center;
  margin-bottom: 0.75rem;
  flex-wrap: wrap;
}

.action-btn, .profile-btn {
  background: var(--accent-primary);
  color: #fff;
  border: none;
  padding: 0.5rem 1rem;
  border-radius: 16px;
  font-weight: 600;
  cursor: pointer;
  transition: var(--transition);
  text-decoration: none;
  display: inline-flex;
  align-items: center;
  gap: 0.3rem;
  font-size: 0.8rem;
  white-space: nowrap;
}

.action-btn:hover, .profile-btn:hover {
  background: var(--accent-secondary);
  transform: translateY(-2px);
  color: #fff;
  text-decoration: none;
}

.action-btn.secondary, .profile-btn.secondary {
  background: var(--bg-tertiary);
  color: var(--text-primary);
  border: 1px solid var(--border-primary);
}

.action-btn.secondary:hover, .profile-btn.secondary:hover {
  background: var(--bg-card);
  color: var(--text-primary);
}

.action-btn.danger {
  background: var(--accent-danger);
}

.action-btn.danger:hover {
  background: #c0225a;
}

.profile-section-title {
  font-size: 1rem;
  font-weight: 600;
  margin-bottom: 0.75rem;
  color: var(--text-primary);
}

.profile-info-item, .profile-details ul li {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  margin-bottom: 0.5rem;
  font-size: 0.85rem;
  color: var(--text-secondary);
}

.profile-info-item i, .profile-details ul li i {
  color: var(--accent-primary);
  width: 16px;
}

.profile-details ul {
  list-style: none;
  padding: 0;
  margin: 0;
}

.social-links {
  display: flex;
  gap: 0.75rem;
  flex-wrap: wrap;
  justify-content: center;
  margin-top: 1rem;
}

.social-link {
  color: var(--text-secondary);
  font-size: 1.2rem;
  transition: var(--transition);
  padding: 0.5rem;
  border-radius: 8px;
  background: var(--bg-tertiary);
  border: 1px solid var(--border-primary);
}

.social-link:hover {
  color: var(--accent-primary);
  background: var(--bg-card);
  text-decoration: none;
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

/* Specific hover colors for different reaction types */
.post-action-btn[title*="Haha"]:hover {
  background: var(--accent-haha);
  color: #fff;
  border-color: var(--accent-haha);
}

.post-action-btn[title*="Love"]:hover {
  background: var(--accent-love);
  color: #fff;
  border-color: var(--accent-love);
}

/* Emoji colors in reactor lists */
.reactor-type .fa-face-laugh {
  color: var(--accent-haha) !important;
}

.reactor-type .fa-heart {
  color: var(--accent-love) !important;
}

.post-action-btn i {
  font-size: 0.9rem;
}

/* Post Settings */
.postsett {
  position: absolute;
  top: 0;
  right: 0;
}

.postsett span {
  color: var(--text-muted);
cursor: pointer;
  padding: 0.5rem;
  border-radius: 50%;
  transition: var(--transition);
  display: flex;
  align-items: center;
  justify-content: center;
  width: 32px;
  height: 32px;
}

.postsett span:hover {
  background: var(--bg-tertiary);
  color: var(--text-primary);
}

.editpost {
position: absolute;
  top: 100%;
  right: 0;
  background: var(--bg-card);
  border: 1px solid var(--border-primary);
  border-radius: 8px;
  box-shadow: var(--shadow-lg);
  min-width: 200px;
  z-index: 100;
  overflow: hidden;
  display: none;
}

.editpost.show3 {
  display: block;
}

.editpost a {
  display: flex;
  align-items: center;
  gap: 0.75rem;
  padding: 0.75rem 1rem;
  color: var(--text-primary);
text-decoration: none;
  transition: var(--transition);
  font-size: 0.9rem;
}

.editpost a:hover {
  background: var(--bg-tertiary);
}

.editpost hr {
  margin: 0;
  border: none;
  border-top: 1px solid var(--border-primary);
}

/* Comments Styling */
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

/* Empty states */
.no-comments {
text-align: center;
  padding: 1.5rem;
  color: var(--text-muted);
  font-style: italic;
  font-size: 0.9rem;
}

.empty-state-message {
text-align: center;
  padding: 2rem;
  color: var(--text-secondary);
  font-style: italic;
  background: var(--bg-card);
  border-radius: var(--radius-card);
  border: 1px solid var(--border-primary);
  margin: 1.5rem 0;
}

/* Navigation improvements */
.topnav .rights a i.fa-solid,
.topnav .rights button i.fa-solid {
  color: var(--text-primary) !important;
}

.topnav .rights a:hover i.fa-solid,
.topnav .rights button:hover i.fa-solid {
  color: #fff !important;
}

/* Responsive design */
@media (max-width: 1024px) {
  .profile-content {
    grid-template-columns: 260px 1fr;
    gap: 1.25rem;
    max-width: 1000px;
  }
  
  .profile-sidebar {
    width: 260px;
  }
  
  .profile-main {
    max-width: 580px;
  }
  
  .profile-name {
    font-size: 1.4rem;
  }
  
  .stat-number {
    font-size: 1.1rem;
  }
  
  .action-btn {
    padding: 0.45rem 0.9rem;
    font-size: 0.75rem;
  }
}

@media (max-width: 768px) {
  .profile-content {
    grid-template-columns: 1fr;
    gap: 1rem;
    padding: 0 1rem;
  }
  
  .profile-sidebar {
    position: static;
    width: auto;
  }
  
  .profile-main {
    max-width: none;
  }
  
  .profile-name {
    font-size: 1.3rem;
    margin-bottom: 0.75rem;
  }
  
  .profile-stats {
    grid-template-columns: repeat(3, 1fr);
    gap: 0.4rem;
    margin-bottom: 0.75rem;
  }
  
  .stat-item {
    padding: 0.6rem 0.4rem;
  }
  
  .stat-number {
    font-size: 1rem;
  }
  
  .stat-label {
    font-size: 0.7rem;
  }
  
  .profile-actions {
    gap: 0.4rem;
    margin-bottom: 0.6rem;
  }
  
  .action-btn {
    padding: 0.45rem 0.8rem;
    font-size: 0.7rem;
    flex: 1;
    min-width: 0;
    justify-content: center;
  }
  
  .profile-card {
    padding: 0.75rem;
    margin-bottom: 0.75rem;
  }
  
  .profile-section-title {
    font-size: 0.9rem;
    margin-bottom: 0.5rem;
  }
  
  .rating-content {
    gap: 0.75rem;
  }
  
  .rating-level a {
    font-size: 1rem;
  }
  
  .rating-points {
    font-size: 0.8rem;
  }
  
  .profile-banner {
    height: 250px;
    margin-bottom: 60px;
  }
  
  .profile-avatar {
    width: 100px;
    height: 100px;
  }
  
  .profile-avatar-container {
    bottom: -50px;
  }
  
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

@media (max-width: 480px) {
  .profile-content {
    padding: 0 0.75rem;
  }
  
  .profile-name {
    font-size: 1.3rem;
  }
  
  .profile-stats {
    grid-template-columns: 1fr;
    gap: 0.5rem;
  }
  
  .stat-item {
    padding: 0.6rem;
  }
  
  .action-btn {
    padding: 0.5rem 0.75rem;
    font-size: 0.7rem;
  }
  
  .profile-banner {
    height: 200px;
    margin-bottom: 50px;
  }
  
  .profile-avatar {
    width: 80px;
    height: 80px;
  }
  
  .profile-avatar-container {
    bottom: -40px;
  }
}

/* Overall page layout improvements */
.content {
  padding-top: 0;
  min-height: 100vh;
}

/* Remove duplicate content div styling */
#content.content {
  padding: 0;
}

/* Modal styles for reactions */
.cram {
position: relative;
}

.alllikes {
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background: var(--bg-card);
  border: 1px solid var(--border-primary);
  border-radius: var(--radius-card);
  box-shadow: var(--shadow-lg);
  padding: 1.5rem;
  max-width: 400px;
  max-height: 60vh;
  overflow-y: auto;
  z-index: 1000;
display: none;
}

.alllikes.show5 {
display: block;
}

.blurrr {
  filter: blur(2px);
  pointer-events: none;
}

.close {
position: absolute;
  top: 1rem;
  right: 1rem;
  font-size: 1.5rem;
  cursor: pointer;
  color: var(--text-muted);
}

.close:hover {
  color: var(--text-primary);
}

/* Modern React List Popup Styles */
.post-reacted-list {
  display: none;
  position: absolute;
  left: 50%;
  top: auto;
  bottom: 120%;
  transform: translateX(-50%);
  background: var(--bg-card);
  border: 1px solid var(--border-primary);
  border-radius: 12px;
  box-shadow: var(--shadow-lg);
  padding: 0.75rem;
  z-index: 1000;
  min-width: 220px;
  max-width: 300px;
  max-height: 250px;
  overflow-y: auto;
  backdrop-filter: blur(10px);
  flex-direction: column;
  gap: 0.25rem;
}

.post-reacted-list.show {
  display: flex;
}

/* Fix positioning for posts that might be cut off at bottom of screen */
.post-card {
  position: relative;
}

.post-counts {
  position: relative;
}

.reactors-toggle {
  position: relative;
}

/* Adjust modal position if it would go off-screen */
@media (max-width: 768px) {
  .post-reacted-list {
    min-width: 200px;
    max-width: 250px;
    max-height: 200px;
    /* On mobile, keep it centered */
    left: 50%;
    transform: translateX(-50%);
  }
}

@media (max-width: 480px) {
  .post-reacted-list {
    min-width: 180px;
    max-width: 220px;
    max-height: 180px;
    font-size: 0.9rem;
  }
  
  .reactor-entry {
    padding: 0.3rem 0;
  }
  
  .reacted-avatar {
    width: 24px;
    height: 24px;
  }
}

.close-reacted-list {
  position: absolute;
  top: 0.5rem;
  right: 0.75rem;
  background: none;
  border: none;
  font-size: 1.2rem;
  cursor: pointer;
  color: var(--text-muted);
  padding: 0.25rem;
  border-radius: 4px;
  transition: var(--transition);
  z-index: 1001;
}

.close-reacted-list:hover {
  color: var(--text-primary);
  background: var(--bg-tertiary);
}

.reactor-entry {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  margin-bottom: 0.25rem;
  font-size: 0.9rem;
  background: none;
  padding: 0.25rem 0;
  transition: var(--transition);
}

.reactor-entry:hover {
  background: var(--bg-tertiary);
  border-radius: 6px;
  padding: 0.25rem 0.5rem;
}

.reactor-entry a {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  text-decoration: none;
  color: inherit;
  flex: 1;
}

.reacted-avatar {
  width: 24px;
  height: 24px;
  border-radius: 50%;
  object-fit: cover;
  border: 1px solid var(--accent-primary);
  flex-shrink: 0;
}

.reactor-name {
  font-weight: 500;
  color: var(--text-primary);
  font-size: 0.9rem;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

.reactor-type {
  color: var(--accent-primary);
  font-size: 1rem;
  margin-left: 0.3rem;
  flex-shrink: 0;
  display: flex;
  align-items: center;
}

.no-reacts {
  text-align: center;
  color: var(--text-muted);
  font-style: italic;
  padding: 0.75rem;
  font-size: 0.85rem;
}

/* Page header styling */
.page-header {
  max-width: 600px;
  margin: 1.5rem auto;
  background: var(--bg-card);
  border-radius: var(--radius-card);
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

/* Page icon styling */
.page-icon {
  width: 20px;
  height: 20px;
  object-fit: contain;
  filter: brightness(0) saturate(100%) invert(29%) sepia(94%) saturate(1614%) hue-rotate(198deg) brightness(98%) contrast(97%);
}

.dark-mode .page-icon {
  filter: brightness(0) saturate(100%) invert(29%) sepia(94%) saturate(1614%) hue-rotate(198deg) brightness(98%) contrast(97%);
}

/* Modern page header with better spacing */
.page-header-modern {
  max-width: 600px;
  margin: 1.2rem auto;
  background: var(--bg-card);
  border-radius: var(--radius-card);
  padding: 1.25rem 1.5rem;
  border: 1px solid var(--border-primary);
  box-shadow: var(--shadow-md);
  text-align: center;
  backdrop-filter: blur(10px);
  transition: var(--transition);
}

.page-header-modern:hover {
  transform: translateY(-1px);
  box-shadow: var(--shadow-lg);
}

.page-title-modern {
  font-size: 1.3rem;
  font-weight: 600;
  color: var(--text-primary);
  margin-bottom: 0.3rem;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 0.5rem;
}

.page-title-modern i {
  font-size: 1.1rem;
  color: var(--accent-primary);
}

.page-subtitle-modern {
  color: var(--text-secondary);
  font-size: 0.9rem;
  line-height: 1.4;
  font-weight: 400;
  margin: 0;
}

/* Compact page header variant */
.page-header-compact {
  max-width: 500px;
  margin: 1rem auto;
  background: var(--bg-card);
  border-radius: 12px;
  padding: 1rem 1.25rem;
  border: 1px solid var(--border-primary);
  box-shadow: var(--shadow-md);
  text-align: center;
  backdrop-filter: blur(10px);
}

.page-title-compact {
  font-size: 1.2rem;
  font-weight: 600;
  color: var(--text-primary);
  margin-bottom: 0.25rem;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 0.4rem;
}

.page-title-compact i {
  font-size: 1rem;
  color: var(--accent-primary);
}

.page-subtitle-compact {
  color: var(--text-secondary);
  font-size: 0.85rem;
  line-height: 1.4;
  font-weight: 400;
  margin: 0;
}

/* Responsive page headers */
@media (max-width: 768px) {
  .page-header, .page-header-modern {
    margin: 1rem;
    padding: 1rem;
  }
  
  .page-title, .page-title-modern {
    font-size: 1.2rem;
  }
  
  .page-title i, .page-title-modern i {
    font-size: 1rem;
  }
  
  .page-subtitle, .page-subtitle-modern {
    font-size: 0.85rem;
  }
  
  .page-header-compact {
    margin: 0.75rem;
    padding: 0.875rem 1rem;
  }
  
  .page-title-compact {
    font-size: 1.1rem;
  }
  
  .page-subtitle-compact {
    font-size: 0.8rem;
  }
}

/* Ensure post cards are properly contained */
.profile-main .post-card {
  background: var(--bg-card);
  border-radius: var(--radius-card);
  border: 1px solid var(--border-primary);
  margin-bottom: 1.5rem;
  padding: 1.5rem;
  box-shadow: var(--shadow-md);
  backdrop-filter: blur(10px);
  transition: var(--transition);
  /* Allow overflow for modals */
  overflow: visible;
}

.profile-main .post-card:hover {
  transform: translateY(-2px);
  box-shadow: var(--shadow-lg);
}

/* Remove top margin from first post card */
.profile-main .post-card:first-child {
  margin-top: 0;
}

.profile-section-title {
  font-size: 1rem;
  font-weight: 600;
  margin-bottom: 0.75rem;
  color: var(--text-primary);
}

.rating-content {
  display: flex;
  justify-content: space-between;
  align-items: center;
  gap: 1rem;
}

.rating-level a {
  color: var(--accent-primary);
  text-decoration: none;
  font-size: 1.1rem;
  font-weight: 600;
  transition: var(--transition);
}

.rating-level a:hover {
  color: var(--accent-secondary);
  text-decoration: none;
}

.rating-points {
  display: flex;
  align-items: center;
  font-size: 0.85rem;
  color: var(--text-secondary);
}

.rating-points i {
  margin-left: 0.25rem;
  color: var(--accent-warning);
  font-size: 1rem;
}

/* Compact social links */
.social-links {
  display: flex;
  gap: 0.5rem;
  flex-wrap: wrap;
  justify-content: center;
  margin-top: 0.75rem;
}

.social-link {
  color: var(--text-secondary);
  font-size: 1rem;
  transition: var(--transition);
  padding: 0.4rem;
  border-radius: 6px;
  background: var(--bg-tertiary);
  border: 1px solid var(--border-primary);
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
  width: 100%;
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
    max-width: 100%;
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
    margin: 0.5rem 0.2rem;
  }
  .modern-search-input {
    font-size: 0.9rem;
    padding: 0.5rem 0.5rem;
  }
  .modern-search-btn {
    width: 32px;
    height: 32px;
  }
}

.dark-mode .page-icon {
  filter: brightness(0) saturate(100%) invert(29%) sepia(94%) saturate(1614%) hue-rotate(198deg) brightness(98%) contrast(97%);
}

/* Report Profile Modal Styling */
.editprorep {
  display: none;
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background: var(--bg-card);
  border: 1px solid var(--border-primary);
  border-radius: var(--radius-card);
  box-shadow: var(--shadow-lg);
  padding: 1.5rem;
  min-width: 300px;
  max-width: 400px;
  z-index: 1000;
  backdrop-filter: blur(10px);
}

.editprorep.show4 {
  display: block;
}

.editprorep p {
  color: var(--text-primary);
  font-weight: 600;
  margin-bottom: 1rem;
  text-align: center;
}

.editprorep a {
  display: block;
  padding: 0.75rem 1rem;
  color: var(--text-primary);
  text-decoration: none;
  transition: var(--transition);
  border-radius: 8px;
  margin-bottom: 0.25rem;
}

.editprorep a:hover {
  background: var(--bg-tertiary);
  color: var(--accent-primary);
}

.editprorep hr {
  margin: 0.5rem 0;
  border: none;
  border-top: 1px solid var(--border-primary);
}

/* Modern page header with better spacing */
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

			if (useris != null) {
				
				int thoughts = db.thidpr(useris, 1);
				int ideas = db.thidpr(useris, 2);
				int projects = db.thidpr(useris, 3);
				boolean thy = db.identify(ix, useris, 2);
				boolean idl = db.identify(ix, useris, 0);
				boolean sent = db.identify(ix, useris, 6);
				boolean recieved = db.identify(ix, useris, 7);
				boolean fan = db.identify(ix, useris, 1);

				String messengerlink = db.usinfo(useris, 9);
				String bio = base64.de(db.usinfo(useris, 4)).replaceAll("(\r\n|\n)", "<br>"); //not more than 150 chars
				int mutuals = db.countmutualthy(ix, useris);
				String works = db.usinfo(useris, 6);
				int age = Integer.valueOf(db.usinfo(useris, 7));
				String gen = db.usinfo(useris, 3);
				String from = db.usinfo(useris, 5);
				String relation = db.usinfo(useris, 8);
				int fanscount = db.fans(useris);
				String fb = db.usinfo(useris, 10);
				String insta = db.usinfo(useris, 11);
				int rating = db.countrating(useris);
				String level = db.getlevel(rating);
			
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
	
	<div id="content" class="content">
			
		<!-- Modern Profile Banner -->
		<div class="profile-banner">
			<%if (db.usinfo(useris, 2) != null) {%>
			<img class="profile-banner-image" src="img/<%=db.usinfo(useris, 2)%>" alt="Profile banner"/>
			<%}%>
			
			<!-- Profile Avatar -->
			<div class="profile-avatar-container">
				<%if (db.usinfo(useris, 1) != null) {%>
				<img class="profile-avatar" src="img/<%=db.usinfo(useris, 1)%>" alt="<%=usname%>'s profile picture"/>
			<%}
			else {%>
				<img class="profile-avatar" src="img/TH_PO_jWrhhqKc_238b3f45-c35a-47fc-afb9-f80800ffbc8b_XUfYX89F.png" alt="<%=usname%>'s profile picture"/>
			<%}%>
			</div>
			  </div>
		
		<!-- Profile Content Grid -->
		<div class="profile-content">
			
			<!-- Profile Sidebar -->
			<div class="profile-sidebar">
				
				<!-- Profile Name and Stats Card -->
				<div class="profile-card">
					<h1 class="profile-name"><%=usname%></h1>
					
					<!-- Profile Stats -->
					<div class="profile-stats">
						<div class="stat-item">
							<span class="stat-number"><%=thoughts%></span>
							<span class="stat-label">Meme<%if(thoughts > 1 || thoughts == 0){out.print("s");}%></span>
						</div>
						<div class="stat-item">
							<span class="stat-number"><%=ideas%></span>
							<span class="stat-label">Fact<%if(ideas > 1 || ideas == 0){out.print("s");}%></span>
						</div>
						<div class="stat-item">
							<span class="stat-number"><%=projects%></span>
							<span class="stat-label">Update<%if(projects > 1 || projects == 0){out.print("s");}%></span>
			  </div>
		   </div>

					<!-- Profile Actions -->
					<%if(!ix.equals(useris)) {%>
					<div class="profile-actions">
						<% if (!thy && !sent && !recieved) { %>
							<a class="action-btn frn<%=useris%>" href="javascript:void(0);" onClick="reply_click5(this.className)">
								<i class="fa-solid fa-user-plus"></i>Ask to be Co-workers
							</a>
						<%} else if (thy) { %>
							<a class="action-btn danger ufr<%=useris%>" href="javascript:void(0);" onClick="reply_click5(this.className)">
								<i class="fa-solid fa-user-minus"></i>Remove as Co-worker
							</a>
						<%} else if (sent) { %>
							<a class="action-btn secondary cfr<%=useris%>" href="javascript:void(0);" onClick="reply_click5(this.className)">
								<i class="fa-solid fa-user-clock"></i>Cancel Request
							</a>
						<%} else if (recieved) { %>
							<a class="action-btn afr<%=useris%>" href="javascript:void(0);" onClick="reply_click5(this.className)">
								<i class="fa-solid fa-user-check"></i>Accept Request
							</a>
			<%}%>
			
						<% if (!idl) { %>
							<a class="action-btn secondary idz<%=useris%>" href="javascript:void(0);" onClick="reply_click5(this.className)">
								<i class="fa-solid fa-star"></i>Follow
							</a>
						<%} else if (idl) { %>
							<a class="action-btn secondary uiz<%=useris%>" href="javascript:void(0);" onClick="reply_click5(this.className)">
								<i class="fa-solid fa-star-half-stroke"></i>Remove as Following
							</a>
			<%}%>
			</div>
					<%} else {%>
					<div class="profile-actions">
						<a href="settings.jsp" class="action-btn">
							<i class="fa-solid fa-gear"></i>Edit your profile
						</a>
			</div>
					<%}%>
					
					<!-- Additional Action Icons -->
					<div style="display: flex; justify-content: center; gap: 1rem; margin-top: 1rem;">
	<% if (fan) {%>
							<div title="Your Fan" style="color: var(--accent-primary);">
								<i class="fa-solid fa-users" style="font-size: 1.5rem;"></i>
							</div>
	<%}%>
	
	<% if (thy) {%>
							<a href="https://m.me/<%=messengerlink%>" class="social-link" title="Send Message">
								<i class="fa-brands fa-facebook-messenger"></i>
							</a>
	<%}%>	

	<% if (idl || thy) {%>
							<button class="social-link" onclick="repopro('editprorep');" title="Report Profile" style="border: none; background: var(--bg-tertiary);">
								<i class="fa-solid fa-flag"></i>
							</button>
	<div id="editprorep" class="editprorep">
								<p style="color: var(--text-primary); margin-bottom: 0.5rem;">Report this profile on the basis of</p>
								<a id="re1<%=useris%>" href="javascript:void(0);" onClick="reply_click6(this.id)">Political controversy</a>
								<hr style="margin: 0.5rem 0; border-color: var(--border-primary);">
								<a id="re2<%=useris%>" href="javascript:void(0);" onClick="reply_click6(this.id)">Fake account</a>
								<hr style="margin: 0.5rem 0; border-color: var(--border-primary);">
								<a id="re3<%=useris%>" href="javascript:void(0);" onClick="reply_click6(this.id)">Partial or full nudity</a>
								<hr style="margin: 0.5rem 0; border-color: var(--border-primary);">
								<a id="re4<%=useris%>" href="javascript:void(0);" onClick="reply_click6(this.id)">Other</a>
		</div>
	<%}%>
	</div>
</div>
				
				<!-- Rating Card -->
				<div class="profile-card" id="ajaxify-totalpoints">
					<h3 class="profile-section-title">P&C Rating</h3>
					<div class="rating-content">
						<div class="rating-level">
							<%-- Add icon before the level name, matching about-us.jsp --%>
							<% String iconClass = ""; String iconName = ""; String iconTitle = level;
							   if ("Novice".equals(level)) { iconClass = "novice"; iconName = "fa-seedling"; }
							   else if ("Social".equals(level)) { iconClass = "social"; iconName = "fa-comments"; }
							   else if ("Engaged".equals(level)) { iconClass = "engaged"; iconName = "fa-handshake"; }
							   else if ("Pro".equals(level)) { iconClass = "pro"; iconName = "fa-medal"; }
							   else if ("Leader".equals(level)) { iconClass = "leader"; iconName = "fa-users-line"; }
							   else if ("Executive".equals(level)) { iconClass = "executive"; iconName = "fa-chess-king"; }
							   else if ("Visionary".equals(level)) { iconClass = "visionary"; iconName = "fa-lightbulb"; }
							   else if ("Ambassador".equals(level)) { iconClass = "ambassador"; iconName = "fa-globe"; }
							   else if ("Chief".equals(level)) { iconClass = "chief"; iconName = "fa-crown"; }
							%>
							<span class="rating-icon <%=iconClass%>" style="margin-right: 0.5em; vertical-align: middle;">
							  <i class="fa-solid <%=iconName%>"></i>
							</span>
							<a style="color: var(--accent-primary); text-decoration: none; font-size: 1.1rem; font-weight: 600; vertical-align: middle;" href="about-us.jsp#ratings"><%=level%></a>
						</div>
						<div class="rating-points">
							<span style="color: var(--text-secondary); font-size: 0.85rem;">Total Points: <%=rating%></span>
							<i class="fa-brands fa-gg-circle" style="color: var(--accent-warning); font-size: 1rem; margin-left: 0.25rem;"></i>
						</div>
					</div>
				</div>
				
				<!-- Bio Card -->
<% if (bio != null) {%>
				<div class="profile-card">
					<h3 style="color: var(--text-primary); margin: 0 0 1rem 0; font-size: 1.1rem; text-align: center;">Quote</h3>
					<div class="profile-bio">"<%=bio%>"</div>
				</div>
<%}%>

				<!-- Mutual Co-workers -->
<%if (!ix.equals(useris) && mutuals != 0){%>
				<div class="profile-card">
					<h3 style="color: var(--text-primary); margin: 0 0 1rem 0; font-size: 1.1rem; text-align: center;">Relations</h3>
					<div style="text-align: center;">
						<a href="javascript:void(0);" onClick="reply_click11('<%=useris%>')" style="color: var(--accent-primary); text-decoration: none; font-weight: 600; transition: var(--transition);" onmouseover="this.style.textDecoration='underline'" onmouseout="this.style.textDecoration='none'">
							<%=mutuals%> Mutual Co-worker<%if(mutuals > 1){out.print("s");}%>
						</a>
					</div>
				</div>
<%}%>
				
				<!-- Details Card -->
				<div class="profile-card">
					<h3 style="color: var(--text-primary); margin: 0 0 1rem 0; font-size: 1.1rem; text-align: center;">Details</h3>
					<div class="profile-details">
<ul>
<% 
String workplace = db.usinfo(useris, 14); // job/workplace
String position = db.usinfo(useris, 15); // position
if(workplace != null && !workplace.trim().isEmpty()) { %>
    <li>
        <i class="fa-solid fa-building"></i>
        <span>Works at <%=workplace%><% if(position != null && !position.trim().isEmpty()) { out.print(" as " + position); } %></span>
    </li>
<% } else if(position != null && !position.trim().isEmpty()) { %>
    <li>
        <i class="fa-solid fa-id-badge"></i>
        <span>Position: <%=position%></span>
    </li>
<% } %>
<%if(works != null) {%>
							<li>
								<i class="fa-solid fa-briefcase"></i>
								<span>Works as <%=works%></span>
							</li>
<%}%>

<%if(gen != null && age > 0) {%>
							<li>
								<i class="fa-solid fa-birthday-cake"></i>
								<span><%=gen%>, <%=age%> years old</span>
							</li>
<%}%>

<%if(from != null) {%>
							<li>
								<i class="fa-solid fa-location-dot"></i>
								<span>Lives in <%=from%></span>
							</li>
<%}%>

<%if(relation != null) {%>
							<li>
								<i class="fa-solid fa-heart"></i>
								<span>Currently <%=relation%></span>
							</li>
<%}%>

<%if(fanscount != 0) {%>
							<li>
								<i class="fa-solid fa-users"></i>
								<span>Has <%if (fanscount > 1000) {out.print(millionaize.main(fanscount));} else {out.print(fanscount);}%> Follower<%if(fanscount > 1){out.print("s");}%></span>
							</li>
<%}%>
</ul>
</div>

					<!-- Social Links -->
					<%if(fb != null || insta != null) {%>
					<div class="social-links">
<%if(fb != null) {%>
						<a href="https://www.facebook.com/<%=fb%>" class="social-link" title="Facebook">
							<i class="fa-brands fa-facebook-f"></i>
						</a>
<%}%>

<%if(insta != null) {%>
						<a href="https://www.instagram.com/<%=insta%>" class="social-link" title="Instagram">
							<i class="fa-brands fa-instagram"></i>
						</a>
<%}%>
					</div>
					<%}%>
				</div>
			</div>
	
			<!-- Posts Section -->
			<div class="profile-main">
				<!-- Posts go here -->
		
	<%
	try
	{
		String msg=session.getAttribute("msg").toString();
		out.print("<p class = 'notifmsg'>"+msg+"</p>");
		session.removeAttribute("msg");
	} catch (Exception ex){}
	%>

	<%

	
	Connection conn=null;
	Connection conn2=null;
	ResultSet rs=null;
	ResultSet rs2=null;
	ResultSet rs3=null;
	ResultSet rsspc=null;
	ResultSet rsspc2=null;
	ResultSet rscomments = null;
	PreparedStatement pstmt = null;
	PreparedStatement pstmt2 = null;
	PreparedStatement pstmt3 = null;
	PreparedStatement pstmt4 = null;
	PreparedStatement pstmt5 = null;
	PreparedStatement pstmtspc = null;
	PreparedStatement pstmtcomments = null;

	
	Class.forName(db.name());
	String unamef = db.uname().concat("i");
	String passf = db.pass().concat("09");
	conn=(Connection)DriverManager.getConnection(db.urlth(),unamef,passf);


	String posttext = null;
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
	String postid;
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
	
	HashSet<String> mylist = new HashSet<String>();
	
	
	
	
	String qryspc="select * from notif WHERE liker =? AND liketype > 5";
	pstmt = conn.prepareStatement(qryspc, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	pstmt.setString(1, ix);
	rsspc=pstmt.executeQuery();
	

	while (rsspc.next()) {
		if (rsspc.getInt(6) == 6) {
			hiaposter = rsspc.getString(5);
			
			String qryspc2="select * from posts WHERE posterid =?";
			pstmtspc = conn.prepareStatement(qryspc2, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			pstmtspc.setString(1, hiaposter);
			rsspc2=pstmtspc.executeQuery();
			
			while (rsspc2.next()) {
				mylist.add(rsspc2.getString(4));
			}
			continue;
		}
		mylist.add(rsspc.getString(4));
	}
	
	
	
	
	

	
if (useris.equals(ix)) {
	String qry="select * from posts WHERE posterid =?";
	pstmt2 = conn.prepareStatement(qry, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	pstmt2.setString(1, ix);
	rs=pstmt2.executeQuery();
	
	
	while(rs.absolute(gui))
	{
		
		posterid = rs.getString(2);
		postid = rs.getString(4);
		posttype = rs.getInt(7);
		privacy = rs.getInt(8);
		likescount = db.countlikers(postid, posterid);
		commentscount  = db.countcommentators(postid, posterid);
		
		String[] psfetches = db.nameico(posterid);
		String psfullname = psfetches[0];
		String pspp = "img/".concat(psfetches[1]);

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
        <a href="profile.jsp?userId=<%=posterid%>" class="post-profile-name"><%=psfullname%></a>
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
        <span id="<%=postid%>edit" onclick="postedits(this.id)"><i class="fa-solid fa-ellipsis"></i></span>
        <div id="<%=postid%>editpost" class="editpost">
          <a class="edt<%=posterid%>" id="edt<%=postid%>" href="javascript:void(0);" onClick="reply_click4(this.id, this.className)">
            <i class="fa-solid fa-pen"></i> Edit post
          </a>
          <hr>
          <a class="dlt<%=posterid%>" id="dlt<%=postid%>" href="javascript:void(0);" onClick="reply_click3(this.id, this.className)">
            <i class="fa-solid fa-trash"></i> Delete post
          </a>
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
             String qryReacted = "select * from notif WHERE postid =? AND (liketype = 1 OR liketype = 2)";
             PreparedStatement pstmtReacted = conn.prepareStatement(qryReacted, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
             pstmtReacted.setString(1, postid);
             ResultSet rsReacted = pstmtReacted.executeQuery();
             boolean hasReacted = false;
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
               int reactType = rsReacted.getInt(6); // 1 = Haha, 2 = Love
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
                    <% if (posterid.equals(ix)) { %>
                      <!-- Edit comment on your own post - use edit-my-comment.jsp -->
                      <a href="javascript:void(0);" onClick="reply_click7('<%=commenterId%>', '<%=postid%>', '<%=ntfno%>', '<%=base64.en(commentText)%>', '<%=posterid%>')" class="comment-edit">
                        <i class="fa-solid fa-pen"></i>
                      </a>
                    <% } else { %>
                      <!-- Edit comment on someone else's post - use edit-comment.jsp -->
                      <a href="javascript:void(0);" onClick="reply_click7_other('<%=commenterId%>', '<%=postid%>', '<%=ntfno%>', '<%=base64.en(commentText)%>', '<%=posterid%>')" class="comment-edit">
                        <i class="fa-solid fa-pen"></i>
                      </a>
                    <% } %>
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
		   <%
		   		gui--;		
		   }
	}
	



	else if (!ix.equals(useris)) {
	
		
		if (thy && idl) {
			
			
			String qry2="select * from posts WHERE posterid =? AND (privacy = 1 OR privacy = 2 OR privacy = 3)";
			pstmt3 = conn.prepareStatement(qry2, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			pstmt3.setString(1, useris);
			rs2=pstmt3.executeQuery();
			//st2 is user db
			
			
			while(rs2.absolute(gui))
			{
				
				posterid = rs2.getString(2);
				postid = rs2.getString(4);
				posttype = rs2.getInt(7);
				privacy = rs2.getInt(8);
				likescount = db.countlikers(postid, posterid);
				commentscount  = db.countcommentators(postid, posterid);
				
				if (!mylist.contains(postid)) {
				
				String[] psfetches = db.nameico(posterid);
				String psfullname = psfetches[0];
				String pspp = "img/".concat(psfetches[1]);

						imdir = null;
						posttext  = base64.de(rs2.getString(5)).replaceAll("(\r\n|\n)", "<br>");
						yourpostp = rs2.getString(6);
						if (yourpostp != null) {
						imdir = "img/".concat(yourpostp);
						}
				   %>
				   
<div id="ajaxify<%=postid%>">
  <div class="post-card" id="<%=postid%>">
    <div class="post-header">
      <img class="post-profile-img" src="<%=pspp%>" alt="<%=psfullname%>" />
      <div>
        <a href="profile.jsp?userId=<%=posterid%>" class="post-profile-name"><%=psfullname%></a>
        <div class="post-meta-info">
          <div class="post-time"><%=db.timecon(ix, rs2.getString(9))%></div>
          <div class="post-cat-priv">
            <% if (posttype == 1) { %>Meme<% } else if (posttype == 2) { %>Fact<% } else if (posttype == 3) { %>Update<% } %>
            &nbsp;•&nbsp;
            <% if (privacy == 3) { %>Co-workers &amp; Followers<% } else if (privacy == 2) { %>Co-workers<% } else if (privacy == 1) { %>Followers<% } %>
				   </div>
        </div>
      </div>
      <!-- Post Settings Menu -->
				   <div class="postsett">
        <span id="<%=postid%>edit" onclick="postedits(this.id)"><i class="fa-solid fa-ellipsis"></i></span>
        <div id="<%=postid%>editpost" class="editpost">
          <a class="hid<%=posterid%>" id="hid<%=postid%>" href="javascript:void(0);" onClick="reply_click2(this.id, this.className)">
            <i class="fa-solid fa-eye-slash"></i> Hide Post
          </a>
          <hr>
          <a class="hia<%=posterid%>" id="hia<%=postid%>" href="javascript:void(0);" onClick="reply_click2(this.id, this.className)">
            <i class="fa-solid fa-user-slash"></i> Hide all posts of <%
		if(psfullname.contains(" ")){
		String psfullname2= psfullname.substring(0, psfullname.indexOf(" ")); 
	    out.println(psfullname2);
            }%>
          </a>
		<hr>
          <a class="report" id="report" href="javascript:void(0);" onclick="toggle_visibility('<%=postid%>editpostrep');">
            <i class="fa-solid fa-flag"></i> Report Post
          </a>
		</div>
		</div>
      
      <!-- Report Post Modal -->
		<div id="<%=postid%>editpostrep" class="editpostrep">
		<button type="button" class="close-report-modal" onclick="document.getElementById('<%=postid%>editpostrep').style.display='none';">&times;</button>
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
             String qryReacted = "select * from notif WHERE postid =? AND (liketype = 1 OR liketype = 2)";
             PreparedStatement pstmtReacted = conn.prepareStatement(qryReacted, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
             pstmtReacted.setString(1, postid);
             ResultSet rsReacted = pstmtReacted.executeQuery();
             boolean hasReacted = false;
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
               int reactType = rsReacted.getInt(6); // 1 = Haha, 2 = Love
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
                    <% if (posterid.equals(ix)) { %>
                      <!-- Edit comment on your own post - use edit-my-comment.jsp -->
                      <a href="javascript:void(0);" onClick="reply_click7('<%=commenterId%>', '<%=postid%>', '<%=ntfno%>', '<%=base64.en(commentText)%>', '<%=posterid%>')" class="comment-edit">
                        <i class="fa-solid fa-pen"></i>
                      </a>
                    <% } else { %>
                      <!-- Edit comment on someone else's post - use edit-comment.jsp -->
                      <a href="javascript:void(0);" onClick="reply_click7_other('<%=commenterId%>', '<%=postid%>', '<%=ntfno%>', '<%=base64.en(commentText)%>', '<%=posterid%>')" class="comment-edit">
                        <i class="fa-solid fa-pen"></i>
                      </a>
                    <% } %>
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
		
				   <%
					}
				   		gui--;		
				   }
			
		}
		
		
	else if (thy) {
			//&& !idl since else if
		
		String qry2="select * from posts WHERE posterid =? AND (privacy = 2 OR privacy = 3)";
		pstmt4 = conn.prepareStatement(qry2, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		pstmt4.setString(1, useris);
		rs2=pstmt4.executeQuery();
		//st2 is user db
		
		
		while(rs2.absolute(gui))
		{
			
			posterid = rs2.getString(2);
			postid = rs2.getString(4);
			posttype = rs2.getInt(7);
			privacy = rs2.getInt(8);
			likescount = db.countlikers(postid, posterid);
			commentscount  = db.countcommentators(postid, posterid);
			
			if (!mylist.contains(postid)) {
			
			String[] psfetches = db.nameico(posterid);
			String psfullname = psfetches[0];
			String pspp = "img/".concat(psfetches[1]);

					imdir = null;
					posttext  = base64.de(rs2.getString(5)).replaceAll("(\r\n|\n)", "<br>");
					yourpostp = rs2.getString(6);
					if (yourpostp != null) {
					imdir = "img/".concat(yourpostp);
					}
			   %>
			   
<div id="ajaxify<%=postid%>">
  <div class="post-card" id="<%=postid%>">
    <div class="post-header">
      <img class="post-profile-img" src="<%=pspp%>" alt="<%=psfullname%>" />
      <div>
        <a href="profile.jsp?userId=<%=posterid%>" class="post-profile-name"><%=psfullname%></a>
        <div class="post-meta-info">
          <div class="post-time"><%=db.timecon(ix, rs2.getString(9))%></div>
          <div class="post-cat-priv">
            <% if (posttype == 1) { %>Meme<% } else if (posttype == 2) { %>Fact<% } else if (posttype == 3) { %>Update<% } %>
            &nbsp;•&nbsp;
            <% if (privacy == 3) { %>Co-workers &amp; Followers<% } else if (privacy == 2) { %>Co-workers<% } else if (privacy == 1) { %>Followers<% } %>
			   </div>
        </div>
      </div>
      <!-- Post Settings Menu -->
			   <div class="postsett">
        <span id="<%=postid%>edit" onclick="postedits(this.id)"><i class="fa-solid fa-ellipsis"></i></span>
        <div id="<%=postid%>editpost" class="editpost">
          <a class="hid<%=posterid%>" id="hid<%=postid%>" href="javascript:void(0);" onClick="reply_click2(this.id, this.className)">
            <i class="fa-solid fa-eye-slash"></i> Hide Post
          </a>
          <hr>
          <a class="hia<%=posterid%>" id="hia<%=postid%>" href="javascript:void(0);" onClick="reply_click2(this.id, this.className)">
            <i class="fa-solid fa-user-slash"></i> Hide all posts of <%
	if(psfullname.contains(" ")){
	String psfullname2= psfullname.substring(0, psfullname.indexOf(" ")); 
    out.println(psfullname2);
            }%>
          </a>
	<hr>
          <a class="report" id="report" href="javascript:void(0);" onclick="toggle_visibility('<%=postid%>editpostrep');">
            <i class="fa-solid fa-flag"></i> Report Post
          </a>
	</div>
	</div>
      
      <!-- Report Post Modal -->
	<div id="<%=postid%>editpostrep" class="editpostrep">
	<button type="button" class="close-report-modal" onclick="document.getElementById('<%=postid%>editpostrep').style.display='none';">&times;</button>
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
             String qryReacted = "select * from notif WHERE postid =? AND (liketype = 1 OR liketype = 2)";
             PreparedStatement pstmtReacted = conn.prepareStatement(qryReacted, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
             pstmtReacted.setString(1, postid);
             ResultSet rsReacted = pstmtReacted.executeQuery();
             boolean hasReacted = false;
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
               int reactType = rsReacted.getInt(6); // 1 = Haha, 2 = Love
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
                    <% if (posterid.equals(ix)) { %>
                      <!-- Edit comment on your own post - use edit-my-comment.jsp -->
                      <a href="javascript:void(0);" onClick="reply_click7('<%=commenterId%>', '<%=postid%>', '<%=ntfno%>', '<%=base64.en(commentText)%>', '<%=posterid%>')" class="comment-edit">
                        <i class="fa-solid fa-pen"></i>
                      </a>
                    <% } else { %>
                      <!-- Edit comment on someone else's post - use edit-comment.jsp -->
                      <a href="javascript:void(0);" onClick="reply_click7_other('<%=commenterId%>', '<%=postid%>', '<%=ntfno%>', '<%=base64.en(commentText)%>', '<%=posterid%>')" class="comment-edit">
                        <i class="fa-solid fa-pen"></i>
                      </a>
                    <% } %>
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
		
			   <%
				}
			   		gui--;		
			   }
		
	}
	
	
	
	
	
	
	else if (idl) {
			//not thy since else if
		
		String qry3="select * from posts WHERE posterid =? AND (privacy = 1 OR privacy = 3)";
		pstmt5 = conn.prepareStatement(qry3, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		pstmt5.setString(1, useris);
		rs3=pstmt5.executeQuery();
		
		
		while(rs3.absolute(gui))
		{
			
			posterid = rs3.getString(2);
			postid = rs3.getString(4);
			posttype = rs3.getInt(7);
			privacy = rs3.getInt(8);
			likescount = db.countlikers(postid, posterid);
			commentscount  = db.countcommentators(postid, posterid);
			
			if (!mylist.contains(postid)) {
			
			String[] psfetches = db.nameico(posterid);
			String psfullname = psfetches[0];
			String pspp = "img/".concat(psfetches[1]);

					imdir = null;
					posttext  = base64.de(rs3.getString(5)).replaceAll("(\r\n|\n)", "<br>");
					yourpostp = rs3.getString(6);
					if (yourpostp != null) {
					imdir = "img/".concat(yourpostp);
					}
			   %>
			   
<div id="ajaxify<%=postid%>">
  <div class="post-card" id="<%=postid%>">
    <div class="post-header">
      <img class="post-profile-img" src="<%=pspp%>" alt="<%=psfullname%>" />
      <div>
        <a href="profile.jsp?userId=<%=posterid%>" class="post-profile-name"><%=psfullname%></a>
        <div class="post-meta-info">
          <div class="post-time"><%=db.timecon(ix, rs3.getString(9))%></div>
          <div class="post-cat-priv">
            <% if (posttype == 1) { %>Meme<% } else if (posttype == 2) { %>Fact<% } else if (posttype == 3) { %>Update<% } %>
            &nbsp;•&nbsp;
            <% if (privacy == 3) { %>Co-workers &amp; Followers<% } else if (privacy == 2) { %>Co-workers<% } else if (privacy == 1) { %>Followers<% } %>
			   </div>
        </div>
      </div>
      <!-- Post Settings Menu -->
			   <div class="postsett">
        <span id="<%=postid%>edit" onclick="postedits(this.id)"><i class="fa-solid fa-ellipsis"></i></span>
        <div id="<%=postid%>editpost" class="editpost">
          <a class="hid<%=posterid%>" id="hid<%=postid%>" href="javascript:void(0);" onClick="reply_click2(this.id, this.className)">
            <i class="fa-solid fa-eye-slash"></i> Hide Post
          </a>
          <hr>
          <a class="hia<%=posterid%>" id="hia<%=postid%>" href="javascript:void(0);" onClick="reply_click2(this.id, this.className)">
            <i class="fa-solid fa-user-slash"></i> Hide all posts of <%
	if(psfullname.contains(" ")){
	String psfullname2= psfullname.substring(0, psfullname.indexOf(" ")); 
    out.println(psfullname2);
            }%>
          </a>
	<hr>
          <a class="report" id="report" href="javascript:void(0);" onclick="toggle_visibility('<%=postid%>editpostrep');">
            <i class="fa-solid fa-flag"></i> Report Post
          </a>
	</div>
	</div>
      
      <!-- Report Post Modal -->
	<div id="<%=postid%>editpostrep" class="editpostrep">
	<button type="button" class="close-report-modal" onclick="document.getElementById('<%=postid%>editpostrep').style.display='none';">&times;</button>
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
             String qryReacted = "select * from notif WHERE postid =? AND (liketype = 1 OR liketype = 2)";
             PreparedStatement pstmtReacted = conn.prepareStatement(qryReacted, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
             pstmtReacted.setString(1, postid);
             ResultSet rsReacted = pstmtReacted.executeQuery();
             boolean hasReacted = false;
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
               int reactType = rsReacted.getInt(6); // 1 = Haha, 2 = Love
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
                    <% if (posterid.equals(ix)) { %>
                      <!-- Edit comment on your own post - use edit-my-comment.jsp -->
                      <a href="javascript:void(0);" onClick="reply_click7('<%=commenterId%>', '<%=postid%>', '<%=ntfno%>', '<%=base64.en(commentText)%>', '<%=posterid%>')" class="comment-edit">
                        <i class="fa-solid fa-pen"></i>
                      </a>
                    <% } else { %>
                      <!-- Edit comment on someone else's post - use edit-comment.jsp -->
                      <a href="javascript:void(0);" onClick="reply_click7_other('<%=commenterId%>', '<%=postid%>', '<%=ntfno%>', '<%=base64.en(commentText)%>', '<%=posterid%>')" class="comment-edit">
                        <i class="fa-solid fa-pen"></i>
                      </a>
                    <% } %>
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
		
			   <%
				}
			   		gui--;		
			   }
		
	}
	
	
	
	
	
	
	else if (!sent) {
		out.print("<div class='empty-state-message'>This person's posts are for co-workers only. Send a co-worker<br>request to see this person's posts.</div>");
	}
	else if (sent) {
		out.print("<div class='empty-state-message'>You can see this person's posts when your<br>co-worker request is accepted.</div>");
	}
	else if (recieved) {
		out.print("<div class='empty-state-message'>Accept this person's co-worker request to see this person's posts.</div>");
	}
	else {
		out.print("<div class='empty-state-message'>Make this person your co-worker or idol to see his posts.</div>");
	}
	}
	
	
	
	
	
	
	
	

			}

			
		} catch(Exception ex) {
			if (!response.isCommitted()) {
				response.sendRedirect("index.jsp");
				session.setAttribute("msg", "User possibly doesn't exist.");
			} else {
				// If response is already committed, just set the message and let the page continue
				session.setAttribute("msg", "User possibly doesn't exist.");
				out.println("<script>window.location.href='index.jsp';</script>");
			}
		}
%>

<br><br>
<p class="empty-state-message" style="max-width: 700px; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Arial, sans-serif; font-weight: 400; text-align: center; color: var(--text-secondary); padding: 2rem;">
You don't have any more posts to see.<br>Refresh to see if you have newer posts.
</p>
<br><br><br>

		</div> <!-- End profile-main -->
	</div> <!-- End profile-content -->
</div>






<script type="text/javascript">
// Sticky navigation handled by CSS - no JavaScript needed
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
					   $("#ajaxify-totalpoints").load(window.location.href + " #ajaxify-totalpoints > *");
					   window.history.pushState({} , "", "?userId="+posterid+"#"+postid);
				}
			});
		  return false;
	  }
	</script>
	
	
	
	<FORM NAME="form2" ACTION = "secpostrepdel.jsp" METHOD="POST">
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
	

	
	<FORM NAME="form3" ACTION = "posteddel.jsp" METHOD="POST">
	<INPUT TYPE="HIDDEN" NAME="naxes">
	<INPUT TYPE="HIDDEN" NAME="naxes2">
	<INPUT TYPE="HIDDEN" NAME="csrf" VALUE="<%=db.csrftoken()%>">
	</FORM>


	<script type="text/javascript">
	  function reply_click3(clicked_id, clicked_class)
	  {
		  var warn = confirm("Are you sure you want to delete this post?");
		  if (warn) {
		  document.form3.naxes.value = clicked_id;
		  document.form3.naxes2.value = clicked_class;
	      form3.submit();
	      }
	  }
	</script>




	<FORM NAME="form4" ACTION = "edit-post.jsp" METHOD="POST">
	<INPUT TYPE="HIDDEN" NAME="caxes">
	<INPUT TYPE="HIDDEN" NAME="caxes2">
	<INPUT TYPE="HIDDEN" NAME="csrf" VALUE="<%=db.csrftoken()%>">
	</FORM>
	
	
	<script type="text/javascript">
	  function reply_click4(clicked_id, clicked_class)
	  {
		  document.form4.caxes.value = clicked_id;
		  document.form4.caxes2.value = clicked_class;
	      form4.submit();
	  }
	</script>
	
	
	
	
	
	<FORM NAME="form5" ACTION = "requestsdb.jsp" METHOD="POST">
	<INPUT TYPE="HIDDEN" NAME="jiaxes">
	<INPUT TYPE="HIDDEN" NAME="csrf" VALUE="<%=db.csrftoken()%>">
	</FORM>
	
	
	<script type="text/javascript">
	  function reply_click5(clicked_class)
	  {
		  // Prevent double-clicking by disabling the button temporarily
		  var button = event.target;
		  if (button.disabled) {
		      return false;
		  }
		  
		  // Disable the button and show loading state
		  button.disabled = true;
		  var originalText = button.innerHTML;
		  button.innerHTML = '<i class="fa-solid fa-spinner fa-spin"></i> Processing...';
		  
		  // Extract the action class from the full className
		  // clicked_class contains all classes like "action-btn danger ufr12345"
		  // We need to find the class that starts with frn, ufr, cfr, afr, idz, or uiz
		  var actionClass = null;
		  var classes = clicked_class.split(' ');
		  for (var i = 0; i < classes.length; i++) {
		      var cls = classes[i];
		      if (cls.startsWith('frn') || cls.startsWith('ufr') || cls.startsWith('cfr') || 
		          cls.startsWith('afr') || cls.startsWith('idz') || cls.startsWith('uiz')) {
		          actionClass = cls;
		          break;
		      }
		  }
		  		  
		  // Only submit if we found a valid action class
		  if (actionClass) {
		      // Set form value and submit
		      document.form5.jiaxes.value = actionClass;
		      form5.submit();
		  } else {
		      // Re-enable button if no valid action class found
		      button.disabled = false;
		      button.innerHTML = originalText;
		      alert('Error: Invalid action. Please refresh the page and try again.');
		      return false;
		  }
		  
		  // Re-enable button after a timeout in case of issues
		  setTimeout(function() {
		      button.disabled = false;
		      button.innerHTML = originalText;
		  }, 10000); // 10 second timeout
	  }
	</script>
	
	
	
	
	<FORM NAME="form6" ACTION = "secprorepdel.jsp" METHOD="POST">
    		<INPUT TYPE="HIDDEN" NAME="vaaxes">
    		<INPUT TYPE="HIDDEN" NAME="csrf" VALUE="<%=db.csrftoken()%>">
			</FORM>



	<script type="text/javascript">
			  function reply_click6(clicked_id)
			  {
				  document.form6.vaaxes.value = clicked_id;
			      form6.submit();
			  }
	</script>
	
	
	
	
	<FORM NAME="form7" ACTION = "edit-my-comment.jsp" METHOD="POST">
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
			
			
			
			
	
	<FORM NAME="form7_other" ACTION = "edit-comment.jsp" METHOD="POST">
	<INPUT TYPE="HIDDEN" NAME="alixes">
	<INPUT TYPE="HIDDEN" NAME="alixes2">
	<INPUT TYPE="HIDDEN" NAME="alixes3">
	<INPUT TYPE="HIDDEN" NAME="alixes4">
	<INPUT TYPE="HIDDEN" NAME="alixes5">
	<INPUT TYPE="HIDDEN" NAME="csrf" VALUE="<%=db.csrftoken()%>">
	</FORM>
	
			
			
			<script type="text/javascript">
	  		function reply_click7_other(posteridcomm, postid, ntfno, commtext, posterid)
	  		{
		  document.form7_other.alixes.value = posteridcomm;
		  document.form7_other.alixes2.value = postid;
		  document.form7_other.alixes3.value = ntfno;
		  document.form7_other.alixes4.value = commtext;
		  document.form7_other.alixes5.value = posterid;
	      form7_other.submit();
	  		}
			</script>
			
			
			
			
	
	<FORM NAME="form11" ACTION = "mutualthynkmates.jsp" METHOD="POST">
	<INPUT TYPE="HIDDEN" NAME="mutualaxes">
	<INPUT TYPE="HIDDEN" NAME="csrf" VALUE="<%=db.csrftoken()%>">
	</FORM>
	
	
		<script type="text/javascript">
	  	function reply_click11(useris)
	  	{
		  document.form11.mutualaxes.value = useris;
	      form11.submit();
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
			
<!-- Dark Mode Toggle Script -->
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

// Legacy functions for old modal system
function alllikers(alllikes) {
  var qz = document.getElementsByClassName("alllikes");
  var pq = document.querySelectorAll(".content img:not(.sel), .content a:not(.sel), .content p:not(.sel), .content button:not(.sel), .content input:not(.sel), .content textarea:not(.sel), .content li:not(.sel), .content th:not(.sel)");
  var flag1 = 1;
  var flag2 = 1;
  
  for (var o = 0; o < qz.length; o++) {
    if (qz[o].classList.contains('show5')) {
      flag1 = 2;
    }
  }
  
  for (var b = 0; b < pq.length; b++) {
    if (pq[b].classList.contains('blurrr')) {
      flag2 = 2;
    }
  }
  
  if (flag1 === 1 && flag2 === 1) {
    document.getElementById(alllikes).classList.toggle("show5");
    for (var i = 0; i < pq.length; i++) {
      pq[i].classList.toggle("blurrr");
    }
  }
}

function allcomms(allcomments) {
				var allcomm = document.getElementById(allcomments);
				  if (allcomm.style.display !== "block") {
					allcomm.style.display = "block";
				  } else {
					allcomm.style.display = "none";
				  }
			}

function repopro(gotid) {
  document.getElementById(gotid).classList.toggle("show4");
}

// Close modal when clicking close button
document.addEventListener('click', function(e) {
  if (e.target.classList.contains('close')) {
    // Close all modals
    document.querySelectorAll('.alllikes.show5').forEach(function(modal) {
      modal.classList.remove('show5');
    });
    // Remove blur from all elements
    document.querySelectorAll('.blurrr').forEach(function(element) {
      element.classList.remove('blurrr');
    });
  }
});

// Updated window click handler for modern components
window.onclick = function(ef) {
  // Handle dropdown
  if (!ef.target.matches('.dropbtn')) {
    var myDropdown = document.getElementById("myDropdown");
    if (myDropdown && myDropdown.classList.contains('show')) {
      myDropdown.classList.remove('show');
    }
  }
  
  // Handle post settings - Updated selector
  if (!ef.target.closest('.postsett') && !ef.target.closest('.editpost')) {
    var editpost = document.getElementsByClassName("editpost");
    for (var i = 0; i < editpost.length; i++) {
      if (editpost[i].classList.contains('show3')) {
        editpost[i].classList.remove('show3');
      }
    }
  }
  
  // Handle reactions modal
  if (!ef.target.matches('.likee') && !ef.target.matches('.alllikes') && !ef.target.matches('.sel')) {
    var qz = document.getElementsByClassName("alllikes");
    for (var o = 0; o < qz.length; o++) {
      if (qz[o].classList.contains('show5')) {
        qz[o].classList.remove('show5');
      }
    }
    
    var x = document.querySelectorAll(".content img:not(.sel), .content a:not(.sel), .content p:not(.sel), .content button:not(.sel), .content input:not(.sel), .content textarea:not(.sel), .content li:not(.sel), .content th:not(.sel)");
    for (var i = 0; i < x.length; i++) {
      if (x[i].classList.contains('blurrr')) {
        x[i].classList.remove('blurrr');
      }
    }
  }
  
  // Handle profile report modal
  if (!ef.target.closest('.editprorep') && !ef.target.closest('button[onclick*="repopro"]')) {
    var profilerepo = document.getElementById("editprorep");
    if (profilerepo && profilerepo.classList.contains('show4')) {
      profilerepo.classList.remove('show4');
    }
  }
};
</script>

</body>
</html>