# P&C (People & Culture) - Modern Cloud-Native Social Platform

A modernized, decoupled, cloud-native workplace social networking platform engineered for zero-cost, serverless-friendly cloud deployments.

---

## 🚀 Architecture & Modern Tech Stack

- **Backend Framework:** Spring Boot 3.5 (REST API, Spring Data JPA, Spring Security)
- **Language & Runtime:** Java 25 (LTS)
  - **Virtual Threads:** High concurrency handling with near-zero memory footprint
  - **Java Records:** Immutable DTO data carriers
  - **Scoped Values (JEP 487):** Secure request context propagation replacing legacy `ThreadLocal`
  - **Pattern Matching (JEP 507/513):** Exhaustive `switch` expressions and flexible constructor bodies
- **Serverless Database:** Neon DB (PostgreSQL)
  - Connection pooling configured via `-pooler.neon.tech` and HikariCP (`maximumPoolSize=5`, cold-start resilience)
- **Object Storage:** Cloudflare R2 (S3-Compatible)
  - Direct frontend-to-storage presigned PUT uploads and presigned GET downloads (zero bandwidth overhead on server)
- **Transactional Email:** Brevo REST API
  - Native `java.net.http.HttpClient` on virtual threads (bypasses Render outbound SMTP port blocking)
- **Deployment Platform:** Render Free Tier (<= 512MB RAM)
  - Tuned JVM parameters (`-Xmx256m -Xms64m -XX:+UseG1GC -XX:+ExitOnOutOfMemoryError`) to eliminate OOM risks

---

## 🛠️ Project Structure

```
├── .mvn/wrapper/                  # Maven Wrapper runtime
├── src/
│   ├── main/
│   │   ├── java/com/thynkzone/pnc/
│   │   │   ├── config/            # Security, S3/R2 storage, Web MVC configurations
│   │   │   ├── context/           # Scoped Values request context holders
│   │   │   ├── controller/        # REST Controllers (@RestController)
│   │   │   ├── dto/               # Java Records immutable DTOs
│   │   │   ├── entity/            # JPA Entities (User, Post, Relationship, Notification)
│   │   │   ├── exception/         # Exception handling & JEP 513 flexible constructors
│   │   │   ├── repository/        # Spring Data JPA Repositories
│   │   │   ├── service/           # Business logic & email/storage services
│   │   │   └── util/              # Password security, sanitization, token generation
│   │   └── resources/
│   │       ├── application.properties # Production configuration with env overrides
│   │       └── static/            # Decoupled frontend assets (HTML, CSS, JS, icons)
├── Dockerfile                     # Multi-stage production container build (Java 25)
├── pom.xml                        # Maven dependencies & plugins
├── render.yaml                    # Infrastructure-as-code for Render deployment
└── README.md
```

---

## 🔧 Local Development & Build

### Prerequisites
- Java 25 JDK (e.g. Eclipse Adoptium Temurin 25)
- Git

### Running Locally
```powershell
# Set JAVA_HOME (if not automatically configured in PATH)
$env:JAVA_HOME = "C:\Program Files\Eclipse Adoptium\jdk-25.0.4.101-hotspot"

# Build executable jar
.\mvnw.cmd clean package -DskipTests

# Run Spring Boot application
java -Xmx256m -jar target/pnc-social-2.0.0.jar
```

The application starts on `http://localhost:8080/`.

---

## 🚢 Render Deployment Instructions

This repository is pre-configured for direct GitHub push deployments:

1. **Connect Repo in Render:**
   - Create a new **Web Service** on [Render](https://render.com).
   - Connect your GitHub repository.
   - Choose **Docker** environment. Render detects `Dockerfile` and `render.yaml` automatically.

2. **Automated Configuration via Blueprint (`render.yaml`):**
   Non-sensitive infrastructure configurations are pre-defined in `render.yaml`. Sensitive credentials are kept secure and configured via Render Dashboard environment variables (`sync: false`):
   - `JAVA_TOOL_OPTIONS`: `-Xmx256m -Xms64m -XX:+UseG1GC -XX:+ExitOnOutOfMemoryError`
   - `PORT`: `8080`
   - `DB_URL`: Neon DB serverless pooled connection URL
   - `DB_USERNAME`: `neondb_owner`
   - `DB_PASSWORD`: `<your_neon_db_password>` (Render Secret)
   - `R2_ENDPOINT`: `https://b823bc44241592e012a8f6b554d619a8.r2.cloudflarestorage.com`
   - `R2_BUCKET`: `pnc`
   - `R2_ACCESS_KEY`: `<your_cloudflare_r2_access_key>` (Render Secret)
   - `R2_SECRET_KEY`: `<your_cloudflare_r2_secret_key>` (Render Secret)
   - `R2_PUBLIC_URL`: `https://cdn.thynkzone.eu.org`
   - `BREVO_API_KEY`: `<your_brevo_v3_api_key>` (Render Secret)
   - `BREVO_SENDER_EMAIL`: `team@thynkzone.eu.org`
   - `BREVO_SENDER_NAME`: `People & Culture`

3. **Deploy:**
   Every `git push origin main` triggers an automated zero-downtime Docker build on Render.