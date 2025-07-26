<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.thynkzone.jsp.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="icon" href="icon/favicon.ico" type="image/x-icon">
<title>P&C</title>
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
* {
  box-sizing: border-box !important;
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
.rights a i, .rights button i {
  color: var(--text-primary) !important;
}
.rights a:hover i, .rights button:hover i {
  color: #fff !important;
}
.topnav .rights a, .topnav .rights button {
  color: var(--text-primary);
}
.topnav .rights a:hover, .topnav .rights button:hover {
  color: #fff;
  background: var(--accent-primary) !important;
}
.topnav .rights a i.fa-solid,
.topnav .rights button i.fa-solid {
  color: var(--text-primary) !important;
}
.topnav .rights a:hover i.fa-solid,
.topnav .rights button:hover i.fa-solid {
  color: #fff !important;
}
#darkModeToggle i {
  color: var(--accent-primary) !important;
}
#darkModeToggle:hover i {
  color: #fff !important;
}
.topnav .rights a.active {
  background: var(--accent-primary) !important;
  border-radius: 50%;
}
.topnav .rights a.active i {
  color: #fff !important;
}
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
/* Remove .coworkers-section styles and container */
.form-section {
  margin: 1.2rem 0;
  max-width: 600px;
  width: 100%;
  background: var(--bg-card);
  border-radius: 16px;
  box-shadow: var(--shadow-md);
  padding: 1.2rem 1rem 1rem 1rem;
  overflow: hidden;
}
.form-section h2 {
  font-size: 1.1rem;
  font-weight: 600;
  color: var(--accent-primary);
  margin-bottom: 0.5rem;
  display: flex;
  align-items: center;
  gap: 0.5rem;
}
.form-section label {
  color: var(--text-secondary);
  font-size: 0.98rem;
  margin-bottom: 0.25rem;
  display: block;
}
.input-row {
  display: flex;
  align-items: center;
  gap: 1rem;
  margin-bottom: 1rem;
}
.input-field, textarea, select {
  width: 100%;
  padding: 0.75rem 1rem;
  border-radius: 25px;
  color: var(--text-primary);
  font-size: 1rem;
  font-family: inherit;
  transition: box-shadow 0.2s;
  margin-bottom: 0.5rem;
  box-shadow: none;
}
.input-field:focus, textarea:focus, select:focus {
  border-color: var(--accent-primary);
  outline: none;
}
.subbtn {
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
  display: block;
}
.subbtn:hover {
  background: var(--accent-secondary);
}
.char-counter {
  text-align: right;
  font-size: 0.95rem;
  color: var(--text-muted);
  margin-top: -0.5rem;
  margin-bottom: 0.5rem;
}
.profile-header-card {
  margin: 0.5rem auto;
  max-width: 600px;
  width: 100%;
  background: var(--bg-card);
  border-radius: 16px;
  box-shadow: var(--shadow-md);
  padding: 1rem 1rem 0.8rem 1rem; /* less bottom padding */
  border: 1px solid var(--border-primary);
  overflow: hidden;
  display: flex;
  align-items: center;
  justify-content: center;
  color: var(--accent-primary);
}
.profile-edit-header {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  font-size: 1.15rem;
  font-weight: 600;
  text-align: center;
}
.profile-edit-header i {
  font-size: 1.2rem;
  color: var(--accent-primary);
}
@media (max-width: 600px) {
  .profile-header-card {
    padding: 0.7rem 0.5rem 0.5rem 0.5rem;
    border-radius: 10px;
  }
  .profile-edit-header {
    font-size: 1rem;
  }
  .profile-edit-header i {
    font-size: 1rem;
  }
}
@media (max-width: 700px) {
  .form-section {
    padding: 0.8rem 0.5rem 0.7rem 0.5rem;
    border-radius: 10px;
  }
  .profile-edit-header {
    font-size: 1.3rem;
    margin-bottom: 1.2rem;
  }
  .profile-edit-container {
    padding: 1.2rem 0.2rem 1.2rem 0.2rem;
  }
}
@media (max-width: 480px) {
  .form-section {
    padding: 0.5rem 0.2rem;
    border-radius: 8px;
  }
  .section-header {
    flex-direction: column;
    align-items: flex-start;
    padding-bottom: 0.5rem;
  }
  .section-title {
    font-size: 1.1rem;
  }
.subbtn {
    width: 100%;
    padding: 0.7rem 0;
    font-size: 1.05rem;
  }
}
/* Centered column layout for header and cards */
.profile-edit-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: flex-start;
  max-width: 700px;
  margin: 0 auto;
  padding: 2.5rem 1rem 2rem 1rem;
}
.profile-edit-header {
  display: flex;
  align-items: center;
  gap: 0.7rem;
font-size: 1.5rem;
font-weight: 700;
  color: var(--accent-primary);
  width: 100%;
  justify-content: flex-start;
}

