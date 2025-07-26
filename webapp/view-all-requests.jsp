<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.thynkzone.jsp.*" %>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
	<head>
	<link rel="icon" href="icon/favicon.ico" type="image/x-icon">
<title>Co-worker Requests - P&C (People & Culture)</title>
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

/* Modern page header */
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

/* Stats grid */
.stats-grid {
  max-width: 800px;
  margin: 1.5rem auto;
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 1rem;
}

.stat-card {
  background: var(--bg-card);
  border-radius: 16px;
  padding: 1.5rem;
  text-align: center;
  border: 1px solid var(--border-primary);
  box-shadow: var(--shadow-md);
}

.stat-card.received {
  border-left: 4px solid var(--accent-primary);
}

.stat-card.sent {
  border-left: 4px solid var(--accent-success);
}

.stat-icon {
  width: 32px;
  height: 32px;
  margin-bottom: 0.5rem;
  filter: brightness(0) invert(1);
  transition: var(--transition);
}

.dark-mode .stat-icon {
  filter: brightness(0) invert(0);
}

.stat-title {
  font-size: 1.1rem;
  font-weight: 600;
  color: var(--text-primary);
  margin-bottom: 0.25rem;
}

.stat-count {
  font-size: 1.5rem;
  font-weight: 700;
  color: var(--accent-primary);
}

.stat-card.sent .stat-count {
  color: var(--accent-success);
}

/* Requests grid */
.requests-grid {
  max-width: 800px;
  margin: 2rem auto;
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 2rem;
}

.requests-section {
  background: var(--bg-card);
  border-radius: 16px;
  padding: 1.5rem;
  border: 1px solid var(--border-primary);
  box-shadow: var(--shadow-md);
}

.section-title {
  font-size: 1.2rem;
  font-weight: 700;
  color: var(--text-primary);
  margin-bottom: 1.5rem;
  display: flex;
  align-items: center;
  gap: 0.5rem;
}

.section-icon {
  width: 24px;
  height: 24px;
  filter: brightness(0) invert(1);
  transition: var(--transition);
}

.dark-mode .section-icon {
  filter: brightness(0) invert(0);
}

.request-card {
  display: flex;
  align-items: center;
  gap: 1rem;
  padding: 1rem;
  border-radius: 12px;
  text-decoration: none;
  color: var(--text-primary);
  transition: var(--transition);
  margin-bottom: 0.5rem;
  border: 1px solid transparent;
}

.request-card:hover {
  background: var(--bg-tertiary);
  border-color: var(--border-primary);
  transform: translateY(-2px);
}

.request-avatar {
  width: 48px;
  height: 48px;
  border-radius: 50%;
  object-fit: cover;
  border: 2px solid var(--accent-primary);
}

.request-info {
  flex: 1;
}

.request-name {
  font-size: 1.05rem;
  font-weight: 600;
  color: var(--text-primary);
  margin-bottom: 0.25rem;
}

.request-meta {
  font-size: 0.9rem;
  color: var(--text-secondary);
}

