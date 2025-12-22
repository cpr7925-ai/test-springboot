FROM eclipse-temurin:17-jre

WORKDIR /app

# Jenkins 已經打包好 jar
COPY target/*.jar app.jar

EXPOSE 8082

ENV JAVA_OPTS="-XX:+UseContainerSupport -XX:MaxRAMPercentage=75"

ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar"]
