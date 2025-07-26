<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.thynkzone.jsp.*" %>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
	<html lang = "en">
	<head>
	<link rel="icon" href="icon/favicon.ico" type="image/x-icon">
	<title>P&C - Advertisements</title>
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

/* Main content container */
.content {
  max-width: 800px;
	width: 100%;
  margin: 0 auto;
  padding: 1rem;
}

/* Modern Search Bar - Fixed positioning */
#search.search {
  background: transparent !important;
  box-shadow: none !important;
  border: none !important;
  padding: 1rem !important;
  margin-bottom: 1rem;
  position: relative;
  z-index: 10;
}

/* Ensure search bar stays above sticky nav */
.topnav.sticky + #search {
  padding-top: 1rem !important;
}

/* Page headers */
.pghead {
font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Arial, sans-serif;  font-weight: 700;
  font-size: 1.4rem;
  color: var(--accent-primary);
  text-align: center;
  margin: 1rem 0 0.5rem 0;
}

/* Current ads section */
.currads {
  background: var(--bg-card);
  border: 1px solid var(--border-primary);
  border-radius: 8px;
  padding: 1rem;
  margin: 0.5rem 0;
  color: var(--text-secondary);
  box-shadow: var(--shadow-md);
  font-size: 0.9rem;
}

.leaveit {
  background: var(--bg-tertiary);
  border: 1px solid var(--border-primary);
  border-radius: 6px;
  padding: 0.5rem;
  color: var(--text-secondary);
  font-size: 0.8rem;
  margin: 0.5rem 0;
}

.adtick {
  background: var(--accent-primary);
  border-radius: 6px;
color: white;
  padding: 0.75rem;
  margin: 0.5rem 0;
  font-weight: 600;
  text-align: center;
  font-size: 0.9rem;
}

/* Post styling */
.post {
  background: var(--bg-card);
  border: 1px solid var(--border-primary);
  border-radius: 12px;
  padding: 1rem;
  margin-bottom: 1rem;
  box-shadow: var(--shadow-md);
  transition: var(--transition);
}

.post:hover {
  box-shadow: var(--shadow-lg);
  transform: translateY(-1px);
}

.postupper {
  margin-bottom: 0.75rem;
}

.postupper a {
  color: var(--accent-primary);
  text-decoration: none;
  font-weight: 600;
}

.postupper img {
  width: 32px;
  height: 32px;
  border-radius: 50%;
  margin-right: 0.5rem;
vertical-align: middle;
}

.posttextp {
  color: var(--text-primary);
  line-height: 1.5;
  margin: 0.75rem 0;
  font-size: 0.9rem;
}

.disc2 {
  max-width: 100%;
  border-radius: 8px;
  margin: 0.75rem 0;
}

/* Pricing tables - more compact */
.columns {
  box-sizing: border-box;
  float: left;
  width: 33.3%;
  padding: 4px;
  margin-bottom: 1rem;
}

.price {
  list-style-type: none;
  border: 1px solid var(--border-primary);
  border-radius: 12px;
  margin: 0;
  padding: 0;
  background: var(--bg-card);
  transition: var(--transition);
  overflow: hidden;
}

.price:hover {
  box-shadow: var(--shadow-lg);
  transform: translateY(-2px);
}

.price .header {
  background: linear-gradient(135deg, var(--accent-primary), var(--accent-secondary));
  color: white;
  font-size: 1.1rem;
  font-weight: 700;
  padding: 1rem;
  text-align: center;
}

.price li {
  border-bottom: 1px solid var(--border-primary);
  padding: 0.75rem;
  text-align: center;
  color: var(--text-primary);
  font-size: 0.85rem;
}

.price .grey {
  background: linear-gradient(135deg, var(--accent-primary), var(--accent-secondary));
  color: white;
  font-size: 1rem;
  font-weight: 600;
}

.button {
  background: linear-gradient(135deg, var(--accent-primary), var(--accent-secondary));
  border: none;
  color: white;
  padding: 0.5rem 1rem;
  text-align: center;
  text-decoration: none;
  font-size: 0.85rem;
  font-weight: 600;
  border-radius: 6px;
  transition: var(--transition);
  display: inline-block;
}

.button:hover {
  transform: translateY(-1px);
  box-shadow: var(--shadow-md);
  color: white;
  text-decoration: none;
}

/* FAQ-style Instructions */
.faq-container {
  background: var(--bg-card);
  border: 1px solid var(--border-primary);
  border-radius: 12px;
  margin: 1rem 0;
  box-shadow: var(--shadow-md);
}

.faq-item {
  border-bottom: 1px solid var(--border-primary);
}

.faq-item:last-child {
  border-bottom: none;
}

.faq-question {
  background: var(--bg-tertiary);
  padding: 1rem;
  cursor: pointer;
  display: flex;
  align-items: center;
  justify-content: space-between;
  font-weight: 600;
  color: var(--text-primary);
  transition: var(--transition);
}

.faq-question:hover {
  background: var(--bg-card);
}

.faq-question.active {
  background: var(--accent-primary);
  color: white;
}

.faq-answer {
  padding: 0;
  max-height: 0;
  overflow: hidden;
  transition: max-height 0.3s ease;
}

.faq-answer.active {
  padding: 1rem;
  max-height: 800px;
}

