<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.thynkzone.jsp.*" %>
<%@ page import="antisamyfile.antisamy" %>

<!DOCTYPE html>
<html lang="en">
	<head>
	<link rel="icon" href="icon/favicon.ico" type="image/x-icon">
	<title>About P&C - People & Culture</title>
	<meta charset="UTF-8">
	<meta name="description" content="Learn about P&C (People and Culture) - the workplace social network for employees to share experiences, updates, memes, and insights about their jobs and organizational life."/>
<meta name="keywords" content="About P&C, People and Culture about, workplace social network info, employee community platform, company culture network, P&C mission, organizational culture sharing"/>
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
font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Arial, sans-serif;  background: var(--bg-main);
  color: var(--text-primary);
  margin: 0;
  min-height: 100vh;
  transition: background 0.3s, color 0.3s;
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
  text-decoration: none;
}

.rights a:hover, .rights button:hover {
  border-color: var(--accent-primary);
  color: #fff !important;
  background: var(--accent-primary) !important;
  transform: translateY(-2px) scale(1.04);
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

/* About Page Layout */
.about-container {
  max-width: 900px;
  margin: 2rem auto;
  padding: 0 1rem;
}

.about-header {
  background: var(--bg-card);
  border-radius: var(--radius-card);
  padding: 3rem 2rem;
  margin-bottom: 2rem;
  border: 1px solid var(--border-primary);
  box-shadow: var(--shadow-md);
  text-align: center;
}

.about-title {
  font-size: 2.5rem;
  font-weight: 700;
  color: var(--text-primary);
  margin-bottom: 1rem;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 1rem;
}

.about-title i {
  font-size: 2.2rem;
  color: var(--accent-primary);
}

.about-subtitle {
  color: var(--text-secondary);
  font-size: 1.2rem;
  margin: 0;
  line-height: 1.5;
}

.about-content {
  background: var(--bg-card);
  border-radius: var(--radius-card);
  padding: 2rem;
  margin-bottom: 2rem;
  border: 1px solid var(--border-primary);
  box-shadow: var(--shadow-md);
}

.about-content p {
  font-size: 1rem;
  line-height: 1.7;
  color: var(--text-primary);
  margin-bottom: 1.5rem;
}

.about-content p:last-child {
  margin-bottom: 0;
}

/* Rating System */
.rating-section {
  background: var(--bg-card);
  border-radius: var(--radius-card);
  padding: 2rem;
  margin-bottom: 2rem;
  border: 1px solid var(--border-primary);
  box-shadow: var(--shadow-md);
}

.rating-header {
  text-align: center;
  margin-bottom: 2rem;
}

.rating-title {
  font-size: 1.8rem;
  font-weight: 700;
  color: var(--text-primary);
  margin-bottom: 0.5rem;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 0.75rem;
}

.rating-title i {
  font-size: 1.6rem;
  color: var(--accent-warning);
}

.rating-subtitle {
  color: var(--text-secondary);
  font-size: 1rem;
  margin: 0;
}

.rating-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
  gap: 1rem;
  margin-top: 1.5rem;
}

.rating-card {
  background: var(--bg-tertiary);
  border-radius: 12px;
  padding: 1.25rem;
  border: 1px solid var(--border-primary);
  transition: var(--transition);
  display: flex;
  align-items: center;
  gap: 1rem;
}

.rating-card:hover {
  transform: translateY(-2px);
  background: var(--bg-card);
  box-shadow: var(--shadow-md);
}

.rating-icon {
  width: 48px;
  height: 48px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-shrink: 0;
  font-size: 1.5rem;
  color: #fff;
}

