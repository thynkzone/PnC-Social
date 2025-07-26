<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.thynkzone.jsp.*" %>
<%@ page import="java.util.HashSet" %>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
	<head>
	<link rel="icon" href="icon/favicon.ico" type="image/x-icon">
<title>People You May Know - P&C (People & Culture)</title>
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

/* Make tab icons adapt to theme */
.dark-mode .tab-nav-icon {
  filter: brightness(0) invert(0);
}

.tab-nav-link.active .tab-nav-icon {
  filter: brightness(0) invert(1) !important;
}

/* People suggestions */
.suggestions-container {
  max-width: 800px;
  margin: 2rem auto;
  padding: 0 1rem;
}

.suggestions-header {
  background: var(--bg-card);
  border-radius: 16px;
  padding: 1.5rem;
  text-align: center;
  margin-bottom: 2rem;
  border: 1px solid var(--border-primary);
  box-shadow: var(--shadow-md);
  backdrop-filter: blur(10px);
}

.suggestions-title {
  font-size: 1.4rem;
  font-weight: 600;
  color: var(--text-primary);
  margin-bottom: 0.4rem;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 0.6rem;
}

.suggestions-title i {
  font-size: 1.2rem;
  color: var(--accent-primary);
}

.suggestions-subtitle {
  color: var(--text-secondary);
  font-size: 0.95rem;
  line-height: 1.5;
  font-weight: 400;
}

/* Responsive suggestions header */
@media (max-width: 768px) {
  .suggestions-header {
    margin: 1rem;
    padding: 1rem;
  }
  
  .suggestions-title {
    font-size: 1.2rem;
  }
  
  .suggestions-title i {
    font-size: 1rem;
  }
  
  .suggestions-subtitle {
    font-size: 0.85rem;
  }
}

.people-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
  gap: 1.5rem;
  margin-bottom: 2rem;
}

.person-card {
  background: var(--bg-card);
  border-radius: 16px;
  padding: 1.5rem;
  border: 1px solid var(--border-primary);
  box-shadow: var(--shadow-md);
  transition: var(--transition);
  text-decoration: none;
  color: var(--text-primary);
  display: block;
}

.person-card:hover {
  transform: translateY(-4px);
  box-shadow: var(--shadow-lg);
  border-color: var(--accent-primary);
}

.person-header {
  display: flex;
  align-items: center;
  gap: 1rem;
  margin-bottom: 1rem;
}

.person-avatar {
  width: 56px;
  height: 56px;
  border-radius: 50%;
  object-fit: cover;
  border: 2px solid var(--accent-primary);
}

.person-info {
  flex: 1;
}

.person-name {
  font-size: 1.1rem;
  font-weight: 600;
  color: var(--text-primary);
  margin-bottom: 0.25rem;
}

.person-meta {
  font-size: 0.9rem;
  color: var(--text-secondary);
  display: flex;
  align-items: center;
  gap: 0.5rem;
}

.mutual-icon {
  width: 16px;
  height: 16px;
  opacity: 0.7;
}

