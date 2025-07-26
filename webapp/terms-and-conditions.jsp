<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.thynkzone.jsp.*" %>
<%@ page import="antisamyfile.antisamy" %>

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
  --radius-btn: 12px;
  --radius-card: 16px;
}
	body {
font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Arial, sans-serif;  background: var(--bg-main);
  color: var(--text-primary);
  margin: 0;
  min-height: 100vh;
  transition: background 0.3s, color 0.3s;
}
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
.terms-container {
  max-width: 900px;
  margin: 2rem auto;
  padding: 0 1rem;
}
.terms-card {
  background: var(--bg-card);
  border-radius: var(--radius-card);
  padding: 2.5rem 2rem 2rem 2rem;
  margin-bottom: 2rem;
  border: 1px solid var(--border-primary);
  box-shadow: var(--shadow-md);
}
.terms-card h1 {
  font-size: 2.1rem;
  font-weight: 700;
  color: var(--accent-primary);
  margin-bottom: 1.2rem;
  text-align: center;
}
.terms-card h2, .terms-card strong {
  color: var(--accent-primary);
  font-size: 1.15rem;
  font-weight: 600;
  margin-top: 2rem;
  margin-bottom: 0.7rem;
  display: block;
}
.terms-card p, .terms-card ul, .terms-card li, .terms-card div {
  font-size: 1rem;
  line-height: 1.7;
  color: var(--text-primary);
  margin-bottom: 1.5rem;
}
.terms-card ul {
  margin-left: 1.5rem;
  margin-bottom: 1.5rem;
}
.terms-card a {
  color: var(--accent-primary);
  text-decoration: underline;
  font-weight: 500;
}
.terms-card a:hover {
  color: var(--accent-secondary);
}
.terms-card .founder {
  font-weight: 600;
  color: var(--accent-primary);
  margin-bottom: 1.5rem;
  display: block;
}
@media (max-width: 700px) {
  .terms-container {
    padding: 0 0.5rem;
    margin: 1rem auto;
  }
  .terms-card {
    padding: 1.5rem 0.7rem 1.2rem 0.7rem;
    border-radius: 10px;
  }
  .terms-card h1 {
    font-size: 1.5rem;
  }
}
	</style>
	</head>
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
      <a href="settings.jsp" title="Settings" aria-label="Settings">
        <i class="fa-solid fa-gear"></i>
      </a>
    </div>
  </div>