.empty-state {
  text-align: center;
  padding: 2rem;
  color: var(--text-secondary);
  font-style: italic;
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
  
  .requests-grid {
    grid-template-columns: 1fr;
    gap: 1rem;
  }
  
  .stats-grid {
    grid-template-columns: 1fr;
  }
  
  .stat-title {
    font-size: 1rem;
  }
  
  .stat-number {
    font-size: 1.5rem;
  }
  
  .section-title {
    font-size: 1.3rem;
  }
  
  .request-card {
    padding: 1rem;
  }
  
  .request-avatar {
    width: 40px;
    height: 40px;
  }
  
  .request-name {
    font-size: 1rem;
  }
  
  .request-meta {
    font-size: 0.8rem;
  }
  
  .request-actions {
    flex-direction: column;
    gap: 0.5rem;
  }
  
  .request-btn {
    font-size: 0.8rem;
    padding: 0.4rem 0.8rem;
  }
  
  .empty-state {
    padding: 1.5rem;
    font-size: 0.9rem;
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
      <a href="following.jsp" class="active" title="Co-workers &amp; Followers" aria-label="Co-workers &amp; Followers">
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
  <!-- Modern Tab Navigation -->
  <nav class="tab-navigation">
    <ul class="tab-nav-list">
      <li class="tab-nav-item">
        <a href="thynkmates.jsp" class="tab-nav-link">
          <img src="icon/one.png" alt="" class="tab-nav-icon"/>
          <span style="white-space:nowrap;overflow:hidden;text-overflow:ellipsis;display:inline-block;max-width:90px;">Co-workers</span>
        </a>
      </li>
      <li class="tab-nav-item">
        <a href="following.jsp" class="tab-nav-link">
          <img src="icon/two.png" alt="" class="tab-nav-icon"/>
          <span style="white-space:nowrap;overflow:hidden;text-overflow:ellipsis;display:inline-block;max-width:90px;">Following</span>
        </a>
      </li>
      <li class="tab-nav-item">
        <a href="people-you-may-know.jsp" class="tab-nav-link">
          <img src="icon/three.png" alt="" class="tab-nav-icon"/>
          <span style="white-space:nowrap;overflow:hidden;text-overflow:ellipsis;display:inline-block;max-width:90px;">People</span>
        </a>
      </li>
    </ul>
  </nav>

  <!-- Page Header -->
  <div class="page-header">
    <h1 class="page-title">Co-worker Requests</h1>
    <p class="page-subtitle">Manage your sent and received co-worker requests</p>
  </div>

  <!-- Stats Grid -->
  <div class="stats-grid">
    <div class="stat-card received">
      <img src="icon/two.png" alt="" class="stat-icon"/>
      <div class="stat-title">Requests Received</div>
      <div class="stat-count"><%=db.countfol(ix, 7)%></div>
    </div>
    <div class="stat-card sent">
      <img src="icon/two-u.png" alt="" class="stat-icon"/>
      <div class="stat-title">Requests Sent</div>
      <div class="stat-count"><%=db.countfol(ix, 6)%></div>
    </div>
  </div>

	<%

	String yourfullname = null;
	String yourbio = null;
	String yourpp = null;
	String fid = null;
	String qrym = null;
	String imdir = null;
				

Connection conn2=null;
Statement st2=null;
Statement st4=null;
ResultSet rs2=null;
ResultSet rs4=null;

int iscounting = 0;
String fidfuc=null;
int i;


Class.forName(db.name());
String unamef = db.uname().concat("i");
String passf = db.pass().concat("09");
conn2=(Connection)DriverManager.getConnection(db.urlus(),unamef,passf);
st2=conn2.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
st4=conn2.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);


%>

  <!-- Requests Grid -->
  <div class="requests-grid">
    <!-- Received Requests -->
    <div class="requests-section">
      <h2 class="section-title">
        <img src="icon/two.png" alt="" class="section-icon"/>
        Requests Received
      </h2>
      
      <%
	String yourfullname2 = null;
	String yourpp2 = null;
	String fid3 = null;
	String qry3 = null;
	String imdir2 = null;
	String[] psfetches = null;
      boolean hasReceivedRequests = false;

	String qry4 = "select * from `".concat(ix).concat("` WHERE yorn = 7");
	rs4=st2.executeQuery(qry4);

	while (rs4.next()) {
        hasReceivedRequests = true;
		fid3 = rs4.getString(1);

		psfetches = db.nameico(fid3);
		yourfullname2 = psfetches[0];
		imdir2 = "img/".concat(psfetches[1]);
		iscounting = db.countmutualthy(ix, fid3);

	%>
        <a href="profile.jsp?userId=<%=fid3%>" class="request-card">
          <img class="request-avatar" src="<%=imdir2%>" alt="<%=yourfullname2%>">
          <div class="request-info">
            <div class="request-name"><%=yourfullname2%></div>
            <div class="request-meta">
              <%if(iscounting > 0){%><%=iscounting%> Mutual Co-worker<%if(iscounting > 1){%>s<%}%><%}%>
            </div>
          </div>
        </a>
	<%
	}
      if (!hasReceivedRequests) {
      %>
        <div class="empty-state">
          No received requests at the moment.
        </div>
      <%
      }
	%>
    </div>
	
    <!-- Sent Requests -->
    <div class="requests-section">
      <h2 class="section-title">
        <img src="icon/two-u.png" alt="" class="section-icon"/>
        Requests Sent
      </h2>
	
			<%
			String yourfullname1 = null;
			String yourpp1 = null;
			String fid2 = null;
			String qry = null;
			String imdir1 = null;
      boolean hasSentRequests = false;

						

		String qry2 = "select * from `".concat(ix).concat("` WHERE yorn = 6");
		rs2=st2.executeQuery(qry2);

		while (rs2.next()) {
        hasSentRequests = true;
			fid2 = rs2.getString(1);
			
			psfetches = db.nameico(fid2);
			yourfullname1 = psfetches[0];
			imdir1 = "img/".concat(psfetches[1]);
			iscounting = db.countmutualthy(ix, fid2);

				%>
        <a href="profile.jsp?userId=<%=fid2%>" class="request-card">
          <img class="request-avatar" src="<%=imdir1%>" alt="<%=yourfullname1%>">
          <div class="request-info">
            <div class="request-name"><%=yourfullname1%></div>
            <div class="request-meta">
              <%if(iscounting > 0){%><%=iscounting%> Mutual Co-worker<%if(iscounting > 1){%>s<%}%><%}%>
            </div>
          </div>
        </a>
				<%
			}
      if (!hasSentRequests) {
      %>
        <div class="empty-state">
          No sent requests at the moment.
        </div>
      <%
      }
			%>
			</div>
			</div>
			</div>
			
			<%
			} catch (Exception ex) {
				response.sendRedirect("index.jsp");
				System.out.print(ex+"at view-all-requests.jsp");
			}
%>

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
} else {
  if (document.body.classList.contains('dark-mode')) {
    document.body.classList.remove('dark-mode');
  }
  darkModeIcon.className = 'fa-solid fa-moon';
}

darkModeToggle.onclick = function() {
  document.body.classList.toggle('dark-mode');
  
  let theme;
  if(document.body.classList.contains('dark-mode')) {
    darkModeIcon.className = 'fa-solid fa-sun';
    theme = 'light';
  } else {
    darkModeIcon.className = 'fa-solid fa-moon';
    theme = 'dark';
  }
  
  localStorage.setItem('theme', theme);
};
</script>

</body>
</html>