select.input-field {
    max-height: 250px;
    overflow-y: auto;
}
</style>
</head>
<body>
<%
try {
    String ix = db.userid(request);
    String[] fetches = db.nameico(ix);
    String pname = fetches[0];
    String psmall = "img/".concat(fetches[1]);
%>
<!-- Modern App-Style Navigation Bar (copied from following.jsp) -->
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
<!-- Modern Search Bar (copied from following.jsp) -->
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
  <div class="profile-edit-container">
    <div class="profile-header-card">
      <div class="profile-edit-header">
        <i class="fa-solid fa-user-circle"></i>
        Edit your profile information
      </div>
	</div>
    <!-- Edit Quote -->
    <form class="form-section" action="set-one.jsp" method="POST" autocomplete="off">
      <h2><i class="fa-solid fa-quote-left"></i> Edit your quote</h2>
      <label for="bio">Say something about yourself (max 300 characters)</label>
      <textarea id="bio" name="bio" maxlength="299" rows="5" cols="1" style="resize: none;" class="input-field" placeholder="Say Something About Yourself (within 300 characters)" required oninput="updateCharCount(this)"><%=base64.de(db.infoadded(ix, -1))%></textarea>
      <div class="char-counter"><span id="bio-count"><%=base64.de(db.infoadded(ix, -1)).length()%></span>/299 characters</div>
      <input type="hidden" name="csrf" value="<%=db.csrftoken()%>">
      <button class="subbtn" type="submit">Update</button>
	</form>
    <!-- Country of Residence -->
    <form class="form-section" action="set-one.jsp" method="POST">
      <h2><i class="fa-solid fa-earth-asia"></i> Change your country of residence</h2>
      <label>Your current country of residence is set to: <b><%=db.infoadded(ix, 0)%></b></label>
      <label for="timezone">Select your country (by time zone):</label>
      <select id="timezone" name="timezone" class="input-field" size="4">
        <option value="6~Bangladesh" selected>Bangladesh</option>
    <option value="4:30~Afghanistan">Afghanistan</option>
    <option value="1~Albania">Albania</option>
    <option value="1~Algeria">Algeria</option>
    <option value="1~Andorra">Andorra</option>
    <option value="1~Angola">Angola</option>
    <option value="-3~Antarctica - Palmer Station">Antarctica - Palmer Station</option>
    <option value="-3~Antarctica - Rothera Station">Antarctica - Rothera Station</option>
    <option value="0~Antarctica - Troll Station">Antarctica - Troll Station</option>
    <option value="3~Antarctica - Syowa Station">Antarctica - Syowa Station</option>
    <option value="5~Antarctica - Mawson Station">Antarctica - Mawson Station</option>
    <option value="6~Antarctica - Vostok Station">Antarctica - Vostok Station</option>
    <option value="7~Antarctica - Davis Station">Antarctica - Davis Station</option>
    <option value="10~Antarctica - Dumont-d'Urville Station">Antarctica - Dumont-d'Urville Station</option>
    <option value="11~Antarctica - Casey Station">Antarctica - Casey Station</option>
    <option value="11~Antarctica - Macquarie Island">Antarctica - Macquarie Island</option>
    <option value="12~Antarctica - McMurdo Station">Antarctica - McMurdo Station</option>
    <option value="-4~Antigua and Barbuda">Antigua and Barbuda</option>
    <option value="-3~Argentina">Argentina</option>
    <option value="4~Armenia">Armenia</option>
    <option value="5~Australia - Heard and McDonald Islands">Australia - Heard and McDonald Islands</option>
    <option value="6:30~Australia - Cocos (Keeling) Islands">Australia - Cocos (Keeling) Islands</option>
    <option value="7~Australia - Christmas Island">Australia - Christmas Island</option>
    <option value="8:45~Australia - Western Australia (Caiguna, Eucla, Madura, Mundrabilla)">Australia -  Western Australia (Caiguna, Eucla, Madura, Mundrabilla)</option>
    <option value="8~Australia - Western Australia">Australia - Western Australia</option>
    <option value="8~Australia - Indian Pacific">Australia - Indian Pacific</option>
	<option value="8:45~Australia - South Australian Border Village">Australia - South Australian Border Village</option>
    <option value="9:30~Australia - South Australia">Australia - South Australia</option>
    <option value="9:30~Australia - Northern Territory">Australia - Northern Territory</option>
    <option value="9:30~Australia - New South Wales (Yancowinna County)">Australia - New South Wales (Yancowinna County)</option>
    <option value="10~Australia - New South Wales">Australia - New South Wales</option>
    <option value="10~Australia - Queensland">Australia - Queensland</option>
    <option value="10~Australia - Australian Capital Territory">Australia - Australian Capital Territory</option>
    <option value="10~Australia - Victoria">Australia - Victoria</option>
    <option value="10~Australia - Tasmania">Australia - Tasmania</option>
    <option value="10:30~Australia - Lord Howe Island">Australia - Lord Howe Island</option>
    <option value="11~Australia - Norfolk Island">Australia - Norfolk Island</option>
    <option value="1~Austria">Austria</option>
    <option value="4~Azerbaijan">Azerbaijan</option>
    <option value="-5~Bahamas">Bahamas</option>
    <option value="3~Bahrain">Bahrain</option>
    <option value="6~Bangladesh" selected>Bangladesh</option>
    <option value="-4~Barbados">Barbados</option>
    <option value="3~Belarus">Belarus</option>
    <option value="1~Belgium">Belgium</option>
    <option value="-6~Belize">Belize</option>
    <option value="1~Benin">Benin</option>
    <option value="6~Bhutan">Bhutan</option>
    <option value="-4~Bolivia">Bolivia</option>
    <option value="1~Bosnia and Herzegovina">Bosnia and Herzegovina</option>
    <option value="2~Botswana">Botswana</option>
    <option value="-5~Brazil - Acre and Southwestern Amazonas">Brazil - Acre and Southwestern Amazonas</option>
    <option value="-4~Brazil - Most part of the Amazonas State, Mato Grosso, Mato Grosso do Sul, Rondônia, Roraima">Brazil - Most part of the Amazonas State, Mato Grosso, Mato Grosso do Sul, Rondônia, Roraima</option> 
    <option value="-3~Brazil - the Southeast Region, the South Region, the Northeast Region, Goiás, Distrito Federal, Tocantins, Pará, Amapá">Brazil - the Southeast Region, the South Region, the Northeast Region, Goiás, Distrito Federal, Tocantins, Pará, Amapá</option>
    <option value="-2~Brazil - Fernando de Noronha, Trindade and Martim Vaz, Trindade and Martim Vaz, Rocas Atoll, Saint Peter and Saint Paul Archipelago">Brazil - Fernando de Noronha, Trindade and Martim Vaz, Trindade and Martim Vaz, Rocas Atoll, Saint Peter and Saint Paul Archipelago</option>
    <option value="8~Brunei">Brunei</option>
    <option value="2~Bulgaria">Bulgaria</option>
    <option value="0~Burkina Faso">Burkina Faso</option>
    <option value="2~Burundi">Burundi</option>
    <option value="7~Cambodia">Cambodia</option>
    <option value="1~Cameroon">Cameroon</option>
    <option value="-8~Canada - Larger western part of British Columbia">Canada - Larger western part of British Columbia</option>
    <option value="-7~Canada - Eastern parts of British Columbia">Canada - Eastern parts of British Columbia</option>
    <option value="-8~Canada - Tungsten and the associated Cantung Mine in Northwest Territories">Canada - Tungsten and the associated Cantung Mine in Northwest Territories</option>
    <option value="-8~Canada - Yukon">Canada - Yukon</option>
    <option value="-7~Canada - Alberta">Canada - Alberta</option>
    <option value="-7~Canada - Most of Northwest Territories">Canada - Most of Northwest Territories</option>
    <option value="-5~Canada - Eastern Nunavut and entire Southampton Island">Canada - Eastern Nunavut and entire Southampton Island</option>
    <option value="-7~Canada - Most Western parts of Nunavut except Western Southampton Island">Canada - Most Western parts of Nunavut except Western Southampton Island</option>
    <option value="-6~Canada - Western Nunavut">Canada - Western Nunavut</option>
    <option value="-7~Canada - Communities in the Kitikmeot Region">Canada - Communities in the Kitikmeot Region</option>
    <option value="-6~Canada - Saskatchewan except Lloydminster">Canada - Saskatchewan except Lloydminster</option>
    <option value="-7~Canada - Lloydminster and surrounding area in Saskatchewan">Canada - Lloydminster and surrounding area in Saskatchewan</option>
    <option value="-6~Canada - Manitoba">Canada - Manitoba</option>
    <option value="-5~Canada - Eastern Ontario">Canada - Eastern Ontario</option>
    <option value="-6~Canada - Northwestern Ontario">Canada - Northwestern Ontario</option>
    <option value="-4~Canada - Eastern Quebec">Canada - Eastern Quebec</option>
    <option value="-5~Canada - Most of Quebec">Canada - Most of Quebec</option>
    <option value="-3:30~Canada - Southeastern Labrador">Canada - Southeastern Labrador</option>
    <option value="-4~Canada - Most of Labrador">Canada - Most of Labrador</option>
    <option value="-4~Canada - New Brunswick">Canada - New Brunswick</option>
    <option value="-4~Canada - Nova Scotia">Canada - Nova Scotia</option>
    <option value="-4~Canada - Prince Edward Island">Canada - Prince Edward Island</option>
    <option value="-3:30~Canada - Newfoundland">Canada - Newfoundland</option>
    <option value="-1~Cape Verde">Cape Verde</option>
    <option value="1~Central African Republic">Central African Republic</option>
    <option value="1~Chad">Chad</option>
    <option value="-6~Chile - Easter Island">Chile - Easter Island</option>
    <option value="-4~Chile - main territory">Chile - main territory</option>
    <option value="-3~Chile - Magallanes and Chilean Antarctica">Chile - Magallanes and Chilean Antarctica</option>
    <option value="6~China - Xinjiang">China - Xinjiang</option>
    <option value="8~China - Beijing">China - Beijing</option>
    <option value="8~China - Hong Kong">China - Hong Kong</option>
    <option value="-5~Colombia">Colombia</option>
    <option value="3~Comoros">Comoros</option>
    <option value="-6~Costa Rica">Costa Rica</option>
    <option value="1~Croatia">Croatia</option>
    <option value="-5~Cuba">Cuba</option>
    <option value="2~Cyprus">Cyprus</option>
    <option value="1~Czech Republic">Czech Republic</option>
    <option value="1~Democratic Republic of the Congo - Provinces of Équateur, Kinshasa, Kongo Central, Kwango, Kwilu, Mai-Ndombe, Mongala, Nord-Ubangi, Sud-Ubangi and Tshuapa">Democratic Republic of the Congo - Provinces of Équateur, Kinshasa, Kongo Central, Kwango, Kwilu, Mai-Ndombe, Mongala, Nord-Ubangi, Sud-Ubangi and Tshuapa</option>
    <option value="2~Democratic Republic of the Congo - Provinces of Bas-Uele, Haut-Katanga, Haut-Lomami, Haut-Uele, Kasaï, Kasaï-Central, Kasaï Oriental, Lomami and Lualaba">Democratic Republic of the Congo - Provinces of Bas-Uele, Haut-Katanga, Haut-Lomami, Haut-Uele, Kasaï, Kasaï-Central, Kasaï Oriental, Lomami and Lualaba</option>
    <option value="2~Democratic Republic of the Congo - Provinces of Maniema, Nord-Kivu, Sankuru, Sud-Kivu, Tanganyika, Tshopo and Ituri Interim Administration">Democratic Republic of the Congo - Provinces of Maniema, Nord-Kivu, Sankuru, Sud-Kivu, Tanganyika, Tshopo and Ituri Interim Administration</option>
    <option value="-4~Denmark - Thule Air Base in Greenland">Denmark - Thule Air Base in Greenland</option>
    <option value="-3~Denmark - Most of Greenland including inhabited South Coast and West Coast">Denmark - Most of Greenland including inhabited South Coast and West Coast</option>
    <option value="-1~Denmark - Ittoqqortoormiit and surrounding area in Greenland's Tunu county">Denmark - Ittoqqortoormiit and surrounding area in Greenland's Tunu county</option>
    <option value="0~Denmark - Danmarkshavn weather station and surrounding area in Greenland's Tunu county, Faroe Islands">Denmark - Danmarkshavn weather station and surrounding area in Greenland's Tunu county, Faroe Islands</option>
    <option value="1~Denmark - metropolitan Denmark">Denmark - metropolitan Denmark</option>
    <option value="3~Djibouti">Djibouti</option>
    <option value="-4~Dominica">Dominica</option>
    <option value="-4~Dominican Republic">Dominican Republic</option>
    <option value="9~East Timor">East Timor</option>
    <option value="-6~Ecuador - Galápagos Province">Ecuador - Galápagos Province</option>
    <option value="-5~Ecuador - main territory of Ecuador">Ecuador - main territory of Ecuador</option>
    <option value="2~Egypt">Egypt</option>
    <option value="-6~El Salvador">El Salvador</option>
    <option value="1~Equatorial Guinea">Equatorial Guinea</option>
    <option value="3~Eritrea">Eritrea</option>
    <option value="2~Estonia">Estonia</option>
    <option value="2~Eswatini (Swaziland)">Eswatini (Swaziland)</option>
    <option value="3~Ethiopia">Ethiopia</option>
    <option value="10~Federated States of Micronesia - the states of Chuuk and Yap">Federated States of Micronesia - the states of Chuuk and Yap</option>
    <option value="11~Federated States of Micronesia - the states of Kosrae and Pohnpei">Federated States of Micronesia - the states of Kosrae and Pohnpei</option>
    <option value="12~Fiji">Fiji</option>
    <option value="2~Finland">Finland</option>
    <option value="-10~France - most of French Polynesia">France - most of French Polynesia</option>
    <option value="-9:30~France - Marquesas Islands">France - Marquesas Islands</option>
    <option value="-9~France - Gambier Islands">France - Gambier Islands</option>
    <option value="-8~France - Clipperton Island">France - Clipperton Island</option>
    <option value="-4~France - Guadeloupe, Martinique, Saint Barthélemy, Saint Martin">France - Guadeloupe, Martinique, Saint Barthélemy, Saint Martin</option>
    <option value="-3~France - French Guiana, Saint Pierre and Miquelon">France - French Guiana, Saint Pierre and Miquelon</option>
    <option value="1~France - Metropolitan France">France - Metropolitan France</option>
    <option value="3~France - Mayotte">France - Mayotte</option>
    <option value="4~France - Réunion, Crozet Islands, Scattered Islands in the Indian Ocean">France - Réunion, Crozet Islands, Scattered Islands in the Indian Ocean</option>
    <option value="5~France - Kerguelen Islands, Îles Saint-Paul and Amsterdam">France - Kerguelen Islands, Îles Saint-Paul and Amsterdam</option>
    <option value="11~France - New Caledonia">France - New Caledonia</option>
    <option value="12~France - Wallis and Futuna">France - Wallis and Futuna</option>
    <option value="1~Gabon">Gabon</option>
    <option value="0~Gambia">Gambia</option>
    <option value="4~Georgia">Georgia</option>
    <option value="1~Germany">Germany</option>
    <option value="0~Ghana">Ghana</option>
    <option value="2~Greece">Greece</option>
    <option value="-4~Grenada">Grenada</option>
    <option value="-6~Guatemala">Guatemala</option>
    <option value="0~Guinea">Guinea</option>
    <option value="0~Guinea-Bissau">Guinea-Bissau</option>
    <option value="-4~Guyana">Guyana</option>
    <option value="-5~Haiti">Haiti</option>
    <option value="-6~Honduras">Honduras</option>
    <option value="1~Hungary">Hungary</option>
    <option value="0~Iceland">Iceland</option>
    <option value="5:30~India">India</option>
    <option value="7~Indonesia - Islands of Sumatra, Java, provinces of Bangka Belitung Islands, Riau Islands, West Kalimantan and Central Kalimantan">Indonesia - Islands of Sumatra, Java, provinces of Bangka Belitung Islands, Riau Islands, West Kalimantan and Central Kalimantan</option>
    <option value="8~Indonesia - Islands of Sulawesi, Bali, provinces of East Nusa Tenggara, West Nusa Tenggara, East Kalimantan, North Kalimantan and South Kalimantan">Indonesia - Islands of Sulawesi, Bali, provinces of East Nusa Tenggara, West Nusa Tenggara, East Kalimantan, North Kalimantan and South Kalimantan</option>
    <option value="9~Indonesia - Provinces of Maluku, North Maluku, Papua and West Papua">Indonesia - Provinces of Maluku, North Maluku, Papua and West Papua</option>
    <option value="3:30~Iran">Iran</option>
    <option value="3~Iraq">Iraq</option>
    <option value="0~Ireland">Ireland</option>
    <option value="2~Israel">Israel</option>
    <option value="1~Italy">Italy</option>
    <option value="0~Ivory Coast">Ivory Coast</option>
    <option value="-5~Jamaica">Jamaica</option>
    <option value="9~Japan">Japan</option>
    <option value="2~Jordan">Jordan</option>
    <option value="3~Kenya">Kenya</option>
    <option value="9~North Korea">North Korea</option>
    <option value="9~South Korea">South Korea</option>
    <option value="5~Kazakhstan - Western Kazakhstan">Kazakhstan - Western Kazakhstan (Aktobe, Atyrau, Kyzylorda, Mangystau and West Kazakhstan)</option>
    <option value="6~Kazakhstan - Eastern Kazakhstan">Kazakhstan - Eastern Kazakhstan</option>
    <option value="3~Kuwait">Kuwait</option>
    <option value="-4~Kingdom of the Netherlands - Caribbean municipalities and constituent countries">Kingdom of the Netherlands - Caribbean municipalities and constituent countries</option>
    <option value="1~Kingdom of the Netherlands - Main territory of the Netherlands">Kingdom of the Netherlands - Main territory of the Netherlands</option>
    <option value="12~Kiribati - Gilbert Islands">Kiribati - Gilbert Islands</option>
    <option value="13~Kiribati - Phoenix Islands">Kiribati - Phoenix Islands</option>
    <option value="14~Kiribati - Line Islands">Kiribati - Line Islands</option>
    <option value="6~Kyrgyzstan">Kyrgyzstan</option>
    <option value="7~Laos">Laos</option>
    <option value="2~Latvia">Latvia</option>
    <option value="2~Lebanon">Lebanon</option>
    <option value="2~Lesotho">Lesotho</option>
    <option value="0~Liberia">Liberia</option>
    <option value="2~Libya">Libya</option>
    <option value="1~Liechtenstein">Liechtenstein</option>
    <option value="2~Lithuania">Lithuania</option>
    <option value="1~Luxembourg">Luxembourg</option>
    <option value="3~Madagascar">Madagascar</option>
    <option value="2~Malawi">Malawi</option>
    <option value="8~Malaysia">Malaysia</option>
    <option value="5~Maldives">Maldives</option>
    <option value="0~Mali">Mali</option>
    <option value="1~Malta">Malta</option>
    <option value="12~Marshall Islands">Marshall Islands</option>
    <option value="0~Mauritania">Mauritania</option>
    <option value="4~Mauritius">Mauritius</option>
    <option value="-8~Mexico - the state of Baja California">Mexico - the state of Baja California</option>
    <option value="-7~Mexico - the states of Baja California Sur, Chihuahua, Nayarit, Sinaloa and Sonora">Mexico - the states of Baja California Sur, Chihuahua, Nayarit, Sinaloa and Sonora</option>
    <option value="-6~Mexico - Most of Mexico">Mexico - Most of Mexico</option>
    <option value="-5~Mexico - the state of Quintana Roo">Mexico - the state of Quintana Roo</option>
    <option value="2~Moldova">Moldova</option>
    <option value="1~Monaco">Monaco</option>
    <option value="7~Mongolia - the provinces of Khovd, Uvs and Bayan-Ölgii">Mongolia - the provinces of Khovd, Uvs and Bayan-Ölgii</option>
    <option value="8~Mongolia - Most of the country">Mongolia - Most of the country</option>
    <option value="1~Montenegro">Montenegro</option>
    <option value="1~Morocco">Morocco</option>
    <option value="2~Mozambique">Mozambique</option>
    <option value="6:30~Myanmar">Myanmar</option>
    <option value="1~Namibia">Namibia</option>
    <option value="12~Nauru">Nauru</option>
    <option value="5:45~Nepal">Nepal</option>
    <option value="-11~New Zealand - Niue">New Zealand - Niue</option>
    <option value="-10~New Zealand - Cook Islands">New Zealand - Cook Islands</option>
    <option value="12~New Zealand - main territory of New Zealand">New Zealand - main territory of New Zealand</option>
    <option value="12:45~New Zealand - Chatham Islands">New Zealand - Chatham Islands</option>
    <option value="13~New Zealand - Tokelau">New Zealand - Tokelau</option>
    <option value="-6~Nicaragua">Nicaragua</option>
    <option value="1~Niger">Niger</option>
    <option value="1~Nigeria">Nigeria</option>
    <option value="1~North Macedonia">North Macedonia</option>
    <option value="1~Norway">Norway</option>
    <option value="4~Oman">Oman</option>
    <option value="5~Pakistan">Pakistan</option>
    <option value="9~Palau">Palau</option>
    <option value="2~Palestine">Palestine</option>
    <option value="-5~Panama">Panama</option>
    <option value="11~Papua New Guinea - Autonomous Region of Bougainville">Papua New Guinea - Autonomous Region of Bougainville</option>
    <option value="10~Papua New Guinea - Most of the country">Papua New Guinea - Most of the country</option>
    <option value="-4~Paraguay">Paraguay</option>
    <option value="-5~Peru">Peru</option>
    <option value="8~Philippines">Philippines</option>
    <option value="1~Poland">Poland</option>
    <option value="-1~Portugal - Azores">Portugal -  Azores</option>
    <option value="0~Portugal - Madeira and the main territory of Portugal">Portugal -  Madeira and the main territory of Portugal</option>
    <option value="3~Qatar">Qatar</option>
    <option value="1~Republic of the Congo">Republic of the Congo</option>
    <option value="2~Romania">Romania</option>
    <option value="2~Russia - Kaliningrad Oblast">Russia - Kaliningrad Oblast</option>
    <option value="3~Russia - Most of European Russia">Russia - Most of European Russia</option>
    <option value="4~Russia - Astrakhan Oblast, Samara Oblast, Saratov Oblast, Udmurtia, and Ulyanovsk Oblast">Russia - Astrakhan Oblast, Samara Oblast, Saratov Oblast, Udmurtia, and Ulyanovsk Oblast</option>
    <option value="5~Russia - Bashkortostan, Chelyabinsk Oblast, Khanty–Mansia, Kurgan Oblast, Orenburg Oblast, Perm Krai, Sverdlovsk Oblast, Tyumen Oblast, and Yamalia">Russia - Bashkortostan, Chelyabinsk Oblast, Khanty–Mansia, Kurgan Oblast, Orenburg Oblast, Perm Krai, Sverdlovsk Oblast, Tyumen Oblast, and Yamalia</option>
    <option value="6~Russia - Omsk Oblast">Russia - Omsk Oblast</option>
    <option value="7~Russia - Altai Krai, Altai Republic, Kemerovo Oblast, Khakassia, Krasnoyarsk Krai, Novosibirsk Oblast, Tomsk Oblast, and Tuva">Russia - Altai Krai, Altai Republic, Kemerovo Oblast, Khakassia, Krasnoyarsk Krai, Novosibirsk Oblast, Tomsk Oblast, and Tuva</option>
    <option value="8~Russia - Buryatia and Irkutsk Oblast">Russia - Buryatia and Irkutsk Oblast</option>
    <option value="9~Russia - Amur Oblast, western Sakha Republic, and Zabaykalsky Krai">Russia - Amur Oblast, western Sakha Republic, and Zabaykalsky Krai</option>
    <option value="10~Russia - Jewish Autonomous Oblast, Khabarovsk Krai, Primorsky Krai, and central Sakha Republic">Russia - Jewish Autonomous Oblast, Khabarovsk Krai, Primorsky Krai, and central Sakha Republic</option>
    <option value="11~Russia - Magadan Oblast, eastern Sakha, and Sakhalin Oblast">Russia - Magadan Oblast, eastern Sakha, and Sakhalin Oblast</option>
    <option value="12~Russia - Chukotka and Kamchatka Krai">Russia - Chukotka and Kamchatka Krai</option>
    <option value="2~Rwanda">Rwanda</option>
    <option value="-4~Saint Kitts and Nevis">Saint Kitts and Nevis</option>
    <option value="-4~Saint Lucia">Saint Lucia</option>
    <option value="-4~Saint Vincent and the Grenadines">Saint Vincent and the Grenadines</option>
    <option value="13~Samoa">Samoa</option>
    <option value="1~San Marino">San Marino</option>
    <option value="0~São Tomé and Príncipe">São Tomé and Príncipe</option>
	<option value="3~Saudi Arabia">Saudi Arabia</option>
    <option value="0~Senegal">Senegal</option>
    <option value="1~Serbia">Serbia</option>
    <option value="4~Seychelles">Seychelles</option>
    <option value="0~Sierra Leone">Sierra Leone</option>
    <option value="8~Singapore">Singapore</option>
    <option value="1~Slovakia">Slovakia</option>
    <option value="1~Slovenia">Slovenia</option>
    <option value="11~Solomon Islands">Solomon Islands</option>
    <option value="3~Somalia">Somalia</option>
    <option value="3~South Africa - Prince Edward Islands">South Africa - Prince Edward Islands</option>
    <option value="2~South Africa - main territory">South Africa - main territory</option>
    <option value="3~South Sudan">South Sudan</option>
    <option value="0~Spain - Canary Islands">Spain - Canary Islands</option>
    <option value="1~Spain - main territory of Spain">Spain - main territory of Spain</option>
    <option value="5:30~Sri Lanka">Sri Lanka</option>
    <option value="2~Sudan">Sudan</option>
    <option value="-3~Suriname">Suriname</option>
    <option value="1~Sweden">Sweden</option>
    <option value="1~Switzerland">Switzerland</option>
    <option value="2~Syria">Syria</option>
    <option value="8~Taiwan">Taiwan</option>
    <option value="5~Tajikistan">Tajikistan</option>
    <option value="3~Tanzania">Tanzania</option>
    <option value="7~Thailand">Thailand</option>
    <option value="0~Togo">Togo</option>
    <option value="13~Tonga">Tonga</option>
    <option value="-4~Trinidad and Tobago">Trinidad and Tobago</option>
    <option value="1~Tunisia">Tunisia</option>
    <option value="3~Turkey">Turkey</option>
    <option value="5~Turkmenistan">Turkmenistan</option>
    <option value="12~Tuvalu">Tuvalu</option>
    <option value="3~Uganda">Uganda</option>
    <option value="3~Ukraine - occupied parts of Donetsk and Luhansk regions">Ukraine - occupied parts of Donetsk and Luhansk regions</option>
    <option value="2~Ukraine - Most of the country">Ukraine - Most of the country</option>
    <option value="4~United Arab Emirates">United Arab Emirates</option>
    <option value="-8~United Kingdom - Pitcairn Islands">United Kingdom - Pitcairn Islands</option>
    <option value="-5~United Kingdom - Cayman Islands, Turks and Caicos Islands">United Kingdom - Cayman Islands, Turks and Caicos Islands</option>
    <option value="-4~United Kingdom - Anguilla, Bermuda, British Virgin Islands, Montserrat">United Kingdom - Anguilla, Bermuda, British Virgin Islands, Montserrat</option>
    <option value="-3~United Kingdom - Falkland Islands">United Kingdom - Falkland Islands</option>
    <option value="-2~United Kingdom - South Georgia and the South Sandwich Islands">United Kingdom - South Georgia and the South Sandwich Islands</option>
    <option value="0~United Kingdom - main territory of the United Kingdom, Saint Helena, Ascension and Tristan da Cunha, Guernsey, Isle of Man, Jersey">United Kingdom - main territory of the United Kingdom, Saint Helena, Ascension and Tristan da Cunha, Guernsey, Isle of Man, Jersey</option>
    <option value="1~United Kingdom - Gibraltar">United Kingdom - Gibraltar</option>
    <option value="2~United Kingdom - Akrotiri and Dhekelia">United Kingdom - Akrotiri and Dhekelia</option>
    <option value="6~United Kingdom - British Indian Ocean Territory">United Kingdom - British Indian Ocean Territory</option>
    <option value="-12~United States - Baker Island and Howland Island">United States - Baker Island and Howland Island</option>
    <option value="-11~United States - American Samoa, Jarvis Island, Kingman Reef, Midway Atoll and Palmyra Atoll">United States - American Samoa, Jarvis Island, Kingman Reef, Midway Atoll and Palmyra Atoll</option>
    <option value="-10~United States - Hawaii, most of the Aleutian Islands, and Johnston Atoll">United States - Hawaii, most of the Aleutian Islands, and Johnston Atoll</option>
    <option value="-9~United States - Most of the state of Alaska">United States - Most of the state of Alaska</option>
    <option value="-8~United States - the Pacific Coast states and Nevada">United States - the Pacific coast states and Nevada</option>
    <option value="-7~United States - the Mountain states plus the Western parts of some adjacent states">United States - the Mountain states plus western parts of some adjacent states</option>
    <option value="-6~United States - Gulf Coast to the Great Lakes">United States - Gulf Coast to the Great Lakes</option>
    <option value="-5~United States - All the states from the Great Lakes down to Florida and east to the Atlantic coast">United States - All the states from the Great Lakes down to Florida and east to the Atlantic coast</option>
    <option value="-4~United States - Puerto Rico, the US Virgin Islands">United States - Puerto Rico, the US Virgin Islands</option>
    <option value="10~United States - Guam and the Northern Mariana Islands">United States - Guam and the Northern Mariana Islands</option>
    <option value="12~United States - Wake Island, McMurdo Station, and Amundsen–Scott South Pole Station">United States - Wake Island, McMurdo Station, and Amundsen–Scott South Pole Station</option>
    <option value="-3~Uruguay">Uruguay</option>
    <option value="5~Uzbekistan">Uzbekistan</option>
    <option value="11~Vanuatu">Vanuatu</option>
    <option value="1~Vatican City">Vatican City</option>
    <option value="-4~Venezuela">Venezuela</option>
    <option value="7~Vietnam">Vietnam</option>
    <option value="3~Yemen">Yemen</option>
    <option value="2~Zambia">Zambia</option>
    <option value="2~Zimbabwe">Zimbabwe</option>
	</select>
      <input type="hidden" name="csrf" value="<%=db.csrftoken()%>">
      <button class="subbtn" type="submit">Update</button>
	</form>
    <!-- Workplace -->
    <form class="form-section" action="set-one.jsp" method="POST">
      <h2><i class="fa-solid fa-building"></i> <%=db.infoadded(ix, 1) != null ? "Edit your workplace" : "Add your workplace"%></h2>
      <label for="job">Name of your company/institution</label>
      <input id="job" class="input-field" name="job" maxlength="100" placeholder="Name of your company/institution" value="<%=db.infoadded(ix, 1) != null ? db.infoadded(ix, 1) : ""%>">
      <input type="hidden" name="csrf" value="<%=db.csrftoken()%>">
      <button class="subbtn" type="submit">Update</button>
	</form>
    <!-- Position -->
    <form class="form-section" action="set-one.jsp" method="POST">
      <h2><i class="fa-solid fa-user-tie"></i> <%=db.infoadded(ix, 2) != null ? "Edit your position at work" : "Add your position at work"%></h2>
      <label for="pos">Your role at the company/institution</label>
      <input id="pos" class="input-field" name="pos" maxlength="100" placeholder="Your role at the company/institution" value="<%=db.infoadded(ix, 2) != null ? db.infoadded(ix, 2) : ""%>">
      <input type="hidden" name="csrf" value="<%=db.csrftoken()%>">
      <button class="subbtn" type="submit">Update</button>
	</form>
    <!-- Relationship Status -->
    <form class="form-section" action="set-one.jsp" method="POST">
      <h2><i class="fa-solid fa-heart"></i> <%=db.infoadded(ix, 3) != null ? "Edit your relationship status" : "Add your relationship status"%></h2>
      <label for="relationship">Relationship status</label>
      <select id="relationship" name="relationship" class="input-field">
        <option value="Single" <%= "Single".equals(db.infoadded(ix, 3)) ? "selected" : "" %>>Single</option>
        <option value="In a relationship" <%= "In a relationship".equals(db.infoadded(ix, 3)) ? "selected" : "" %>>In a relationship</option>
        <option value="Married" <%= "Married".equals(db.infoadded(ix, 3)) ? "selected" : "" %>>Married</option>
        <option value="Divorced" <%= "Divorced".equals(db.infoadded(ix, 3)) ? "selected" : "" %>>Divorced</option>
    </select>
      <input type="hidden" name="csrf" value="<%=db.csrftoken()%>">
      <button class="subbtn" type="submit">Update</button>
    </form>
    <!-- Facebook ID -->
    <form class="form-section" action="set-one.jsp" method="POST">
      <h2><i class="fa-brands fa-facebook"></i> <%=db.infoadded(ix, 4) != null ? "Edit your Facebook ID" : "Add your Facebook ID"%></h2>
      <label for="fbid">facebook.com/</label>
      <input id="fbid" class="input-field" name="fbid" maxlength="50" minlength="2" placeholder="(only write id) i.e. john.doe12" value="<%=db.infoadded(ix, 4) != null ? db.infoadded(ix, 4) : ""%>">
      <input type="hidden" name="csrf" value="<%=db.csrftoken()%>">
      <button class="subbtn" type="submit">Update</button>
    </form>
    <!-- Messenger ID -->
    <form class="form-section" action="set-one.jsp" method="POST">
      <h2><i class="fa-brands fa-facebook-messenger"></i> <%=db.infoadded(ix, 5) != null ? "Edit your Messenger ID" : "Add your Messenger ID"%></h2>
      <label for="msngr">m.me/</label>
      <input id="msngr" class="input-field" name="msngr" maxlength="50" minlength="2" placeholder="john.doe12" value="<%=db.infoadded(ix, 5) != null ? db.infoadded(ix, 5) : ""%>">
      <input type="hidden" name="csrf" value="<%=db.csrftoken()%>">
      <button class="subbtn" type="submit">Update</button>
    </form>
    <!-- Instagram ID -->
    <form class="form-section" action="set-one.jsp" method="POST">
      <h2><i class="fa-brands fa-instagram"></i> <%=db.infoadded(ix, 6) != null ? "Edit your Instagram ID" : "Add your Instagram ID"%></h2>
      <label for="instaid">instagram.com/</label>
      <input id="instaid" class="input-field" name="instaid" maxlength="50" minlength="2" placeholder="john.doe12" value="<%=db.infoadded(ix, 6) != null ? db.infoadded(ix, 6) : ""%>">
      <input type="hidden" name="csrf" value="<%=db.csrftoken()%>">
      <button class="subbtn" type="submit">Update</button>
	</form>
	</div>
	</div>
<script>
function updateCharCount(field) {
  const counter = document.getElementById('bio-count');
  counter.textContent = field.value.length;
  if (field.value.length > 299) {
    counter.style.color = 'var(--accent-danger)';
  } else {
    counter.style.color = 'var(--text-muted)';
  }
}
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
	</script>
	<%
	} catch(Exception ex) {
		response.sendRedirect("settings.jsp");
		System.out.print(ex+"at update-information.jsp");
		}
	%>
	</body>
	</html>