.faq-answer p {
  margin: 0;
  line-height: 1.5;
  color: var(--text-secondary);
  font-size: 0.9rem;
}

.faq-toggle {
  transition: transform 0.3s ease;
}

.faq-question.active .faq-toggle {
  transform: rotate(180deg);
}

/* Compact Create Ad Form - like edit-post.jsp */
.create-ad-form {
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

.create-ad-header {
  display: flex;
  align-items: center;
  gap: 0.7rem;
  font-size: 1.35rem;
  font-weight: 700;
  color: var(--text-primary);
  margin-bottom: 1.2rem;
}

.create-ad-header i {
  color: var(--accent-primary);
}

.ad-form-user {
  display: flex;
  align-items: center;
  gap: 0.7rem;
  text-decoration: none;
  color: var(--text-primary);
  font-weight: 600;
  margin-bottom: 0.7rem;
}

.ad-form-user img {
  width: 52px;
  height: 52px;
  border-radius: 50%;
  object-fit: cover;
  border: 2px solid var(--accent-primary);
}

.ad-form-user span {
  font-size: 1.15rem;
  font-weight: 700;
  margin-left: 0.5rem;
}

/* Floating label for textarea */
.floating-label {
  position: relative;
  width: 100%;
  margin-bottom: 1.5rem;
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
font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Arial, sans-serif;}

.floating-label label {
  position: absolute;
  left: 1.1rem;
  top: 1.1rem;
  color: var(--text-secondary);
  font-size: 1.05rem;
  pointer-events: none;
  background: transparent;
  transition: 0.2s ease all;
font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Arial, sans-serif;}

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
  display: flex;
  align-items: center;
  gap: 0.6rem;
  font-size: 0.97rem;
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

/* Privacy dropdown styles */
.modern-dropdown-group {
  position: relative;
  margin-bottom: 1rem;
}

.modern-dropdown-menu {
  position: absolute;
  top: 100%;
  right: 0;
  background: var(--bg-card);
  border: 1px solid var(--border-primary);
  border-radius: 12px;
  box-shadow: var(--shadow-lg);
  padding: 1rem;
  min-width: 200px;
  z-index: 1000;
  margin-top: 0.5rem;
}

.modern-dropdown-section {
  margin-bottom: 1rem;
}

.modern-dropdown-section:last-child {
  margin-bottom: 0;
}

.modern-dropdown-label {
  font-size: 0.85rem;
  font-weight: 600;
  color: var(--text-secondary);
  margin-bottom: 0.5rem;
  text-transform: uppercase;
  letter-spacing: 0.5px;
font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Arial, sans-serif;}

.modern-dropdown-select {
  width: 100%;
  padding: 0.5rem 0.75rem;
  border: 1px solid var(--border-primary);
  border-radius: 8px;
  background: var(--bg-tertiary);
  color: var(--text-primary);
  font-size: 0.9rem;
  transition: var(--transition);
font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Arial, sans-serif;}

.modern-dropdown-select:focus {
  outline: none;
  border-color: var(--accent-primary);
  box-shadow: 0 0 0 2px rgba(29, 161, 242, 0.1);
}

.privacy-icon-btn {
  background: var(--accent-primary);
  color: #fff;
  border: none;
  border-radius: 50%;
  width: 44px;
  height: 44px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 1.1rem;
  cursor: pointer;
  transition: var(--transition);
  box-shadow: var(--shadow-md);
  position: absolute;
  top: 1rem;
  right: 1rem;
}

.privacy-icon-btn:hover {
  background: var(--accent-secondary);
  transform: translateY(-1px) scale(1.05);
}

.submit-icon-btn {
  background: var(--accent-primary);
  color: #fff;
  border: none;
  border-radius: 50%;
  width: 44px;
  height: 44px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 1.1rem;
  cursor: pointer;
  transition: var(--transition);
  box-shadow: var(--shadow-md);
}

.submit-icon-btn:hover {
  background: var(--accent-secondary);
  transform: translateY(-1px) scale(1.05);
}

.form-center-wrapper {
  display: flex;
  justify-content: center;
  width: 100%;
}

/* Remove old ad-form styles */
.ad-form-textarea,
.ad-form-options,
.ad-form-select,
.ad-form-file,
.ad-form-submit {
  display: none;
}

/* Compact Payment Section */
.payment-section {
  background: var(--bg-card);
  border: 1px solid var(--border-primary);
  border-radius: 12px;
  padding: 1rem;
  margin: 1rem 0;
  box-shadow: var(--shadow-md);
}

.payment-tabs {
  display: flex;
  gap: 0.5rem;
  margin-bottom: 1rem;
}

.payment-tab {
  flex: 1;
  padding: 0.75rem;
  background: var(--bg-tertiary);
  border: 1px solid var(--border-primary);
  border-radius: 6px;
  cursor: pointer;
  transition: var(--transition);
  text-align: center;
  font-size: 0.85rem;
  font-weight: 600;
  color: var(--text-secondary);
}

.payment-tab.active {
  background: var(--accent-primary);
  color: white;
  border-color: var(--accent-primary);
}

.payment-content {
  display: none;
}

.payment-content.active {
  display: block;
}

.payment-content h3 {
  font-size: 1rem;
  margin-bottom: 0.75rem;
  color: var(--text-primary);
}

.payment-content p {
  font-size: 0.85rem;
  color: var(--text-secondary);
  margin-bottom: 0.75rem;
}

.payment-content img {
  max-width: 100%;
  height: auto;
  border-radius: 6px;
  margin: 0.5rem 0;
}

/* Tabs styling */
.tabs {
    max-width: 90%;
    float: none;
    list-style: none;
    padding: 0;
  margin: 2rem auto;
  display: flex;
  background: var(--bg-card);
  border-radius: 12px;
  overflow: hidden;
  box-shadow: var(--shadow-md);
}

.tabs input[type=radio] {
  display: none;
}

.tabs label {
    display: block;
    float: left;
    width: 33.3333%;
  color: var(--text-secondary);
  font-size: 1.1rem;
  font-weight: 600;
    text-decoration: none;
    text-align: center;
  line-height: 3;
    cursor: pointer;
  transition: var(--transition);
  border-bottom: 3px solid transparent;
}

.tabs label:hover {
  color: var(--accent-primary);
  border-bottom-color: var(--accent-primary);
}

.tabs label span {
    display: none;
}

.tabs label i {
    padding: 5px;
    margin-right: 0;
}

.tab-contents {
    display: none;
    width: 100%;
    float: left;
  padding: 2rem;
    box-sizing: border-box;
  background: var(--bg-card);
  border-radius: 12px;
  margin-top: 1rem;
  box-shadow: var(--shadow-md);
}

.tab-contents * {
    animation: scale 0.7s ease-in-out;
}

@keyframes scale {
  0% {
    transform: scale(0.9);
    opacity: 0;
    }
  50% {
    transform: scale(1.01);
    opacity: 0.5;
    }
  100% {
    transform: scale(1);
    opacity: 1;
  }
}

#tab1:checked ~ #tab-content1,
#tab2:checked ~ #tab-content2,
#tab3:checked ~ #tab-content3 {
    display: block;
}

