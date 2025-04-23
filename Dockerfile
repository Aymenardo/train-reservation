# Étape 1 : Construire l'application avec Maven
FROM maven:3.8.1-openjdk-17 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package

# Étape 2 : Exécuter l'application avec Tomcat
FROM tomcat:9.0
COPY --from=builder /app/target/*.war /usr/local/tomcat/webapps/app.war
EXPOSE 8080