FROM tomcat:10.1-jdk11-openjdk-slim

WORKDIR /usr/local/tomcat

# Remove default webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the WAR file
COPY ROOT.war /usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]