/* Form styling */
.frmdsgn {
  background: var(--bg-card);
  border: 1px solid var(--border-primary);
  border-radius: 16px;
  padding: 2rem;
  margin: 2rem 0;
  box-shadow: var(--shadow-md);
}

.createapost {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  color: var(--accent-primary);
  font-size: 1.3rem;
  font-weight: 600;
  margin-bottom: 1.5rem;
}

.createapost img {
  width: 24px;
  height: 24px;
}

.writehere {
  margin-bottom: 1.5rem;
}

.usernameandpp {
  display: flex;
  align-items: center;
  color: var(--accent-primary);
  text-decoration: none;
  font-weight: 600;
  margin-bottom: 1rem;
}

.usernameandpp img {
  width: 40px;
  height: 40px;
  border-radius: 50%;
  margin-right: 0.5rem;
}

#postboxtext {
  width: 100%;
  min-height: 120px;
  padding: 1rem;
  border: 1px solid var(--border-primary);
  border-radius: 12px;
  background: var(--bg-tertiary);
  color: var(--text-primary);
  font-family: inherit;
  resize: vertical;
  box-sizing: border-box;
}

#postboxtext:focus {
  outline: none;
  border-color: var(--accent-primary);
  box-shadow: 0 0 0 2px rgba(29, 161, 242, 0.2);
}

.bott3 {
  display: flex;
  align-items: center;
  gap: 1rem;
  flex-wrap: wrap;
}

.More, .addp, .done {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  padding: 0.75rem 1rem;
  background: var(--bg-tertiary);
  border: 1px solid var(--border-primary);
  border-radius: 8px;
  cursor: pointer;
  transition: var(--transition);
  color: var(--text-secondary);
}

.More:hover, .addp:hover {
  background: var(--accent-primary);
  color: white;
  border-color: var(--accent-primary);
}

.dn {
  background: var(--accent-primary);
  color: white;
  border: none;
  padding: 0.75rem 2rem;
  border-radius: 8px;
  font-weight: 600;
  cursor: pointer;
  transition: var(--transition);
}

.dn:hover {
  background: var(--accent-secondary);
  transform: translateY(-1px);
}

/* Payment section */
.filters-content {
  margin: 1rem 0;
  padding: 0.375rem;
  border-radius: 0.75rem;
  display: flex;
  justify-content: space-between;
  column-gap: 0.5rem;
  background: var(--bg-card);
  border: 1px solid var(--border-primary);
  box-shadow: var(--shadow-md);
}

.filters__button {
  width: 100%;
  border: none;
  outline: none;
  padding: 0.75rem;
  transition: 0.3s;
  border-radius: 0.5rem;
  background: var(--bg-tertiary);
  color: var(--text-secondary);
  cursor: pointer;
  font-weight: 600;
  font-size: 0.9rem;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 0.5rem;
}

.filters__button:hover {
  background: var(--accent-primary);
  color: white;
  transform: translateY(-1px);
}

.filters [data-content] {
  display: none;
  background: var(--bg-card);
  border: 1px solid var(--border-primary);
  border-radius: 12px;
  padding: 1rem;
  margin-top: 0.5rem;
  box-shadow: var(--shadow-md);
}

[data-content].is-active[data-content] {
  display: block;
}

[data-target].is-active {
  background: var(--accent-primary);
  color: white;
}

