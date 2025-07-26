<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.thynkzone.jsp.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="icon" href="icon/favicon.ico" type="image/x-icon">
<title>P&C - Update Background Picture</title>
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
  justify-content: flex-start;
  min-height: 100vh;
  padding: 2.5rem 1rem 2rem 1rem;
}

/* Page Header Styling */
.page-header {
  text-align: center;
  padding: 1.5rem;
  background: var(--bg-card);
  border: 1px solid var(--border-primary);
  border-radius: 16px;
  box-shadow: var(--shadow-md);
  max-width: 600px;
  width: 100%;
  margin-bottom: 2rem;
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

/* Form width matching search bar */
.upload-form-container {
  max-width: 600px;
  width: 100%;
  margin: 0 auto;
}

/* Upload card modernized */
.upload-card {
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

.upload-card h2 {
  font-size: 1.15rem;
  font-weight: 600;
  color: var(--accent-primary);
  text-align: center;
  margin-bottom: 1.2rem;
}

/* Modern file upload area */
.upload-area {
  border: 2px dashed var(--accent-primary);
  border-radius: 16px;
  background: var(--bg-tertiary);
  padding: 2rem;
  text-align: center;
  color: var(--text-secondary);
  margin-bottom: 1.5rem;
  transition: border 0.2s, background 0.2s;
  cursor: pointer;
  position: relative;
}

.upload-area:hover {
  border-color: var(--accent-secondary);
  background: var(--bg-card);
}

.upload-area.dragover {
  border-color: var(--accent-secondary);
  background: var(--bg-card);
}

.upload-icon {
  font-size: 2.5rem;
  color: var(--accent-primary);
  margin-bottom: 1rem;
}

.upload-text {
  font-size: 1rem;
  margin-bottom: 0.5rem;
  color: var(--text-primary);
  max-width: 100%;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}

.upload-hint {
  font-size: 0.9rem;
  color: var(--text-muted);
  max-width: 100%;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}

/* Hidden file input */
.file-input {
  position: absolute;
  opacity: 0;
  width: 100%;
  height: 100%;
  cursor: pointer;
}

/* Submit button */
.submit-btn {
  background: var(--accent-primary);
  color: #fff;
  border: none;
  border-radius: 12px;
  padding: 1rem 2rem;
  font-size: 1rem;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.2s ease;
  margin-top: 1rem;
  box-shadow: var(--shadow-md);
  width: 100%;
  display: block;
}

.submit-btn:hover {
  background: var(--accent-secondary);
  color: #fff;
  transform: translateY(-1px);
  box-shadow: var(--shadow-lg);
}

.submit-btn:disabled {
  opacity: 0.6;
  cursor: not-allowed;
  transform: none;
}

/* Preview section */
.preview-section {
  margin-top: 2rem;
  text-align: center;
}

.preview-title {
  font-size: 1.1rem;
  color: var(--text-secondary);
  margin-bottom: 1rem;
  font-weight: 500;
}

.preview-image {
  max-width: 400px;
  max-height: 200px;
  border-radius: 16px;
  box-shadow: var(--shadow-md);
  border: 2px solid var(--border-primary);
  object-fit: cover;
  width: 100%;
}

/* Loading spinner */
.loading-spinner {
  display: none;
  margin: 1rem auto;
  width: 40px;
  height: 40px;
  border: 3px solid var(--border-primary);
  border-top: 3px solid var(--accent-primary);
  border-radius: 50%;
  animation: spin 1s linear infinite;
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}

@media (max-width: 600px) {
  .upload-card {
    max-width: 95vw;
    padding: 1.5rem 1rem;
  }
  
  .upload-area {
    padding: 1.5rem;
  }
  
  .upload-icon {
    font-size: 2rem;
  }
  
  .preview-image {
    max-width: 100%;
    max-height: 150px;
  }
}
</style>
</head>
<body>
<%
try {
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

<div class="main-center-container">
  <!-- Page Header -->
  <div class="page-header">
    <h1 class="page-title"><i class="fa-solid fa-image"></i> Update Background Picture</h1>
  </div>

  <!-- Notification Message -->
  <%
  try {
    String msg = session.getAttribute("msg").toString();
    out.print("<div class='notifmsg'>"+msg+"</div>");
    session.removeAttribute("msg");
  } catch (Exception ex){}
  %>

  <div class="upload-form-container">
    <div class="upload-card">
      <form name="uploadForm" action="bgprocess.jsp" method="POST" enctype="multipart/form-data">
        <div class="upload-area" id="uploadArea">
          <div class="upload-icon">
            <i class="fa-solid fa-image"></i>
          </div>
          <div class="upload-text">Click to upload or drag and drop</div>
          <div class="upload-hint">PNG, JPG, JPEG up to 5MB</div>
          <input type="file" name="pp" id="fileInput" class="file-input" accept="image/x-png,image/jpg,image/jpeg" onchange="loadFile(event)" required>
        </div>
        
        <input type="hidden" name="csrf" value="<%=db.csrftoken()%>">
        
        <button type="submit" class="submit-btn" id="submitBtn" disabled>
          <i class="fa-solid fa-upload"></i> Upload Background Picture
        </button>
      </form>
      
      <!-- Loading Spinner -->
      <div class="loading-spinner" id="loadingSpinner"></div>
      
      <!-- Preview Section -->
      <div class="preview-section" id="previewSection" style="display: none;">
        <div class="preview-title">Background Picture Preview</div>
        <img id="previewImage" class="preview-image" alt="Background picture preview" />
      </div>
    </div>
  </div>
</div>

<script>
// File upload functionality
function loadFile(event) {
  const file = event.target.files[0];
  const previewSection = document.getElementById('previewSection');
  const previewImage = document.getElementById('previewImage');
  const submitBtn = document.getElementById('submitBtn');
  const uploadArea = document.getElementById('uploadArea');
  
  if (file) {
    // Show preview
    previewImage.src = URL.createObjectURL(file);
    previewSection.style.display = 'block';
    
    // Enable submit button
    submitBtn.disabled = false;
    
    // Update upload area text
    uploadArea.querySelector('.upload-text').textContent = file.name;
    uploadArea.querySelector('.upload-hint').textContent = 'Size: ' + (file.size / 1024 / 1024).toFixed(2) + ' MB';
    
    // Clean up object URL
    previewImage.onload = function() {
      URL.revokeObjectURL(previewImage.src);
    };
  }
}

// Drag and drop functionality
const uploadArea = document.getElementById('uploadArea');
const fileInput = document.getElementById('fileInput');

uploadArea.addEventListener('click', (e) => {
  // Don't trigger file picker if clicking on submit button specifically
  if (e.target.closest('.submit-btn')) {
    return;
  }
  fileInput.click();
});

uploadArea.addEventListener('dragover', (e) => {
  e.preventDefault();
  uploadArea.classList.add('dragover');
});

uploadArea.addEventListener('dragleave', (e) => {
  e.preventDefault();
  uploadArea.classList.remove('dragover');
});

uploadArea.addEventListener('drop', (e) => {
  e.preventDefault();
  uploadArea.classList.remove('dragover');
  if (e.dataTransfer.files && e.dataTransfer.files[0]) {
    fileInput.files = e.dataTransfer.files;
    loadFile({target: {files: e.dataTransfer.files}});
  }
});

// Form submission with loading
document.querySelector('form[name="uploadForm"]').addEventListener('submit', function(e) {
  const loadingSpinner = document.getElementById('loadingSpinner');
  const submitBtn = document.getElementById('submitBtn');
  
  if (document.getElementById('fileInput').files.length > 0) {
    loadingSpinner.style.display = 'block';
    submitBtn.disabled = true;
    submitBtn.innerHTML = '<i class="fa-solid fa-spinner fa-spin"></i> Uploading...';
    // Allow form to submit normally
  } else {
    e.preventDefault();
  }
});

// Prevent submit button from triggering upload area click
document.getElementById('submitBtn').addEventListener('click', function(e) {
  e.stopPropagation();
});
</script>

<script type="text/javascript">
// Modern dropdown and dark mode scripts
function toggleDropdown(event) {
  event.stopPropagation();
  const dropdown = document.getElementById('myDropdown');
  const button = document.getElementById('dropdownMenuButton');
  const expanded = button.getAttribute('aria-expanded') === 'true';
  button.setAttribute('aria-expanded', !expanded);
  dropdown.classList.toggle('show');
}

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

const darkModeToggle = document.getElementById('darkModeToggle');
const darkModeIcon = document.getElementById('darkModeIcon');
const savedTheme = localStorage.getItem('theme');
const devicePrefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
const currentTheme = savedTheme || (devicePrefersDark ? 'dark' : 'light');

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

<%
} catch(Exception ex) {
    response.sendRedirect("index.jsp");
    System.out.print(ex+"at update-background-picture.jsp");
}
%>
</body>
</html>