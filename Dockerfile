# 1️⃣ Image Java 17 légère
FROM eclipse-temurin:17-jre-alpine

# 2️⃣ Dossier de travail
WORKDIR /app

# 3️⃣ Copier le jar
COPY target/student-management-0.0.1-SNAPSHOT.jar app.jar

# 4️⃣ Créer un utilisateur non-root
RUN addgroup -S app && adduser -S -G app app
USER app

# 5️⃣ Exposer le port de l’app
EXPOSE 8089

# 6️⃣ Variable d'environnement optionnelle
ENV JAVA_OPTS=""

# 7️⃣ Commande de démarrage
ENTRYPOINT ["sh", "-c", "exec java $JAVA_OPTS -jar /app/app.jar"]