/* Payment content styling */
.payment-header {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  font-size: 1.1rem;
  font-weight: 700;
  color: var(--accent-primary);
  margin-bottom: 0.75rem;
  padding-bottom: 0.5rem;
  border-bottom: 1px solid var(--border-primary);
}

.payment-header i {
  font-size: 1rem;
}

.powered {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  font-size: 0.85rem;
  color: var(--text-secondary);
  margin-bottom: 0.75rem;
}

.powered a {
  color: var(--accent-primary);
  text-decoration: none;
}

.powered img {
  height: 18px;
  width: auto;
  border-radius: 4px;
}

/* PayPal form styling */
.paypal-form {
  background: var(--bg-tertiary);
  border: 1px solid var(--border-primary);
  border-radius: 8px;
  padding: 0.75rem;
  margin-bottom: 0.75rem;
}

.paypal-form table {
  width: 100%;
  border-collapse: collapse;
}

.paypal-form td {
  padding: 0.4rem 0;
  color: var(--text-primary);
  font-size: 0.85rem;
}

.paypal-form select,
.paypal-form input[type="text"] {
  width: 100%;
  padding: 0.4rem;
  border: 1px solid var(--border-primary);
  border-radius: 6px;
  background: var(--bg-card);
  color: var(--text-primary);
  font-size: 0.85rem;
  margin-top: 0.2rem;
}

.paypal-form select:focus,
.paypal-form input[type="text"]:focus {
  outline: none;
  border-color: var(--accent-primary);
  box-shadow: 0 0 0 2px rgba(29, 161, 242, 0.1);
}

.paypal-form input[type="image"] {
  margin-top: 0.75rem;
  border-radius: 6px;
  transition: transform 0.2s;
}

.paypal-form input[type="image"]:hover {
  transform: translateY(-1px);
}

/* bKash section styling */
.bkash-section {
  text-align: center;
}

.bkash-section img {
  max-width: 180px;
  height: auto;
  border-radius: 8px;
  margin: 0.75rem 0;
  box-shadow: var(--shadow-md);
}

.bkash-section p {
  color: var(--text-secondary);
  font-size: 0.85rem;
  line-height: 1.4;
  margin: 0.75rem 0;
}

.bkash-section u {
  color: var(--accent-primary);
  text-decoration: none;
  font-weight: 600;
}

/* Credit card icons */
.credit-cards {
  display: flex;
  justify-content: center;
  gap: 0.5rem;
  margin-top: 0.75rem;
  padding-top: 0.75rem;
  border-top: 1px solid var(--border-primary);
}

.credit-cards img {
  height: 20px;
  width: auto;
  opacity: 0.7;
  transition: opacity 0.2s;
}

.credit-cards img:hover {
  opacity: 1;
}

/* Responsive design */
@media only screen and (max-width: 768px) {
  .columns {
    width: 100%;
  }
  
  .tabs {
    max-width: 100%;
  }
  
  .tabs label {
    font-size: 0.9rem;
    line-height: 2.5;
  }
  
  .bott3 {
    flex-direction: column;
    align-items: stretch;
  }
  
  .content {
    padding: 0.5rem;
  }

  .create-ad-form {
    padding: 1rem;
  }
  
  .ad-form-options {
    flex-direction: column;
  }
  
  .payment-tabs {
    flex-direction: column;
  }
}

