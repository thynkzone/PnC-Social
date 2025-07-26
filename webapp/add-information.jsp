<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.thynkzone.jsp.*" %>
<%
String ix = db.userid(request);
if (ix != null) {
    String[] fetches = db.nameico(ix);
    String pname = fetches[0];
    if (pname != null && pname.length() > 1) {
        response.sendRedirect("index.jsp");
        return;
    }
}
%>
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
* {
  box-sizing: border-box !important;
}
.form-section {
  margin: 1.2rem 0;
  max-width: 600px;
  width: 100%;
  background: var(--bg-card);
  border-radius: 16px;
  box-shadow: var(--shadow-md);
  padding: 1.2rem 1rem 1rem 1rem;
  overflow: hidden;
  text-align: left;
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
  border-radius: 12px;
  color: var(--text-primary);
  font-size: 1rem;
  font-family: inherit;
  transition: box-shadow 0.2s;
  margin-bottom: 1.75rem;
  box-shadow: none;
  border: none;
  background: #23232a;
  border: 1px solid var(--border-primary);
}
.input-field:focus, textarea:focus, select:focus {
  border-color: var(--accent-primary);
  outline: 2px solid var(--accent-primary);
  background: #282c34;
}
.radio-group {
  display: flex;
  gap: 1.5rem;
  margin-bottom: 1.2rem;
  align-items: center;
}
.radio-group label {
  margin-left: 0.3em;
  font-weight: 500;
  color: var(--text-secondary);
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
  padding: 1rem 1rem 0.8rem 1rem;
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
<nav class="topnav" id="myTopnav" role="navigation" aria-label="Main Navigation">
  <div class="container">
    <a href="index.jsp" aria-label="Home">
      <img class="thinking" src="icon/p&c.png" alt="P&C Logo" />
    </a>
  </div>
</nav>
<div id="content" class="content">
  <div class="profile-edit-container">
    <div class="profile-header-card">
      <div class="profile-edit-header">
        <i class="fa-solid fa-user-plus"></i>
        Please complete your profile
      </div>
    </div>
    <form class="form-section" name="frm" action="personal.jsp" method="POST" autocomplete="off">
      <h2><i class="fa-solid fa-user"></i> First Name</h2>
      <label for="first">(In English)</label>
      <input class="input-field" type="text" id="first" name="first" placeholder="Tony" minlength="2" maxlength="50" required>
      <h2><i class="fa-solid fa-user"></i> Surname</h2>
      <label for="sur">(In English)</label>
      <input class="input-field" type="text" id="sur" name="sur" placeholder="Stark" minlength="2" maxlength="50" required>
      <h2><i class="fa-solid fa-cake-candles"></i> Birthday</h2>
      <input class="input-field" type="date" id="bday" name="bday" required>
      <h2><i class="fa-solid fa-venus-mars"></i> Gender</h2>
      <div class="radio-group">
        <label><input type="radio" name="gender" value="Male" required> Male</label>
        <label><input type="radio" name="gender" value="Female"> Female</label>
        <label><input type="radio" name="gender" value="Other"> Other</label>
      </div>
      <h2><i class="fa-solid fa-flag"></i> Nationality</h2>
      <select class="input-field" name="country" required>
        <option value="Afghanistan">Afghanistan</option>
        <option value="Albania">Albania</option>
        <option value="Algeria">Algeria</option>
        <option value="Andorra">Andorra</option>
        <option value="Angola">Angola</option>
        <option value="Antarctica">Antarctica</option>
        <option value="Antigua and Barbuda">Antigua and Barbuda</option>
        <option value="Argentina">Argentina</option>
        <option value="Armenia">Armenia</option>
        <option value="Australia">Australia</option>
        <option value="Austria">Austria</option>
        <option value="Azerbaijan">Azerbaijan</option>
        <option value="Bahamas">Bahamas</option>
        <option value="Bahrain">Bahrain</option>
        <option value="Bangladesh">Bangladesh</option>
        <option value="Barbados">Barbados</option>
        <option value="Belarus">Belarus</option>
        <option value="Belgium">Belgium</option>
        <option value="Belize">Belize</option>
        <option value="Benin">Benin</option>
        <option value="Bhutan">Bhutan</option>
        <option value="Bolivia">Bolivia</option>
        <option value="Bosnia and Herzegovina">Bosnia and Herzegovina</option>
        <option value="Botswana">Botswana</option>
        <option value="Brazil">Brazil</option>
        <option value="Brunei">Brunei</option>
        <option value="Bulgaria">Bulgaria</option>
        <option value="Burkina Faso">Burkina Faso</option>
        <option value="Burundi">Burundi</option>
        <option value="Cambodia">Cambodia</option>
        <option value="Cameroon">Cameroon</option>
        <option value="Canada">Canada</option>
        <option value="Cape Verde">Cape Verde</option>
        <option value="Central African Republic">Central African Republic</option>
        <option value="Chad">Chad</option>
        <option value="Chile">Chile</option>
        <option value="China">China</option>
        <option value="Colombia">Colombia</option>
        <option value="Comoros">Comoros</option>
        <option value="Costa Rica">Costa Rica</option>
        <option value="Croatia">Croatia</option>
        <option value="Cuba">Cuba</option>
        <option value="Cyprus">Cyprus</option>
        <option value="Czech Republic">Czech Republic</option>
        <option value="Democratic Republic of the Congo">Democratic Republic of the Congo</option>
        <option value="Denmark">Denmark</option>
        <option value="Djibouti">Djibouti</option>
        <option value="Dominica">Dominica</option>
        <option value="Dominican Republic">Dominican Republic</option>
        <option value="East Timor">East Timor</option>
        <option value="Ecuador">Ecuador</option>
        <option value="Egypt">Egypt</option>
        <option value="El Salvador">El Salvador</option>
        <option value="Equatorial Guinea">Equatorial Guinea</option>
        <option value="Eritrea">Eritrea</option>
        <option value="Estonia">Estonia</option>
        <option value="Eswatini (Swaziland)">Eswatini (Swaziland)</option>
        <option value="Ethiopia">Ethiopia</option>
        <option value="Federated States of Micronesia">Federated States of Micronesia</option>
        <option value="Fiji">Fiji</option>
        <option value="Finland">Finland</option>
        <option value="France">France</option>
        <option value="Gabon">Gabon</option>
        <option value="Gambia">Gambia</option>
        <option value="Georgia">Georgia</option>
        <option value="Germany">Germany</option>
        <option value="Ghana">Ghana</option>
        <option value="Greece">Greece</option>
        <option value="Grenada">Grenada</option>
        <option value="Guatemala">Guatemala</option>
        <option value="Guinea">Guinea</option>
        <option value="Guinea-Bissau">Guinea-Bissau</option>
        <option value="Guyana">Guyana</option>
        <option value="Haiti">Haiti</option>
        <option value="Honduras">Honduras</option>
        <option value="Hungary">Hungary</option>
        <option value="Iceland">Iceland</option>
        <option value="India">India</option>
        <option value="Indonesia">Indonesia</option>
        <option value="Iran">Iran</option>
        <option value="Iraq">Iraq</option>
        <option value="Ireland">Ireland</option>
        <option value="Israel">Israel</option>
        <option value="Italy">Italy</option>
        <option value="Ivory Coast">Ivory Coast</option>
        <option value="Jamaica">Jamaica</option>
        <option value="Japan">Japan</option>
        <option value="Jordan">Jordan</option>
        <option value="Kenya">Kenya</option>
        <option value="North Korea">North Korea</option>
        <option value="South Korea">South Korea</option>
        <option value="Kazakhstan">Kazakhstan</option>
        <option value="Kuwait">Kuwait</option>
        <option value="Kingdom of the Netherlands">Kingdom of the Netherlands</option>
        <option value="Kiribati">Kiribati</option>
        <option value="Kyrgyzstan">Kyrgyzstan</option>
        <option value="Laos">Laos</option>
        <option value="Latvia">Latvia</option>
        <option value="Lebanon">Lebanon</option>
        <option value="Lesotho">Lesotho</option>
        <option value="Liberia">Liberia</option>
        <option value="Libya">Libya</option>
        <option value="Liechtenstein">Liechtenstein</option>
        <option value="Lithuania">Lithuania</option>
        <option value="Luxembourg">Luxembourg</option>
        <option value="Madagascar">Madagascar</option>
        <option value="Malawi">Malawi</option>
        <option value="Malaysia">Malaysia</option>
        <option value="Maldives">Maldives</option>
        <option value="Mali">Mali</option>
        <option value="Malta">Malta</option>
        <option value="Marshall Islands">Marshall Islands</option>
        <option value="Mauritania">Mauritania</option>
        <option value="Mauritius">Mauritius</option>
        <option value="Mexico">Mexico</option>
        <option value="Moldova">Moldova</option>
        <option value="Monaco">Monaco</option>
        <option value="Mongolia">Mongolia</option>
        <option value="Montenegro">Montenegro</option>
        <option value="Morocco">Morocco</option>
        <option value="Mozambique">Mozambique</option>
        <option value="Myanmar">Myanmar</option>
        <option value="Namibia">Namibia</option>
        <option value="Nauru">Nauru</option>
        <option value="Nepal">Nepal</option>
        <option value="New Zealand">New Zealand</option>
        <option value="Nicaragua">Nicaragua</option>
        <option value="Niger">Niger</option>
        <option value="Nigeria">Nigeria</option>
        <option value="North Macedonia">North Macedonia</option>
        <option value="Norway">Norway</option>
        <option value="Oman">Oman</option>
        <option value="Pakistan">Pakistan</option>
        <option value="Palau">Palau</option>
        <option value="Palestine">Palestine</option>
        <option value="Panama">Panama</option>
        <option value="Papua New Guinea">Papua New Guinea</option>
        <option value="Paraguay">Paraguay</option>
        <option value="Peru">Peru</option>
        <option value="Philippines">Philippines</option>
        <option value="Poland">Poland</option>
        <option value="Portugal">Portugal</option>
        <option value="Qatar">Qatar</option>
        <option value="Republic of the Congo">Republic of the Congo</option>
        <option value="Romania">Romania</option>
        <option value="Russia">Russia</option>
        <option value="Rwanda">Rwanda</option>
        <option value="Saint Kitts and Nevis">Saint Kitts and Nevis</option>
        <option value="Saint Lucia">Saint Lucia</option>
        <option value="Saint Vincent and the Grenadines">Saint Vincent and the Grenadines</option>
        <option value="Samoa">Samoa</option>
        <option value="San Marino">San Marino</option>
        <option value="São Tomé and Príncipe">São Tomé and Príncipe</option>
		<option value="Saudi Arabia">Saudi Arabia</option>
        <option value="Senegal">Senegal</option>
        <option value="Serbia">Serbia</option>
        <option value="Seychelles">Seychelles</option>
        <option value="Sierra Leone">Sierra Leone</option>
        <option value="Singapore">Singapore</option>
        <option value="Slovakia">Slovakia</option>
        <option value="Slovenia">Slovenia</option>
        <option value="Solomon Islands">Solomon Islands</option>
        <option value="Somalia">Somalia</option>
        <option value="South Africa">South Africa</option>
        <option value="South Sudan">South Sudan</option>
        <option value="Spain">Spain</option>
        <option value="Sri Lanka">Sri Lanka</option>
        <option value="Sudan">Sudan</option>
        <option value="Suriname">Suriname</option>
        <option value="Sweden">Sweden</option>
        <option value="Switzerland">Switzerland</option>
        <option value="Syria">Syria</option>
        <option value="Taiwan">Taiwan</option>
        <option value="Tajikistan">Tajikistan</option>
        <option value="Tanzania">Tanzania</option>
        <option value="Thailand">Thailand</option>
        <option value="Togo">Togo</option>
        <option value="Tonga">Tonga</option>
        <option value="Trinidad and Tobago">Trinidad and Tobago</option>
        <option value="Tunisia">Tunisia</option>
        <option value="Turkey">Turkey</option>
        <option value="Turkmenistan">Turkmenistan</option>
        <option value="Tuvalu">Tuvalu</option>
        <option value="Uganda">Uganda</option>
        <option value="Ukraine">Ukraine</option>
        <option value="United Arab Emirates">United Arab Emirates</option>
        <option value="United Kingdom">United Kingdom</option>
        <option value="United States">United States</option>
        <option value="Uruguay">Uruguay</option>
        <option value="Uzbekistan">Uzbekistan</option>
        <option value="Vanuatu">Vanuatu</option>
        <option value="Vatican City">Vatican City</option>
        <option value="Venezuela">Venezuela</option>
        <option value="Vietnam">Vietnam</option>
        <option value="Yemen">Yemen</option>
        <option value="Zambia">Zambia</option>
        <option value="Zimbabwe">Zimbabwe</option>
    	</select>
      <h2><i class="fa-solid fa-earth-asia"></i> Country of Residence</h2>
      <label>Note - Select on the Basis of Time Zones.</label>
      <select class="input-field" name="timezone" required size="4">
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
      <h2><i class="fa-solid fa-quote-left"></i> Quote Something</h2>
      <label for="bio">(within 300 characters)</label>
      <textarea class="input-field" id="bio" name="bio" rows="5" cols="50" style="resize: none;" placeholder="Say Something About Yourself (within 300 characters)" maxlength="299" required oninput="updateCharCount(this)"></textarea>
      <div class="char-counter"><span id="bio-count">0</span>/299 characters</div>
      <input type="hidden" name="csrf" value="<%=db.csrftoken()%>">
      <button class="subbtn" type="submit">SUBMIT</button>
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
</script>
</body>
</html>