.rating-icon.novice {
  background: linear-gradient(45deg, #6b7280, #9ca3af);
}

.rating-icon.social {
  background: linear-gradient(45deg, #3b82f6, #60a5fa);
}

.rating-icon.engaged {
  background: linear-gradient(45deg, #10b981, #34d399);
}

.rating-icon.pro {
  background: linear-gradient(45deg, #f59e0b, #fbbf24);
}

.rating-icon.leader {
  background: linear-gradient(45deg, #8b5cf6, #a78bfa);
}

.rating-icon.executive {
  background: linear-gradient(45deg, #ef4444, #f87171);
}

.rating-icon.visionary {
  background: linear-gradient(45deg, #06b6d4, #22d3ee);
}

.rating-icon.ambassador {
  background: linear-gradient(45deg, #ec4899, #f472b6);
}

.rating-icon.chief {
  background: linear-gradient(45deg, #f97316, #fb923c);
}

.rating-info h3 {
  font-size: 1.1rem;
  font-weight: 600;
  color: var(--text-primary);
  margin: 0 0 0.25rem 0;
}

.rating-info p {
  font-size: 0.9rem;
  color: var(--text-secondary);
  margin: 0;
  display: flex;
  align-items: center;
  gap: 0.5rem;
}

.rating-points {
  font-weight: 600;
  color: var(--accent-warning);
}

/* Founder Section */
.founder-section {
  background: var(--bg-card);
  border-radius: var(--radius-card);
  padding: 2rem;
  margin-bottom: 2rem;
  border: 1px solid var(--border-primary);
  box-shadow: var(--shadow-md);
  text-align: center;
}

.founder-title {
  font-size: 1.5rem;
  font-weight: 600;
  color: var(--text-primary);
  margin-bottom: 1.5rem;
}

.founder-card {
  display: inline-block;
  text-decoration: none;
  color: inherit;
  transition: var(--transition);
}

.founder-card:hover {
  transform: translateY(-4px);
}

.founder-image {
  width: 200px;
  height: 206px;
  border-radius: var(--radius-card);
  border: 3px solid var(--accent-primary);
  object-fit: cover;
  margin-bottom: 1rem;
  box-shadow: var(--shadow-md);
}

.founder-name {
  font-size: 1.2rem;
  font-weight: 600;
  color: var(--text-primary);
  margin-bottom: 0.5rem;
}

.founder-link {
  color: var(--accent-primary);
  text-decoration: none;
  font-weight: 500;
}

.founder-link:hover {
  text-decoration: underline;
}

/* Footer Section */
.footer-section {
  background: var(--bg-card);
  border-radius: var(--radius-card);
  padding: 2rem;
  margin-bottom: 2rem;
  border: 1px solid var(--border-primary);
  box-shadow: var(--shadow-md);
}

.footer-section p {
  color: var(--text-secondary);
  line-height: 1.6;
  margin-bottom: 1rem;
}

.footer-section p:last-child {
  margin-bottom: 0;
}

.footer-section a {
  color: var(--accent-warning);
  text-decoration: none;
  font-weight: 500;
}

.footer-section a:hover {
  text-decoration: underline;
}

@media (max-width: 768px) {
  .about-container {
    padding: 0 0.5rem;
    margin: 1rem auto;
  }
  
  .about-header {
    padding: 2rem 1.5rem;
  }
  
  .about-title {
    font-size: 2rem;
    flex-direction: column;
    gap: 0.5rem;
  }
  
  .about-title i {
    font-size: 1.8rem;
  }
  
  .about-subtitle {
    font-size: 1rem;
  }
  
  .about-content, .rating-section, .founder-section, .footer-section {
    padding: 1.5rem;
  }
  
  .rating-grid {
    grid-template-columns: 1fr;
  }
  
  .rating-card {
    padding: 1rem;
  }
  
  .founder-image {
    width: 150px;
    height: 155px;
  }
}

.rating-info p {
  display: flex;
  flex-direction: column; /* ← this moves children vertically */
  align-items: flex-start; /* optional, aligns them to the left */
  gap: 4px;
}



</style>
</head>

<%
try {
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
      <a href="settings.jsp" title="Settings" aria-label="Settings">
        <i class="fa-solid fa-gear"></i>
      </a>
      <!-- Dark Mode Toggle -->
      <button id="darkModeToggle" title="Toggle dark mode" aria-label="Toggle dark mode">
        <i id="darkModeIcon" class="fa-solid fa-moon"></i>
      </button>
    </div>
  </div>
</nav>
	
<div id="content" class="content">
  <div class="about-container">
    <!-- About Header -->
    <div class="about-header">
      <h1 class="about-title">
        <i class="fa-solid fa-users"></i>
        About P&C
      </h1>
      <p class="about-subtitle">People & Culture - Where workplace connections thrive</p>
    </div>

    <!-- About Content -->
    <div class="about-content">
      <p>You have an idea that could change your workplace. But, that's just it. It's just an idea. You don't know where to start or how to share it with your colleagues. Share your thoughts with others at P&C and see what they think. They might be able to help you with more ideas or point you in the right direction to start making workplace improvements happen!</p>

      <p>Why is there no social networking site for professionals who want to share their workplace experiences, like company culture insights and team collaboration ideas? P&C gives workplace professionals a safe platform of their own, where they can share their experiences, collaborate with colleagues, and engage with their organizational community.</p>

      <p>Imagine being able to share your workplace ideas, cultural insights, and professional experiences with your colleagues for feedback at any time. Whether you're sharing office memes, discussing company policies, or celebrating team wins, P&C offers a one-stop platform for workplace engagement across your organization.</p>

      <p>P&C is a workplace social networking site that allows you to share your thoughts, experiences, and updates with your colleagues. Unlike other social networks, we reward you with points for your contribution. With our engagement system, the more content you share on P&C and the more interactions you have with colleagues, the more points you'll earn. Share your workplace experiences with us today!</p>

      <p>P&C is the place to share your workplace ideas with like-minded colleagues. It's a free community for employees, team leads, and workplace culture enthusiasts to share their experiences, promote workplace improvements, and ask questions. You can show your colleagues your workplace insights, cultural observations, and professional ideas. Get feedback from others and learn from their workplace experiences.</p>

      <p>"Unlimited space to share your workplace ideas, unlimited time to find like-minded colleagues, and unlimited potential to improve your organizational culture." We are a workplace social networking site that allows you to share your professional experiences with others and get feedback on them. Our goal is to help you enhance your workplace relationships and organizational culture.</p>

      <p>If you're an employee, manager, or team leader, you know that it's essential to maintain good workplace relationships and foster positive company culture. P&C is an innovative workplace social networking site that helps users share their professional experiences and workplace insights with colleagues. We believe that great workplace culture starts with open communication and shared experiences.</p>

      <p>We're building a platform that connects colleagues to share their workplace ideas and insights. By joining today, you will be able to post workplace updates, share experiences, start discussions about company culture, and connect with your colleagues. The best part? It's all happening in real time!</p>
    </div>

    <!-- Rating System -->
    <div class="rating-section" id="ratings">
      <div class="rating-header">
        <h2 class="rating-title">
          <i class="fa-solid fa-trophy"></i>
          P&C Rating System
        </h2>
        <p class="rating-subtitle">Advance through the ranks as you engage with your workplace community</p>
      </div>

      <div class="rating-grid">
        <div class="rating-card">
          <div class="rating-icon novice">
            <i class="fa-solid fa-seedling"></i>
          </div>
          <div class="rating-info">
            <h3>Novice</h3>
            <p><span class="rating-points">0 points</span>Starting your P&C journey</p>
          </div>
        </div>

        <div class="rating-card">
          <div class="rating-icon social">
            <i class="fa-solid fa-comments"></i>
          </div>
          <div class="rating-info">
            <h3>Social</h3>
            <p><span class="rating-points">10 points</span>Active in workplace discussions</p>
          </div>
        </div>

        <div class="rating-card">
          <div class="rating-icon engaged">
            <i class="fa-solid fa-handshake"></i>
          </div>
          <div class="rating-info">
            <h3>Engaged</h3>
            <p><span class="rating-points">325 points</span>Regularly contributing to culture</p>
          </div>
        </div>

        <div class="rating-card">
          <div class="rating-icon pro">
            <i class="fa-solid fa-medal"></i>
          </div>
          <div class="rating-info">
            <h3>Pro</h3>
            <p><span class="rating-points">750 points</span>Workplace culture champion</p>
          </div>
        </div>

        <div class="rating-card">
          <div class="rating-icon leader">
            <i class="fa-solid fa-users-line"></i>
          </div>
          <div class="rating-info">
            <h3>Leader</h3>
            <p><span class="rating-points">1,500 points</span>Inspiring workplace excellence</p>
          </div>
        </div>

        <div class="rating-card">
          <div class="rating-icon executive">
            <i class="fa-solid fa-chess-king"></i>
          </div>
          <div class="rating-info">
            <h3>Executive</h3>
            <p><span class="rating-points">3,000 points</span>Strategic culture contributor</p>
          </div>
        </div>

        <div class="rating-card">
          <div class="rating-icon visionary">
            <i class="fa-solid fa-lightbulb"></i>
          </div>
          <div class="rating-info">
            <h3>Visionary</h3>
            <p><span class="rating-points">6,000 points</span>Organizational culture innovator</p>
          </div>
        </div>

        <div class="rating-card">
          <div class="rating-icon ambassador">
            <i class="fa-solid fa-globe"></i>
          </div>
          <div class="rating-info">
            <h3>Ambassador</h3>
            <p><span class="rating-points">15,000 points</span>Company culture ambassador</p>
          </div>
        </div>

        <div class="rating-card">
          <div class="rating-icon chief">
            <i class="fa-solid fa-crown"></i>
          </div>
          <div class="rating-info">
            <h3>Chief</h3>
            <p><span class="rating-points">30,000 points</span>Ultimate culture architect</p>
          </div>
        </div>
      </div>
</div>

    <!-- Founder Section -->
    <div class="founder-section">
      <h2 class="founder-title">Meet the Founder</h2>
      <a href="https://github.com/mazidulfarabi" class="founder-card">
        <img class="founder-image" src="icon/founder.jpg" alt="Md. Mazidul Haque Farabi"/>
        <div class="founder-name">Md. Mazidul Haque Farabi</div>
      </a>
	<br><br>
      <a href="https://linktr.ee/mazidulfarabi" class="founder-link">linktr.ee/mazidulfarabi</a>
    </div>
	
    <!-- Footer Section -->
    <div class="footer-section">
      <p><strong><a href="terms-and-conditions.jsp" title="Privacy Policy">Privacy Policy</a></strong></p>

      <p>The icons are used from iconsfinder.com, icons8.com, flaticon.com, fontawesome.com and fonts.google.com. The fonts are also used from fonts.google.com, and all are copyright free.</p>
	
      <p>P&C Copyright © 2020 by Md Mazidul Haque Farabi. All rights reserved.</p>
	
      <p>Copyright law applies to all the pages of P&C.</p>
    </div>
	</div>
	</div>

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
  System.out.print(ex+"at about-us.jsp");
}
%>

	</body>
	</html>