@media only screen and (max-width: 600px) {
  .columns {
    width: 100%;
  }
  
  .pghead {
    font-size: 1.2rem;
  }
  
  .tab-contents {
    padding: 1rem;
  }

  .price .header {
    font-size: 1rem;
    padding: 0.75rem;
  }
  
  .price li {
    padding: 0.5rem;
    font-size: 0.8rem;
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
			String adticket = uidgen.id().substring(0, 6);
			
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
	
		<body>
	
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
			
	<div id="content" class="content">
	
	<h1 class="pghead"><i class="fa-solid fa-ad"></i> Advertisements</h1>
	<hr style="border-top: 1px solid var(--border-primary); width: 100%; margin: 1rem 0;">
	
	<p class="currads">
		<i class="fa-solid fa-globe"></i> Running World Ad: <%if(db.getCurrentBid(ix, 1) != null) {%><%=db.getCurrentBid(ix, 1)%><%} else {%>None<%}%><br>
		<i class="fa-solid fa-flag"></i> Running <b><%=db.getCurrentBid(ix, 0)%></b> Ad: <%if(db.getCurrentBid(ix, 2) != null) {%><%=db.getCurrentBid(ix, 2)%><%} else {%>None<%}%><br>
	</p>
	
	<p class="currads"> <i class="fa-solid fa-chart-bar"></i> Your Total Number of Ads: <%=db.getAdscount(ix)%></p>
		
			<%
	try
	{
		String msg=session.getAttribute("msg").toString();
		out.print("<p class='notifmsg'>"+msg+"</p>");
		session.removeAttribute("msg");
	} catch (Exception ex){}
	%>
		
		
			<%
			
			Connection conn=null;
			ResultSet rs=null;
			PreparedStatement pstmt = null;

			
			Class.forName(db.name());
			String unamef = db.uname().concat("i");
			String passf = db.pass().concat("09");
			conn=(Connection)DriverManager.getConnection(db.urlth(),unamef,passf);
				
			
			String yourfullname = null;
			String posttext = null;
			String yourpostp = null;
			String posterid = null;
			int privacy;
			String postid;
			String imdir = null;
			boolean exists = false;
			String postistype = null;
			String postisfor = null;
			int posttype;
			int gui = -1;
			int approval;
			String approvestatus = null;
			String trxid = null;
			String countryname = null;
			

			String qry="select * from ads WHERE posterid=?";
			pstmt = conn.prepareStatement(qry, ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			pstmt.setString(1, ix);
			rs=pstmt.executeQuery();
			
			
			while(rs.absolute(gui))
			{
				
				postid = rs.getString(4);
				posttype = rs.getInt(7);				
				privacy = rs.getInt(8);
				approval = rs.getInt(12);
				trxid = rs.getString(11);
				countryname = rs.getString(9);

						posttext = base64.de(rs.getString(5)).replaceAll("(\r\n|\n)", "<br>");
						yourpostp = rs.getString(6);
						if (yourpostp != null) {
							imdir = "img/".concat(yourpostp);
						}
				   %>
				   <div class = "post" id = "<%=postid%>">
				   <div class = "postupper">
				   <a href="profile.jsp?userId=<%=ix%>"><img id = "disc" src = "<%=psmall%>">
			       <%=pname%></a>
				   <br>
				   <%
				   if (approval == 0) {
					   approvestatus = "In Queue";
				   }
				   else if (approval == 1) {
					   approvestatus = "Running";
				   }
				   else if (approval == -1) {
					   approvestatus = "Rejected";
				   }
				   else if (approval == 3) {
					   approvestatus = "Done";
				   }
				   
				   
				   if (posttype == 1) {
					   postistype = "Person";
				   }
				   else if (posttype == 2) {
					   postistype = "Brand";
				   }
				   
				   
				   
				   if (privacy == 6) {
					   postisfor = "World 3x";
				   }
				   else if (privacy == 5) {
					   postisfor = "World 2x";
				   }
				   else if (privacy == 4) {
					   postisfor = "World";
				   }
				   else if (privacy == 3) {
					   postisfor = "Country 3x";
				   }
				   else if (privacy == 2) {
					   postisfor = "Country 2x";
				   }
				   else if (privacy == 1) {
					   postisfor = "Country";
				   }
				   if (countryname != null) {
				   out.print("<p>"+db.timecon(ix, rs.getString(10))+"<br>"+postistype+", "+postisfor+"<br>"+approvestatus+"<br>"+"Ad-ticket: "+trxid+"<br>"+countryname+"</p>");
				   }
				   else {
				   out.print("<p>"+db.timecon(ix, rs.getString(10))+"<br>"+postistype+", "+postisfor+"<br>"+approvestatus+"<br>"+"Ad-ticket: "+trxid+"</p>");
				   }%>
				   </div>
				   <br>
				   <p class="posttextp">
				   <%=posttext%>
				   </p>
				   <% if (imdir != null) {%>
		   		   <img class = "disc2" id = "disc2" src="<%=imdir%>" alt="loading image, refresh page"/>
		   		   <%}%>
				   </div>
				   <%
							gui--;
								}
			%>
			<br>
			<br>

	<h1 class="pghead"><i class="fa-solid fa-map-marker-alt"></i> Country Plans</h1>
	<hr style="border-top: 1px solid var(--border-primary); width: 100%; margin: 1rem 0;">	
	<div class="columns">
  <ul class="price">
    <li class="header">Country</li>
    <li class="grey">$ 3 (BDT ৮০৳)</li>
    <li>24 Hours</li>
    <li>Selected Country</li>
    <li>Fast TTL</li>
    <li>50 Characters</li>
    <li>1 Photo</li>
    <li class="grey"><a href="#postboxtext" class="button">Create</a></li>
  </ul>
</div>

<div class="columns">
  <ul class="price">
    <li class="header">Country 2x</li>
    <li class="grey">$ 4 (BDT ১৪০৳)</li>
    <li>48 Hours</li>
    <li>Selected Country</li>
    <li>Faster TTL</li>
    <li>150 Characters</li>
    <li>1 Photo</li>
    <li class="grey"><a href="#postboxtext" class="button">Create</a></li>
  </ul>
</div>

<div class="columns">
  <ul class="price">
    <li class="header">Country 3x</li>
    <li class="grey">$ 8 (BDT ২০০৳)</li>
    <li>72 Hours</li>
    <li>Selected Country</li>
    <li>Fastest TTL</li>
    <li>300 Characters</li>
    <li>1 Photo</li>
    <li class="grey"><a href="#postboxtext" class="button">Create</a></li>
  </ul>
</div>


	
<h1 class="pghead"><i class="fa-solid fa-globe"></i> World Plans</h1>
<hr style="border-top: 1px solid var(--border-primary); width: 100%; margin: 1rem 0;">	
	<div class="columns">
  <ul class="price">
    <li class="header">World</li>
    <li class="grey">$ 12 (BDT ৪০০৳)</li>
    <li>24 Hours</li>
    <li>The World</li>
    <li>Fast TTL</li>
    <li>50 Characters</li>
    <li>1 Photo</li>
    <li class="grey"><a href="#postboxtext" class="button">Create</a></li>
  </ul>
</div>

<div class="columns">
  <ul class="price">
    <li class="header">World 2x</li>
    <li class="grey">$ 18 (BDT ৮০০৳)</li>
    <li>48 Hours</li>
    <li>The World</li>
    <li>Faster TTL</li>
    <li>150 Characters</li>
    <li>1 Photo</li>
    <li class="grey"><a href="#postboxtext" class="button">Create</a></li>
  </ul>
</div>

<div class="columns">
  <ul class="price">
    <li class="header">World 3x</li>
    <li class="grey">$ 24 (BDT ১২০০৳)</li>
    <li>72 Hours</li>
    <li>The World</li>
    <li>Fastest TTL</li>
    <li>300 Characters</li>
    <li>1 Photo</li>
    <li class="grey"><a href="#postboxtext" class="button">Create</a></li>
  </ul>
</div>
	
	
	<p style="color: var(--text-muted); font-size: 0.9rem; text-align: center; margin: 1rem 0;"><i class="fa-solid fa-info-circle"></i> *$ in CAD</p>
	
	<h3 style="color: var(--accent-primary); font-size: 1.5rem; margin: 2rem 0 1rem 0;"><i class="fa-solid fa-book"></i> Instructions</h3>
	<div class="faq-container">

	    <div class="faq-item">
	        <div class="faq-question">
	            <h4><i class="fa-solid fa-lightbulb"></i> Step 1 - How Ads Work</h4>
	            <span class="faq-toggle"><i class="fa-solid fa-chevron-down"></i></span>
	        </div>
	        <div class="faq-answer">
	        <p>First, make sure you understand what the above table means and the pricing. So, 24/48/72 hours means the total time your ad will be shown in our app. Now fast/faster/fastest TTL, what do they mean? Well, it's actually the time needed for your ad to display when there are other ads active. Thynkzone believes in equality so we don't divide the ads in any way which is unsure if every user will see your ad or not. So we only allow one world ad and one country ad for each country at a time. So it means one world ad and multiple country ads will be active for multiple countries. So which ad type should you go for? For that, check the status of the current world and country ad in the top of your page. So if the status is none, just buy a country/world plan if your character limit and display time criteria meets. Because then there is no queue except just the approval time. But if there was, suppose a country ad running, then you may never know how many more country ads are on queue. So you may just go for a 2x/3x ad. Although it doesn't ensure your ad will be the next one, since there might be one or more 2x/3x ad submitted before you did but after the country/world ad was initially submitted. So those ones will go first. And the character limit is applied on the ads based on their pricing so choose your one that best meets your needs and also goes with your budget.</p>
	        </div>
	    </div>

	    <div class="faq-item">
	        <div class="faq-question">
	            <h4><i class="fa-solid fa-edit"></i> Step 2 - Create an Ad</h4>
	            <span class="faq-toggle"><i class="fa-solid fa-chevron-down"></i></span>
	        </div>
	        <div class="faq-answer">
	        <p>After choosing the right plan, you could fill up the Create Ad form first. Fill up the ad form with your desired words <b>within the character limit</b> of your plan. Make sure they aren't politically controversial or have nudity/violence or any of the stuff that might get rejected. If it gets rejected then you'll have to apply for a refund. Select the ad type, ad category and add your desired photo (not must); if it's a country ad, select your targeted country. Also remember, <b>you cannot edit your ad later on.</b>
</p>

	        </div>
	    </div>

	    <div class="faq-item">
	        
	        <div class="faq-question">
	            <h4><i class="fa-solid fa-credit-card"></i> Step 3 - How to Pay and When Will Your Ads be Displayed?</h4>
	            <span class="faq-toggle"><i class="fa-solid fa-chevron-down"></i></span>
	        </div>
	        <div class="faq-answer">
	        <p>So after filling up the form, just copy the Ad-ticket above your form, and paste it into the box written Ad-ticket over the pay now button below the form, which is associated with PayPal, but it can also be paid with bKash. Then select the Ad Category from the drop-down below it. And then just click the pay now button for PayPal payment. This will open a new page where you'll have to log in to PayPal and confirm your purchase. And when it's done, come back to your Thynkzone advertisements page, and if you filled up the form, click done, and if you haven't already, fill it up and click done. 
	        <br><br>
	        Your ad should display on top of the page after clicking done. Your ad should have an approval status below the ad category and ad type. There will be written "In Queue". If you submitted the form without reading this and now thinking what you're supposed to do with the ticket, don't worry. Just copy the Ad-ticket below where its written "In Queue" and paste it in your Ad-ticket box below the Create Ad form and above the pay now button and select your plan and click pay now in order to pay with PayPal. 
	
			For bKash payment, select send money and send the amount of your ad in BDT to the bKash personal number below. Don't forget to put in the Ad-ticket as your reference number. After the review is completed by us, your ad will be running unless rejected for inappropriate content. So when will your ad display? We cannot say the exact time for sure if it depends on the queue, else, it will within a few hours since it takes human approval. Check your notifications page or you can even check this page to see if your ad has started displaying. Coming back to getting refunded, your refund will be granted if your waiting (in review) period is over 15 days. Just ask for a refund in PayPal or bKash at your ad purchase details or even email us at thynkzone.help@gmail.com, and we guarantee a refund if verified that you're eligible for one.</p>

	</div>
	</div>
	
	</div> <!-- .faq-container -->

	<br><br>
	
	
	
	
	
	<p class="adtick"><i class="fa-solid fa-ticket"></i> <u>Ad-ticket:</u> <i><b style="cursor: text; color: rgb(123, 255, 0); font-weight: 800; font-size: 1.5rem;"><%=adticket%></b></i></p>
	
	<form class="create-ad-form" name="frm" action="adpro.jsp" method="POST" enctype="multipart/form-data" style="position: relative; padding: 1.2rem 1rem; max-width: 500px; width: 100%;">
		<button type="button" class="privacy-icon-btn" id="privacyDropdownBtn"
		  aria-haspopup="true" aria-expanded="false"
		  onclick="togglePrivacyDropdown(event)" title="Privacy"
		  style="position: absolute; top: 1rem; right: 1rem;">
		  <i class="fa-solid fa-user-shield"></i>
		</button>
		<div class="modern-dropdown-group">
		  <div class="modern-dropdown-menu" id="privacyDropdownMenu" role="menu" aria-labelledby="privacyDropdownBtn" style="display:none;">
		    <div class="modern-dropdown-section">
		      <div class="modern-dropdown-label">Ad Type</div>
		      <select class="modern-dropdown-select" name="pstcat" required>
		        <option value="1" selected>Person</option>
		        <option value="2">Brand</option>
		      </select>
		    </div>
		    <div class="modern-dropdown-section">
		      <div class="modern-dropdown-label">Reach</div>
		      <select class="modern-dropdown-select" name="privacy" required>
		        <option value="6" selected>World 3x</option>
		        <option value="5">World 2x</option>
		        <option value="4">World</option>
		        <option value="3">Country 3x</option>
		        <option value="2">Country 2x</option>
		        <option value="1">Country</option>
		      </select>
		    </div>
		    <div class="modern-dropdown-section">
		      <div class="modern-dropdown-label">Country</div>
		      <select class="modern-dropdown-select" name="country">
		        <option value="Select Country" selected>Select Country</option>
		        <option value="Bangladesh">Bangladesh</option>
		        <option value="United States">United States</option>
		        <option value="Canada">Canada</option>
		        <option value="United Kingdom">United Kingdom</option>
		        <option value="Australia">Australia</option>
		        <option value="Germany">Germany</option>
		        <option value="France">France</option>
		        <option value="India">India</option>
		        <option value="Japan">Japan</option>
		        <option value="China">China</option>
		      </select>
		    </div>
		  </div>
		</div>
		
		<h2 class="create-ad-header"><i class="fa-solid fa-plus-circle"></i> Create an Ad</h2>
		
		<a class="ad-form-user" href="profile.jsp?userId=<%=ix%>" style="display: flex; align-items: center; margin-bottom: 1rem;">
		  <img id="disc" src="<%=psmall%>" alt="Profile Picture" style="width: 38px; height: 38px;"/>
		  <span style="font-size: 0.98rem; font-weight: 600; margin-left: 0.5rem;"><%=pname%></span>
		</a>
		
		<div style="display: flex; gap: 0.7rem; align-items: flex-start; margin-bottom: 0.2rem;">
		  <div class="floating-label" style="flex: 1;">
		    <textarea id="postboxtext" class="input-field" name="text" placeholder=" " maxlength="2000" required aria-label="Ad text" style="min-height: 100px; font-size: 1rem; padding: 0.7rem 1.5rem;"></textarea>
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
		
		<input type="hidden" name="adticket" value="<%=adticket%>">
		<input type="hidden" name="csrf" value="<%=db.csrftoken()%>">
	</form>
	
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
// Image preview functionality - exactly like edit-post.jsp
const dragDropArea = document.getElementById('dragDropArea');
const fileInput = document.getElementById('file-input');
const output = document.getElementById('output');
const dragDropText = document.getElementById('dragDropText');

function loadFile(event) {
  var output = document.getElementById('output');
  var dragDropText = document.getElementById('dragDropText');
  output.src = URL.createObjectURL(event.target.files[0]);
  output.style.display = "block";
  dragDropText.style.display = "none";
  output.onload = function() {
    URL.revokeObjectURL(output.src);
  }
}

// Drag and drop image upload
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
</script>
	
	<br>
	<br>
	
	<!-- --------------------------------------------------------------------------------------------------------------------------------------- -->
	
	<section class="filters">
  <ul class="filters-content">
    <button class="filters__button is-active" data-target="#projects">
      <i class="fa-brands fa-paypal"></i> PayPal
    </button>
    <button class="filters__button" data-target="#skills">
      <i class="fa-solid fa-mobile-alt"></i> bKash
    </button>
  </ul>

  <div>
    <div data-content class="is-active" id="projects">
      <div class="payment-header">
        <i class="fa-brands fa-paypal"></i> PayPal Payment
      </div>
      
      <p class="powered">Pay with <a target="_blank" href="https://www.paypal.com/"><img src="icon/paypal.jpg" alt="PayPal"/></a></p>
      
      <div class="paypal-form">
        <form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_blank">
          <input type="hidden" name="cmd" value="_s-xclick">
          <input type="hidden" name="hosted_button_id" value="NW7P4HK222N88">
          <table>
            <tr><td><input type="hidden" name="on0" value="Ad Type">Ad Type</td></tr>
            <tr><td><select name="os0">
              <option value="Country">Country $5.00 CAD</option>
              <option value="Country 2x">Country 2x $7.00 CAD</option>
              <option value="Country 3x">Country 3x $9.00 CAD</option>
              <option value="World">World $11.00 CAD</option>
              <option value="World 2x">World 2x $13.00 CAD</option>
              <option value="World 3x">World 3x $15.00 CAD</option>
            </select></td></tr>
            <tr><td><input type="hidden" name="on1" value="Ad-ticket">Ad-ticket</td></tr>
            <tr><td><input type="text" name="os1" maxlength="200" placeholder="Enter your Ad-ticket"></td></tr>
          </table>
          <input type="hidden" name="currency_code" value="CAD">
          <input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_paynowCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
          <img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1">
        </form>
      </div>
      
      <div class="credit-cards">
        <img src="https://www.paypalobjects.com/webstatic/en_US/i/buttons/cc-badges-ppmcvdam.png" alt="Credit Cards" />
      </div>
    </div>

    <div data-content id="skills">
      <div class="payment-header">
        <i class="fa-solid fa-mobile-alt"></i> bKash Payment
      </div>
      
      <div class="bkash-section">
        <img src="icon/bkash-qrcode.jpg" alt="bKash QR Code"/>
        <p>Select send money to personal number, and send the amount of your Ad in BDT to the bKash personal number. <u>01716583864 - Please enter your Ad's Ad-ticket as the reference number and select send money.</u></p>
      </div>
    </div>
  </div>
</section>
	
	
	<script type="text/javascript">
	const tabs = document.querySelectorAll("[data-target]"),
  tabContents = document.querySelectorAll("[data-content]");

tabs.forEach((tab) => {
  tab.addEventListener("click", () => {
    const target = document.querySelector(tab.dataset.target);

    tabContents.forEach((tc) => {
      tc.classList.remove("is-active");
    });
    target.classList.add("is-active");

    tabs.forEach((t) => {
      t.classList.remove("is-active");
    });
    tab.classList.add("is-active");
  });
});
	</script>
	
	
	<script type="text/javascript">
	// FAQ functionality
	document.querySelectorAll('.faq-question').forEach(question => {
		question.addEventListener('click', () => {
			const answer = question.nextElementSibling;
			const isActive = question.classList.contains('active');
			
			// Close all other FAQ items
			document.querySelectorAll('.faq-question').forEach(q => {
				q.classList.remove('active');
				q.nextElementSibling.classList.remove('active');
			});
			
			// Toggle current item
			if (!isActive) {
				question.classList.add('active');
				answer.classList.add('active');
			}
		});
	});
	
	// Payment tab switching
	function switchPaymentTab(tab) {
		// Remove active class from all tabs and contents
		document.querySelectorAll('.payment-tab').forEach(t => t.classList.remove('active'));
		document.querySelectorAll('.payment-content').forEach(c => c.classList.remove('active'));
		
		// Add active class to selected tab and content
		document.querySelector(`[onclick="switchPaymentTab('${tab}')"]`).classList.add('active');
		document.getElementById(`${tab}-content`).classList.add('active');
	}
	
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
	
	
	
	<script type="text/javascript">
			window.onscroll = function() {myFunction()};

			var navbar = document.getElementById("myTopnav");
			var navbary = document.getElementById("royal");
			var navbarz = document.getElementById("ss");
			var searchBar = document.getElementById("search");
			var sticky = navbar.offsetTop;
			var sticky2 = navbary.offsetTop;
			var sticky3 = navbarz.offsetTop;

			function myFunction() {
			  if (window.pageYOffset >= sticky) {
			    navbar.classList.add("sticky");
				navbary.classList.add("sticky2");
				navbarz.classList.add("sticky3");
			    // Add padding to content to account for sticky nav
			    document.getElementById("content").style.paddingTop = "1rem";
			  } else {
			    navbar.classList.remove("sticky");
				navbary.classList.remove("sticky2");
				navbarz.classList.remove("sticky3");
			    // Remove padding when nav is not sticky
			    document.getElementById("content").style.paddingTop = "0";
			  }
			}
			</script>

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
			function myFunctionss() {
			document.getElementById("myDropdown").classList.toggle("show");
			}
			function showmore() {
			document.getElementById("glue").classList.toggle("show2");
			}
			
			
	window.onclick = function(ef) {
		if (!ef.target.matches('.dropbtn')) {
			  var myDropdown = document.getElementById("myDropdown");
			    if (myDropdown.classList.contains('show')) //you need to have .myDropdown in css above .show for it to work 
			    {
			      myDropdown.classList.remove('show');
			    }
			  }
		
		  if (!ef.target.matches('.tickmore')) {
		  var glue = document.getElementById("glue");
		    if (glue.classList.contains('show2')) {
		      glue.classList.remove('show2');
		    }
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

	<%
			} catch(Exception ex) {
				response.sendRedirect("index.jsp");
				System.out.print(ex+"at advertisements.jsp");
		}
	%>

	<br><br><br>
	</div>
	
	
</body>
</html>