</nav>
<div class="terms-container">
  <div class="terms-card">
    <h1>Privacy Policy &amp; Terms and Conditions</h1>
    <p>Thynkzone is a type of social networking service where you get to share your ideas with your friends, react and comment as you wish on their ideas as well as make new friends from around the world.</p>
    <p>Users are not required to pay for any product unless they choose to advertise something in the site. There are different types of advertisement plans to choose from according to need. Payment processing is entirely powered by PayPal.</p>
    <p>Thynkzone basically runs on the content that you provide like most of the social networking sites. The posts will be the ideas that you share but there is a privacy option that you may wish to choose to limit your ideas amongst your friends. By agreeing to use Thynkzone you agree to enrich Thynkzone with your ideas and not blame the site for sharing them to people. A user can delete their account anytime they wish, which will entirely delete their posts and other information from their profile. Other than that, a user can also specifically delete any of his own posts that he chooses. Thynkzone believes users should post ideas they want to get shared and not the ideas they want to keep to themselves as a part of their intellectual property or future plan.</p>
    <p>By agreeing to use Thynkzone, you are also agreeing to respect other’s ideas and opinions and not spread any sort of hate or spam or vulgar things in the site.</p>
    <p>We require cookies for your preferences in the site, and we restrict cookies from sharing to other sites for your privacy.</p>
    <span class="founder"><a href="https://github.com/mazidulfarabi" title="GitHub Profile">Md. Mazidul Haque Farabi</a> is the Founder and Owner of Thynkzone.</span>
    <p>When using Thynkzone, we collect some information about you to separate you from other users and keep your profile updated. Most of the information which is found in the settings page can be updated by you and that is completely a choice, if you actually want to share this information with Thynkzone. And thus you are sharing any information to Thynkzone upon your full consent.</p>
    <p>We try our best to keep the most personal things like the emails and passwords completely out of reach of other users and from the whole world. We take some security measures to avoid hacking such as hashing of passwords. Google reCaptcha version 2 and 3 are live in the sign up and login page of our site to detect and report suspicious activity. While we try our best, it is up to you if you want to trust us. And trusting Thynkzone means you give consent to Thynkzone to handle your data, and failure to do so in the future due to any unethical hacking attempt would mean Thynkzone is not directly to blame since you had the chance to not use Thynkzone in the first place. Your private information is our responsibility and we take our responsibilities seriously. But the problem with the Internet world is that there is always a way to break things and we work hard to not let that happen. You can trust us with your email and passwords and we won’t spam you or sell your information in any other place.</p>
    <p>Thynkzone doesn’t fetch your location directly by your IP-address, and so we provide you with the option of choosing your location based on the International time zone to assist you in displaying the time of posts and things to your regional preference. As of already said in the Privacy Policy paragraph, By agreeing to use Thynkzone, you agree to enrich Thynkzone with your ideas and not blame the site for sharing them with people.</p>
    <strong>Terms &amp; Conditions</strong>
    <p>Terms of Service<br><br>
      By downloading or using the app, these terms will automatically apply to you – you should make sure therefore that you read them carefully before using the app. You’re not allowed to copy or modify the app, any part of the app, or our trademarks in any way. You’re not allowed to attempt to extract the source code of the app, and you also shouldn’t try to translate the app into other languages or make derivative versions. The app itself, and all the trademarks, copyright, database rights, and other intellectual property rights related to it, still belong to Thynkzone.
    </p>
    <p>
      Thynkzone is committed to ensuring that the app is as useful and efficient as possible. For that reason, we reserve the right to make changes to the app or to charge for its services, at any time and for any reason. We will never charge you for the app or its services without making it very clear to you exactly what you’re paying for.
    </p>
    <p>
      The Thynkzone app stores and processes personal data that you have provided to us, to provide our Service. It’s your responsibility to keep your phone and access to the app secure. We therefore recommend that you do not jailbreak or root your phone, which is the process of removing software restrictions and limitations imposed by the official operating system of your device. It could make your phone vulnerable to malware/viruses/malicious programs, compromise your phone’s security features and it could mean that the Thynkzone app won’t work properly or at all.
    </p>
    <div>
      <p>The app does use third-party services that declare their Terms and Conditions.</p>
      <p>Link to Terms and Conditions of third-party service providers used by the app</p>
      <ul>
        <li><a href="https://policies.google.com/terms" target="_blank" rel="noopener noreferrer">Google Play Services</a></li>
      </ul>
	</div>
    <p>
      You should be aware that there are certain things that Thynkzone will not take responsibility for. Certain functions of the app will require the app to have an active internet connection. The connection can be Wi-Fi or provided by your mobile network provider, but Thynkzone cannot take responsibility for the app not working at full functionality if you don’t have access to Wi-Fi, and you don’t have any of your data allowance left.
    </p>
    <p>
      If you’re using the app outside of an area with Wi-Fi, you should remember that the terms of the agreement with your mobile network provider will still apply. As a result, you may be charged by your mobile provider for the cost of data for the duration of the connection while accessing the app, or other third-party charges. In using the app, you’re accepting responsibility for any such charges, including roaming data charges if you use the app outside of your home territory (i.e. region or country) without turning off data roaming. If you are not the bill payer for the device on which you’re using the app, please be aware that we assume that you have received permission from the bill payer for using the app.
    </p>
    <p>
      Along the same lines, Thynkzone cannot always take responsibility for the way you use the app i.e. You need to make sure that your device stays charged – if it runs out of battery and you can’t turn it on to avail the Service, Thynkzone cannot accept responsibility.
    </p>
    <p>
      With respect to Thynkzone’s responsibility for your use of the app, when you’re using the app, it’s important to bear in mind that although we endeavor to ensure that it is updated and correct at all times, we do rely on third parties to provide information to us so that we can make it available to you. Thynkzone accepts no liability for any loss, direct or indirect, you experience as a result of relying wholly on this functionality of the app.
    </p>
    <p>
      At some point, we may wish to update the app. The app is currently available on Android – the requirements for the system(and for any additional systems we decide to extend the availability of the app to) may change, and you’ll need to download the updates if you want to keep using the app. Thynkzone does not promise that it will always update the app so that it is relevant to you and/or works with the Android version that you have installed on your device. However, you promise to always accept updates to the application when offered to you, We may also wish to stop providing the app, and may terminate use of it at any time without giving notice of termination to you. Unless we tell you otherwise, upon any termination, (a) the rights and licenses granted to you in these terms will end; (b) you must stop using the app, and (if needed) delete it from your device.
    </p>
    <strong>Changes to This Privacy Policy and Terms and Conditions</strong>
    <p>
      We may update our Privacy Policy or Terms and Conditions from time to time. Thus, you are advised to review this page periodically for any changes. We will notify you of any changes by posting the new Privacy Policy or Terms and Conditions on this page.
    </p>
    <p>
                  This privacy policy terms and conditions are effective as of 2022-09-07
    </p>
    <strong>Contact Us</strong>
    <p>
      If you have any questions or suggestions about our Privacy Policy or Terms and Conditions, do not hesitate to contact us at <a href="mailto:thynkzone.help@gmail.com">thynkzone.help@gmail.com</a>.
    </p>
  </div>
	</div>
	</body>
	</html>		