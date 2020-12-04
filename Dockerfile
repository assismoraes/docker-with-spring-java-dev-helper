FROM java:8-jdk-alpine

WORKDIR /usr/app

COPY target/*.war /usr/app/app.war

ENTRYPOINT ["java", "-jar", "/usr/app/app.war"]
