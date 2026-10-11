# Stage 1: Build application with Maven Wrapper and Java 25
FROM eclipse-temurin:25-jdk-noble AS build
WORKDIR /app

# Copy Maven Wrapper and Project Object Model
COPY .mvn .mvn
COPY mvnw pom.xml ./
RUN sed -i 's/\r$//' mvnw && chmod +x mvnw

# Copy source code and build production jar
COPY src ./src
RUN ./mvnw clean package -DskipTests

# Stage 2: Production Runtime with Java 25 tuned for Render Free Tier (<= 512MB RAM)
FROM eclipse-temurin:25-jre-noble
WORKDIR /app

# Copy executable jar from build stage
COPY --from=build /app/target/pnc-social-2.0.0.jar app.jar

ENV PORT=8080
EXPOSE 8080

# Tuned JVM parameters to prevent Out-Of-Memory crashes on 512MB RAM free tier
ENTRYPOINT ["sh", "-c", "exec java -Xmx256m -Xms64m -XX:+UseG1GC -XX:+ExitOnOutOfMemoryError -Dserver.port=${PORT} -jar app.jar"]