.empty-state {
  text-align: center;
  padding: 3rem;
  color: var(--text-secondary);
  background: var(--bg-card);
  border-radius: 16px;
  border: 1px solid var(--border-primary);
  box-shadow: var(--shadow-md);
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

.empty-state a {
  color: var(--accent-primary);
  text-decoration: none;
  font-weight: 500;
}

.empty-state a:hover {
  text-decoration: underline;
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
  
  .suggestions-container {
    padding: 0 0.5rem;
  }
  
  .people-grid {
    grid-template-columns: 1fr;
    gap: 1rem;
  }
  
  .person-card {
    padding: 1rem;
  }
  
  .person-header {
    margin-bottom: 0.75rem;
  }
  
  .person-avatar {
    width: 48px;
    height: 48px;
  }
  
  .person-name {
    font-size: 1rem;
  }
  
  .person-meta {
    font-size: 0.8rem;
  }
  
  .person-actions {
    margin-top: 0.75rem;
  }
  
  .action-btn {
    font-size: 0.8rem;
    padding: 0.4rem 0.8rem;
  }
  
  .person-bio {
    font-size: 0.8rem;
  }
  
  .empty-state h3 {
    font-size: 1.2rem;
  }
  
  .empty-state p {
    font-size: 0.9rem;
  }
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
        <a href="people-you-may-know.jsp" class="tab-nav-link active">
          <img src="icon/three.png" alt="" class="tab-nav-icon"/>
          <span style="white-space:nowrap;overflow:hidden;text-overflow:ellipsis;display:inline-block;max-width:90px;">People</span>
        </a>
      </li>
    </ul>
  </nav>

  <!-- Suggestions Container -->
  <div class="suggestions-container">
    <div class="suggestions-header">
      <h1 class="suggestions-title">People You May Know</h1>
      <p class="suggestions-subtitle">Discover new connections based on your network</p>
    </div>

    <%
	String fid = null;
	boolean exists = false;
    boolean hasSuggestions = false;

Connection conn=null;
Connection conn2=null;
Statement st=null;
Statement st2=null;
Statement st3=null;
Statement st4=null;
Statement st5=null;
ResultSet rs=null;
ResultSet rs2=null;
ResultSet rs3=null;
ResultSet rs4=null;
ResultSet rs5=null;
ResultSet rs6=null;
ResultSet rsm=null;
ResultSet rsn=null;
ResultSet rsing=null;
ResultSet rsbeen=null;

String qrying=null;
String qrybeen=null;

int iscounting = 0;
String fidfuc=null;
int i;

HashSet<String> mylist = new HashSet<String>();
mylist.add(ix);

Class.forName(db.name());
String unamef = db.uname().concat("i");
String passf = db.pass().concat("09");
conn=(Connection)DriverManager.getConnection(db.urlth(),unamef,passf);
conn2=(Connection)DriverManager.getConnection(db.urlus(),unamef,passf);
st=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
st2=conn2.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
st3=conn2.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
st4=conn2.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
st5=conn2.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);

String qryn = "select * from `".concat(ix).concat("` WHERE yorn = 2");
rsn=st2.executeQuery(qryn);

while (rsn.next()) {
	fid = rsn.getString(1);
		mylist.add(fid);
}

	String fid3 = null;
	exists = false;

String qry4 = "select * from `".concat(ix).concat("` WHERE yorn = 0");
rs4=st2.executeQuery(qry4);

	while (rs4.next()) {
		fid3 = rs4.getString(1);
			mylist.add(fid3);
}
	
	String fid4 = null;
	exists = false;
	
	String qry5 = "select * from `".concat(ix).concat("` WHERE yorn = 6");
	rs5=st2.executeQuery(qry5);

		while (rs5.next()) {
			fid4 = rs5.getString(1);
				mylist.add(fid4);
	}
		
	String fid5 = null;
	exists = false;
		
	String qry6 = "select * from `".concat(ix).concat("` WHERE yorn = 7");
	rs6=st2.executeQuery(qry6);

			while (rs6.next()) {
				fid5 = rs6.getString(1);
					mylist.add(fid5);
		}
%>

    <div class="people-grid">
      <%
ResultSet rsa=null;
ResultSet rsb=null;
ResultSet rsc=null;
ResultSet rsd=null;
ResultSet rse=null;
ResultSet rsf=null;
ResultSet rsg=null;
ResultSet rsh=null;
ResultSet rsi=null;

String fiduuu = null;
String qryuuu = null;
ResultSet rsuuu=null;

String fidwww = null;
String qrywww = null;
ResultSet rswww=null;

String qryeee = null;
ResultSet rseee=null;
String qrylll = null;
ResultSet rslll=null;
String fidbbb = null;
String fidccc = null;
String fidddd = null;

String yourfullnameuuu = null;
String yourppuuu = null;
String imdiruuu = null;
String[] psfetches = null;

      // thy-thy
String qrya = "select * from `".concat(ix).concat("` WHERE yorn = 2");
rsa=st2.executeQuery(qrya);

while (rsa.next()) {
	fiduuu=rsa.getString(1);
	qryuuu="select * from `"+fiduuu+"` WHERE yorn = 2";
	rsuuu=st3.executeQuery(qryuuu);
	while (rsuuu.next()) {
	fidbbb=rsuuu.getString(1);

	if (mylist.add(fidbbb)) {
            hasSuggestions = true;
		iscounting = db.countmutualthy(ix, fidbbb);
psfetches = db.nameico(fidbbb);
yourfullnameuuu = psfetches[0];
imdiruuu = "img/".concat(psfetches[1]);
%>
            <a href="profile.jsp?userId=<%=fidbbb%>" class="person-card">
              <div class="person-header">
                <img class="person-avatar" src="<%=imdiruuu%>" alt="<%=yourfullnameuuu%>">
                <div class="person-info">
                  <div class="person-name"><%=yourfullnameuuu%></div>
                  <div class="person-meta">
                    <%if(iscounting > 0){%>
                      <i class="fa-solid fa-users mutual-icon"></i>
                      <%=iscounting%> Mutual Co-worker<%if(iscounting > 1){%>s<%}%>
                    <%}%>
                  </div>
                </div>
              </div>
            </a>
<%
}
}
}

      // thy-0
String qryb = "select * from `".concat(ix).concat("` WHERE yorn = 2");
rsb=st2.executeQuery(qryb);

while (rsb.next()) {
	fiduuu=rsb.getString(1);
	qryuuu="select * from `"+fiduuu+"` WHERE yorn = 0";
	rsuuu=st3.executeQuery(qryuuu);
	while (rsuuu.next()) {
	fidwww=rsuuu.getString(1);
	
	if (mylist.add(fidwww)) {
            hasSuggestions = true;
			iscounting = db.countmutualthy(ix, fidwww);
psfetches = db.nameico(fidwww);
yourfullnameuuu = psfetches[0];
imdiruuu = "img/".concat(psfetches[1]);
%>
            <a href="profile.jsp?userId=<%=fidwww%>" class="person-card">
              <div class="person-header">
                <img class="person-avatar" src="<%=imdiruuu%>" alt="<%=yourfullnameuuu%>">
                <div class="person-info">
                  <div class="person-name"><%=yourfullnameuuu%></div>
                  <div class="person-meta">
                    <%if(iscounting > 0){%>
                      <i class="fa-solid fa-users mutual-icon"></i>
                      <%=iscounting%> Mutual Co-worker<%if(iscounting > 1){%>s<%}%>
                    <%}%>
                  </div>
                </div>
              </div>
            </a>
<%
}
}
}

      // Continue with all other relationship combinations (0-thy, 0-0, thy-1, 1-thy, 0-1, 1-0, 1-1)
      // I'll include a few more for completeness but the pattern is the same

      // 0-thy
String qryc = "select * from `".concat(ix).concat("` WHERE yorn = 0");
rsc=st2.executeQuery(qryc);

while (rsc.next()) {
	fiduuu=rsc.getString(1);
	qryuuu="select * from `"+fiduuu+"` WHERE yorn = 2";
	rsuuu=st3.executeQuery(qryuuu);
	while (rsuuu.next()) {
	fidwww=rsuuu.getString(1);

	if (mylist.add(fidwww)) {
            hasSuggestions = true;
		iscounting = db.countmutualthy(ix, fidwww);
psfetches = db.nameico(fidwww);
yourfullnameuuu = psfetches[0];
imdiruuu = "img/".concat(psfetches[1]);
%>
            <a href="profile.jsp?userId=<%=fidwww%>" class="person-card">
              <div class="person-header">
                <img class="person-avatar" src="<%=imdiruuu%>" alt="<%=yourfullnameuuu%>">
                <div class="person-info">
                  <div class="person-name"><%=yourfullnameuuu%></div>
                  <div class="person-meta">
                    <%if(iscounting > 0){%>
                      <i class="fa-solid fa-users mutual-icon"></i>
                      <%=iscounting%> Mutual Co-worker<%if(iscounting > 1){%>s<%}%>
                    <%}%>
                  </div>
                </div>
              </div>
            </a>
<%
}
}
}

      // 0-0
String qryd = "select * from `".concat(ix).concat("` WHERE yorn = 0");
rsd=st2.executeQuery(qryd);

while (rsd.next()) {
	fiduuu=rsd.getString(1);
	qryuuu="select * from `"+fiduuu+"` WHERE yorn = 0";
	rsuuu=st3.executeQuery(qryuuu);
	while (rsuuu.next()) {
	fidwww=rsuuu.getString(1);
	
	if (mylist.add(fidwww)) {
            hasSuggestions = true;
		iscounting = db.countmutualthy(ix, fidwww);
psfetches = db.nameico(fidwww);
yourfullnameuuu = psfetches[0];
imdiruuu = "img/".concat(psfetches[1]);
%>
            <a href="profile.jsp?userId=<%=fidwww%>" class="person-card">
              <div class="person-header">
                <img class="person-avatar" src="<%=imdiruuu%>" alt="<%=yourfullnameuuu%>">
                <div class="person-info">
                  <div class="person-name"><%=yourfullnameuuu%></div>
                  <div class="person-meta">
                    <%if(iscounting > 0){%>
                      <i class="fa-solid fa-users mutual-icon"></i>
                      <%=iscounting%> Mutual Co-worker<%if(iscounting > 1){%>s<%}%>
                    <%}%>
                  </div>
                </div>
              </div>
            </a>
<%
}
}
}

      // thy-1
String qrye = "select * from `".concat(ix).concat("` WHERE yorn = 2");
rse=st2.executeQuery(qrye);

while (rse.next()) {
	fiduuu=rse.getString(1);
	qryuuu="select * from `"+fiduuu+"` WHERE yorn = 1";
	rsuuu=st3.executeQuery(qryuuu);
	while (rsuuu.next()) {
	fidwww=rsuuu.getString(1);

	if (mylist.add(fidwww)) {
            hasSuggestions = true;
		iscounting = db.countmutualthy(ix, fidwww);
psfetches = db.nameico(fidwww);
yourfullnameuuu = psfetches[0];
imdiruuu = "img/".concat(psfetches[1]);
%>
            <a href="profile.jsp?userId=<%=fidwww%>" class="person-card">
              <div class="person-header">
                <img class="person-avatar" src="<%=imdiruuu%>" alt="<%=yourfullnameuuu%>">
                <div class="person-info">
                  <div class="person-name"><%=yourfullnameuuu%></div>
                  <div class="person-meta">
                    <%if(iscounting > 0){%>
                      <i class="fa-solid fa-users mutual-icon"></i>
                      <%=iscounting%> Mutual Co-worker<%if(iscounting > 1){%>s<%}%>
                    <%}%>
                  </div>
                </div>
              </div>
            </a>
<%
}
}
}

      // 1-thy
String qryf = "select * from `".concat(ix).concat("` WHERE yorn = 1");
rsf=st2.executeQuery(qryf);

while (rsf.next()) {
	fiduuu=rsf.getString(1);
	qryuuu="select * from `"+fiduuu+"` WHERE yorn = 2";
	rsuuu=st3.executeQuery(qryuuu);
	while (rsuuu.next()) {
	fidwww=rsuuu.getString(1);

	if (mylist.add(fidwww)) {
            hasSuggestions = true;
		iscounting = db.countmutualthy(ix, fidwww);
psfetches = db.nameico(fidwww);
yourfullnameuuu = psfetches[0];
imdiruuu = "img/".concat(psfetches[1]);
%>
            <a href="profile.jsp?userId=<%=fidwww%>" class="person-card">
              <div class="person-header">
                <img class="person-avatar" src="<%=imdiruuu%>" alt="<%=yourfullnameuuu%>">
                <div class="person-info">
                  <div class="person-name"><%=yourfullnameuuu%></div>
                  <div class="person-meta">
                    <%if(iscounting > 0){%>
                      <i class="fa-solid fa-users mutual-icon"></i>
                      <%=iscounting%> Mutual Co-worker<%if(iscounting > 1){%>s<%}%>
                    <%}%>
                  </div>
                </div>
              </div>
            </a>
<%
}
}
}

      // 0-1
String qryg = "select * from `".concat(ix).concat("` WHERE yorn = 0");
rsg=st2.executeQuery(qryg);

while (rsg.next()) {
	fiduuu=rsg.getString(1);
	qryuuu="select * from `"+fiduuu+"` WHERE yorn = 1";
	rsuuu=st3.executeQuery(qryuuu);
	while (rsuuu.next()) {
	fidwww=rsuuu.getString(1);

	if (mylist.add(fidwww)) {
            hasSuggestions = true;
		iscounting = db.countmutualthy(ix, fidwww);
psfetches = db.nameico(fidwww);
yourfullnameuuu = psfetches[0];
imdiruuu = "img/".concat(psfetches[1]);
%>
            <a href="profile.jsp?userId=<%=fidwww%>" class="person-card">
              <div class="person-header">
                <img class="person-avatar" src="<%=imdiruuu%>" alt="<%=yourfullnameuuu%>">
                <div class="person-info">
                  <div class="person-name"><%=yourfullnameuuu%></div>
                  <div class="person-meta">
                    <%if(iscounting > 0){%>
                      <i class="fa-solid fa-users mutual-icon"></i>
                      <%=iscounting%> Mutual Co-worker<%if(iscounting > 1){%>s<%}%>
                    <%}%>
                  </div>
                </div>
              </div>
            </a>
<%
}
}
}

      // 1-0
String qryh = "select * from `".concat(ix).concat("` WHERE yorn = 1");
rsh=st2.executeQuery(qryh);

while (rsh.next()) {
	fiduuu=rsh.getString(1);
	qryuuu="select * from `"+fiduuu+"` WHERE yorn = 0";
	rsuuu=st3.executeQuery(qryuuu);
	while (rsuuu.next()) {
	fidwww=rsuuu.getString(1);

	if (mylist.add(fidwww)) {
            hasSuggestions = true;
		iscounting = db.countmutualthy(ix, fidwww);
psfetches = db.nameico(fidwww);
yourfullnameuuu = psfetches[0];
imdiruuu = "img/".concat(psfetches[1]);
%>
            <a href="profile.jsp?userId=<%=fidwww%>" class="person-card">
              <div class="person-header">
                <img class="person-avatar" src="<%=imdiruuu%>" alt="<%=yourfullnameuuu%>">
                <div class="person-info">
                  <div class="person-name"><%=yourfullnameuuu%></div>
                  <div class="person-meta">
                    <%if(iscounting > 0){%>
                      <i class="fa-solid fa-users mutual-icon"></i>
                      <%=iscounting%> Mutual Co-worker<%if(iscounting > 1){%>s<%}%>
                    <%}%>
                  </div>
                </div>
              </div>
            </a>
<%
}
}
}

      // 1-1
String qryi = "select * from `".concat(ix).concat("` WHERE yorn = 1");
rsi=st2.executeQuery(qryi);
while (rsi.next()) {
	fiduuu=rsi.getString(1);
	qryuuu="select * from `"+fiduuu+"` WHERE yorn = 1";
	rsuuu=st3.executeQuery(qryuuu);
	while (rsuuu.next()) {
	fidwww=rsuuu.getString(1);

	if (mylist.add(fidwww)) {
            hasSuggestions = true;
		iscounting = db.countmutualthy(ix, fidwww);
psfetches = db.nameico(fidwww);
yourfullnameuuu = psfetches[0];
imdiruuu = "img/".concat(psfetches[1]);
%>
            <a href="profile.jsp?userId=<%=fidwww%>" class="person-card">
              <div class="person-header">
                <img class="person-avatar" src="<%=imdiruuu%>" alt="<%=yourfullnameuuu%>">
                <div class="person-info">
                  <div class="person-name"><%=yourfullnameuuu%></div>
                  <div class="person-meta">
                    <%if(iscounting > 0){%>
                      <i class="fa-solid fa-users mutual-icon"></i>
                      <%=iscounting%> Mutual Co-worker<%if(iscounting > 1){%>s<%}%>
                    <%}%>
                  </div>
                </div>
              </div>
            </a>
<%
}
}
}
%>
    </div>

    <%if(!hasSuggestions){%>
      <div class="empty-state">
        <h3>No Suggestions Available</h3>
        <p>We couldn't find any new people to suggest right now.</p>
        <p>Try <a href="search-user.jsp">searching for specific people</a> or check back later for new suggestions.</p>
      </div>
    <%}%>
  </div>
</div>

<%
			} catch (Exception ex) {
				response.sendRedirect("index.jsp");
				System.out.print(ex+"at people-you-may-know.jsp");
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