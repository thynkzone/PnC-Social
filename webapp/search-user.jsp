<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.thynkzone.jsp.*" %>
<%@ page import="java.util.HashSet" %>
<%@page import="java.sql.*" %>
<%@ page import="antisamyfile.antisamy" %>

<!DOCTYPE html>
<html lang="en">
<head>
<link rel="icon" href="icon/favicon.ico" type="image/x-icon">
<title>Search Users - P&C</title>
<meta charset="UTF-8">
<meta name="description" content="P&C (People and Culture) is a workplace social network for employees to share experiences, updates, memes, and insights about their jobs and organizational life."/>
<meta name="keywords" content="People and Culture, workplace social network, employee community, company culture, office memes, job updates, coworker engagement, P&C app, organizational culture, share work life, employee stories"/>
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
<!-- FontAwesome CDN for icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Arial, sans-serif;  background: var(--bg-main) !important;
  color: var(--text-primary);
  margin: 0;
  min-height: 100vh;
  transition: background 0.3s, color 0.3s;
}
html, body {
  background-image: none !important;
  background-attachment: initial !important;
  background-size: initial !important;
  min-height: auto !important;
}
.content {
  max-width: none !important;
  margin: 0 !important;
  padding: 0 !important;
  background: transparent !important;
  min-height: auto !important;
}
#search.search {
  background: transparent !important;
  border: none !important;
  padding: 1rem !important;
  box-shadow: none !important;
}
* { box-sizing: border-box !important; }
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
.rights a i, .rights button i { color: var(--text-primary) !important; }
.rights a:hover i, .rights button:hover i { color: #fff !important; }
.topnav .rights a, .topnav .rights button { color: var(--text-primary); }
.topnav .rights a:hover, .topnav .rights button:hover { color: #fff; background: var(--accent-primary) !important; }
.topnav .rights a i.fa-solid, .topnav .rights button i.fa-solid { color: var(--text-primary) !important; }
.topnav .rights a:hover i.fa-solid, .topnav .rights button:hover i.fa-solid { color: #fff !important; }
#darkModeToggle i { color: var(--accent-primary) !important; }
#darkModeToggle:hover i { color: #fff !important; }
.topnav .rights a.active { background: var(--accent-primary) !important; border-radius: 50%; }
.topnav .rights a.active i { color: #fff !important; }
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

/* Search Results Card */
.search-results-section {
  max-width: 800px;
  margin: 2rem auto;
  background: var(--bg-card);
  border-radius: 16px;
  padding: 2rem;
  border: 1px solid var(--border-primary);
  box-shadow: var(--shadow-md);
}
.search-result-item {
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
.search-result-item:hover {
  transform: translateY(-2px);
  box-shadow: var(--shadow-md);
  border-color: var(--accent-primary);
  color: var(--text-primary);
}
.search-result-avatar {
  width: 48px;
  height: 48px;
  border-radius: 50%;
  object-fit: cover;
  background: var(--bg-glass);
  border: 2px solid var(--accent-primary);
}
.search-result-content {
  flex: 1;
  min-width: 0;
}
.search-result-name {
  font-size: 1.1rem;
  font-weight: 600;
  color: var(--text-primary);
  margin-bottom: 0.2rem;
  line-height: 1.3;
}
.search-result-mutual {
  font-size: 0.95rem;
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
.page-header {
  max-width: 600px;
  margin: 1.5rem auto;
  background: rgba(36, 37, 46, 0.97); /* more opaque */
  border-radius: 24px;
  padding: 2.2rem 1.5rem 1.7rem 1.5rem;
  border: 2.5px solid var(--accent-primary);
  box-shadow: 0 12px 40px 0 rgba(0,0,0,0.35);
  text-align: center;
  backdrop-filter: blur(14px);
}
.dark-mode .page-header {
  background: rgba(255,255,255,0.97);
  border: 2.5px solid var(--accent-primary);
  color: var(--text-primary);
  box-shadow: 0 12px 40px 0 rgba(0,0,0,0.10);
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
      <a href="post-updates.jsp" title="Notifications" aria-label="Notifications">
        <i class="fa-solid fa-bell"></i>
      </a>
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
      <button id="darkModeToggle" title="Toggle dark mode" aria-label="Toggle dark mode">
        <i id="darkModeIcon" class="fa-solid fa-moon"></i>
      </button>
    </div>
  </div>
</nav>
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
  <div class="page-header" style="margin-left:auto;margin-right:auto;max-width:600px;text-align:center;">
    <h1 class="page-title" style="justify-content:center;align-items:center;display:flex;gap:0.6rem;">
      <i class="fa-solid fa-magnifying-glass" style="color: var(--accent-primary);"></i>
      Search Users
    </h1>
    <p class="page-subtitle" style="margin:0 auto;color:var(--text-secondary);font-size:1.05rem;">Search people, organizations, positions,and more</p>
  </div>
  <div class="search-results-section">
    <%
    String token = request.getParameter("csrf");
    boolean hasResults = false;
    int resultCount = 0;
    if (db.verifycsrftoken(token)) {
      String prsn = antisamy.safe(request.getParameter("srchtxt"));
      if (db.inputvalidatorString(prsn, 2)) {
        if (prsn != null && prsn.length() > 0 && !prsn.equals("null")) {
    %>
    <div style="font-weight: 500; color: var(--text-secondary); margin-bottom: 1.5rem;">You searched for <b><%=prsn%></b></div>
    <%
          ResultSet rs=null;
          ResultSet rs2=null;
          Statement st=null;
          Statement st2=null;
          Statement st3=null;
          Statement st4=null;
          Statement st5=null;
          Statement st6=null;
          Connection conn=null;
          PreparedStatement pstmt=null;
          Connection conn2=null;
          PreparedStatement pstmt2=null;
          HashSet<String> sortlist = new HashSet<String>();
          sortlist.add(ix);
          Class.forName(db.name());
          String unamef = db.uname().concat("i");
          String passf = db.pass().concat("09");
          conn=(Connection)DriverManager.getConnection(db.urlus(),unamef,passf);
          conn2=(Connection)DriverManager.getConnection(db.urlth(),unamef,passf);
          st3=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
          st4=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
          // 1. Search own table
          String qry = "SELECT * FROM `"+ix+"`";
          st=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
          rs = st.executeQuery(qry);
          while (rs.next()) {
            if (prsn.equalsIgnoreCase(rs.getString(3)) || prsn.equalsIgnoreCase(rs.getString(4)) || prsn.equalsIgnoreCase(rs.getString(5))) {
              String fid = rs.getString(1);
              if (sortlist.add(fid)) {
                String[] psfetches = db.nameico(fid);
                String yourfullname = psfetches[0];
                String imdir = "img/".concat(psfetches[1]);
                int iscounting = db.countmutualthy(ix, fid);
                resultCount++;
    %>
    <a href="profile.jsp?userId=<%=fid%>" class="search-result-item">
      <img class="search-result-avatar" src="<%=imdir%>" alt="<%=yourfullname%>'s avatar" />
      <div class="search-result-content">
        <div class="search-result-name"><%=yourfullname%></div>
        <div class="search-result-mutual">
          <% if(iscounting > 0){ out.print(iscounting + " Mutual Thynkmate" + (iscounting > 1 ? "s" : "")); } %>
        </div>
      </div>
    </a>
    <%
              }
            }
          }
          // 2. Search friends-of-friends (yorn = 2)
          String qrya = "select * from `".concat(ix).concat("` WHERE yorn = 2");
          ResultSet rsa=st3.executeQuery(qrya);
          while (rsa.next()) {
            String fiduuu=rsa.getString(1);
            String qryuuu="select * from `"+fiduuu+"` WHERE yorn = 2";
            ResultSet rsuuu=st4.executeQuery(qryuuu);
            while (rsuuu.next()) {
              if (prsn.equalsIgnoreCase(rsuuu.getString(3)) || prsn.equalsIgnoreCase(rsuuu.getString(4)) || prsn.equalsIgnoreCase(rsuuu.getString(5))) {
                String fid = rsuuu.getString(1);
                if (sortlist.add(fid)) {
                  String[] psfetches = db.nameico(fid);
                  String yourfullname = psfetches[0];
                  String imdir = "img/".concat(psfetches[1]);
                  int iscounting = db.countmutualthy(ix, fid);
                  resultCount++;
    %>
    <a href="profile.jsp?userId=<%=fid%>" class="search-result-item">
      <img class="search-result-avatar" src="<%=imdir%>" alt="<%=yourfullname%>'s avatar" />
      <div class="search-result-content">
        <div class="search-result-name"><%=yourfullname%></div>
        <div class="search-result-mutual">
          <% if(iscounting > 0){ out.print(iscounting + " Mutual Thynkmate" + (iscounting > 1 ? "s" : "")); } %>
        </div>
      </div>
    </a>
    <%
                }
              }
            }
          }
          // 3. Search friends-of-friends (yorn = 2, yorn = 1)
          String qryflex1 = "select * from `".concat(ix).concat("` WHERE yorn = 2");
          ResultSet rsflex1=st3.executeQuery(qryflex1);
          while (rsflex1.next()) {
            String fiduuu=rsflex1.getString(1);
            String qryuuu="select * from `"+fiduuu+"` WHERE yorn = 1";
            ResultSet rsuuu=st4.executeQuery(qryuuu);
            while (rsuuu.next()) {
              if (prsn.equalsIgnoreCase(rsuuu.getString(3)) || prsn.equalsIgnoreCase(rsuuu.getString(4)) || prsn.equalsIgnoreCase(rsuuu.getString(5))) {
                String fid = rsuuu.getString(1);
                if (sortlist.add(fid)) {
                  String[] psfetches = db.nameico(fid);
                  String yourfullname = psfetches[0];
                  String imdir = "img/".concat(psfetches[1]);
                  int iscounting = db.countmutualthy(ix, fid);
                  resultCount++;
    %>
    <a href="profile.jsp?userId=<%=fid%>" class="search-result-item">
      <img class="search-result-avatar" src="<%=imdir%>" alt="<%=yourfullname%>'s avatar" />
      <div class="search-result-content">
        <div class="search-result-name"><%=yourfullname%></div>
        <div class="search-result-mutual">
          <% if(iscounting > 0){ out.print(iscounting + " Mutual Thynkmate" + (iscounting > 1 ? "s" : "")); } %>
        </div>
      </div>
    </a>
    <%
                }
              }
            }
          }
          // 4. Search friends-of-friends (yorn = 0, yorn = 1)
          String qryflex2 = "select * from `".concat(ix).concat("` WHERE yorn = 0");
          ResultSet rsflex2=st3.executeQuery(qryflex2);
          while (rsflex2.next()) {
            String fiduuu=rsflex2.getString(1);
            String qryuuu="select * from `"+fiduuu+"` WHERE yorn = 1";
            ResultSet rsuuu=st4.executeQuery(qryuuu);
            while (rsuuu.next()) {
              if (prsn.equalsIgnoreCase(rsuuu.getString(3)) || prsn.equalsIgnoreCase(rsuuu.getString(4)) || prsn.equalsIgnoreCase(rsuuu.getString(5))) {
                String fid = rsuuu.getString(1);
                if (sortlist.add(fid)) {
                  String[] psfetches = db.nameico(fid);
                  String yourfullname = psfetches[0];
                  String imdir = "img/".concat(psfetches[1]);
                  int iscounting = db.countmutualthy(ix, fid);
                  resultCount++;
    %>
    <a href="profile.jsp?userId=<%=fid%>" class="search-result-item">
      <img class="search-result-avatar" src="<%=imdir%>" alt="<%=yourfullname%>'s avatar" />
      <div class="search-result-content">
        <div class="search-result-name"><%=yourfullname%></div>
        <div class="search-result-mutual">
          <% if(iscounting > 0){ out.print(iscounting + " Mutual Thynkmate" + (iscounting > 1 ? "s" : "")); } %>
        </div>
      </div>
    </a>
    <%
                }
              }
            }
          }
          // 5. Search global profileinfo
          String qry2 = "SELECT * FROM profileinfo";
          st2=conn2.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
          rs2 = st2.executeQuery(qry2);
          while (rs2.next()) {
            if (prsn.equalsIgnoreCase(rs2.getString(3)) || prsn.equalsIgnoreCase(rs2.getString(4)) || prsn.equalsIgnoreCase(rs2.getString(5)) || prsn.equalsIgnoreCase(rs2.getString(14)) || prsn.equalsIgnoreCase(rs2.getString(15))) {
              String fid = rs2.getString(2);
              if (sortlist.add(fid)) {
                String[] psfetches = db.nameico(fid);
                String yourfullname = psfetches[0];
                String imdir = "img/".concat(psfetches[1]);
                int iscounting = db.countmutualthy(ix, fid);
                resultCount++;
    %>
    <a href="profile.jsp?userId=<%=fid%>" class="search-result-item">
      <img class="search-result-avatar" src="<%=imdir%>" alt="<%=yourfullname%>'s avatar" />
      <div class="search-result-content">
        <div class="search-result-name"><%=yourfullname%></div>
        <div class="search-result-mutual">
          <% if(iscounting > 0){ out.print(iscounting + " Mutual Thynkmate" + (iscounting > 1 ? "s" : "")); } %>
        </div>
      </div>
    </a>
    <%
              }
            }
          }
    %>
    <div style="margin-top:2rem;color:var(--text-secondary);font-size:0.98rem;">
      Showing <%=resultCount%> result<%=resultCount==1?"":"s"%> from all entries
    </div>
    <%
          if(resultCount == 0) {
    %>
    <div class="empty-state">
      <h3>No Results Found</h3>
      <p>Try searching for a different name or keyword.</p>
    </div>
    <%
          }
        }
      }
    } else {
    %>
    <div class="empty-state">
      <h3>Invalid Search</h3>
      <p>Your search could not be processed. Please try again.</p>
    </div>
    <%
    }
    %>
  </div>
</div>
<%
} catch(Exception ex) {
    response.sendRedirect("index.jsp");
    System.out.print(ex+" at search-user.jsp");
}
%>
</body>
<!-- Place scripts at the end of body -->
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
  if (dropdown && dropdown.classList.contains('show')) {
    if (!dropdown.contains(e.target) && !button.contains(e.target)) {
      dropdown.classList.remove('show');
      button.setAttribute('aria-expanded', 'false');
    }
  }
});
// Dark mode toggle
const darkModeToggle = document.getElementById('darkModeToggle');
const darkModeIcon = document.getElementById('darkModeIcon');
if (darkModeToggle && darkModeIcon) {
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
    document.documentElement.style.backgroundColor = '#fff';
  } else {
    if (document.body.classList.contains('dark-mode')) {
      document.body.classList.remove('dark-mode');
    }
    darkModeIcon.className = 'fa-solid fa-moon';
    document.documentElement.style.backgroundColor = '#18181b';
  }
  darkModeToggle.onclick = function() {
    document.body.classList.toggle('dark-mode');
    let theme;
    if(document.body.classList.contains('dark-mode')) {
      darkModeIcon.className = 'fa-solid fa-sun';
      theme = 'light';
      document.documentElement.style.backgroundColor = '#fff';
    } else {
      darkModeIcon.className = 'fa-solid fa-moon';
      theme = 'dark';
      document.documentElement.style.backgroundColor = '#18181b';
    }
    localStorage.setItem('theme', theme);
  };
}
</script>
</html>