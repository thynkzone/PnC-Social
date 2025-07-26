# P&C (People & Culture) - Workplace Social Networking Platform

A comprehensive social networking web application designed specifically for workplace communities, enabling employees to share experiences, collaborate on ideas, and foster positive organizational culture.

## 🚀 Features

- **User Management**: Registration, authentication, profile customization
- **Social Networking**: Friend/follower system, user discovery, privacy controls
- **Content Sharing**: Post creation (memes, facts, updates), image uploads, commenting
- **Gamification**: Point-based engagement system with 9 user ranks
- **Real-time Features**: Notifications, live updates, instant messaging
- **Administrative Tools**: Content moderation, user reporting, analytics
- **Security**: Multi-layer authentication, CSRF protection, input validation

## 🛠️ Technology Stack

- **Backend**: Java, JSP, Servlets, JDBC
- **Database**: MySQL
- **Frontend**: HTML5, CSS3, JavaScript, jQuery
- **Security**: BCrypt, SHA-512, AES encryption, reCAPTCHA
- **Server**: Apache Tomcat

## 📁 Project Structure

```
src/main/
├── java/com/thynkzone/jsp/     # Java backend classes
│   ├── db.java                 # Database operations (3,272 lines)
│   ├── hasher.java             # Password hashing
│   ├── encdecry.java           # Encryption utilities
│   └── ...                     # 24 other utility classes
├── webapp/                     # Frontend files
│   ├── *.jsp                   # 63 JSP pages
│   ├── css-pages.css           # Custom styling (1,699 lines)
│   ├── icon/                   # Application icons
│   └── img/                    # User uploads (gitignored)
└── WEB-INF/                    # Configuration files
```

## 🔧 Setup Instructions

### Prerequisites
- Java JDK 8 or higher
- Apache Tomcat 9
- MySQL 5.7 or higher
- Maven (optional)

### Database Setup
1. Create MySQL databases:
   ```sql
   CREATE DATABASE thynkzone;
   CREATE DATABASE users;
   ```
2. Import the database schema (contact developer for schema files)

### Configuration
1. Create configuration files in `WEB-INF/secured/`:
   - `eu.txt` - Database username
   - `ep.txt` - Database password
   - `emp.txt` - Email password
   - `q.txt`, `x.txt`, `y.txt`, `z.txt` - Security keys

2. Update database connection settings in `db.java`

### Deployment
1. Build the project
2. Deploy to Apache Tomcat
3. Configure server settings
4. Start the application

## 🔒 Security Features

- **Password Security**: BCrypt hashing with salt and pepper
- **Session Management**: Encrypted cookies with expiration
- **Input Validation**: Comprehensive sanitization and validation
- **CSRF Protection**: Token-based request verification
- **SQL Injection Prevention**: Prepared statements
- **XSS Protection**: Input sanitization and output encoding
- **File Upload Security**: Type validation and size restrictions

## 📊 Project Statistics

- **Total Lines of Code**: ~42,000 lines
- **Java Classes**: 27 files
- **JSP Pages**: 63 files
- **CSS**: 1,699 lines
- **Database Tables**: 8+ tables
- **Security Classes**: 6+ specialized classes

## 🤝 Contributing

This is a personal project. For questions or collaboration, please contact the developer.

## 📝 License

Copyright © 2020 by Md Mazidul Haque Farabi. All rights reserved.

## ⚠️ Important Notes

- This repository contains only the source code
- Configuration files and sensitive data are excluded via `.gitignore`
- Database credentials and security keys must be configured separately
- User uploads and images are stored externally and not included in the repository

## 🔗 Contact

- **Developer**: Md. Mazidul Haque Farabi
- **GitHub**: [mazidulfarabi](https://github.com/mazidulfarabi)
- **Project**: P&C (People & Culture) 