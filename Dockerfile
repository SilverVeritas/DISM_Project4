# Dockerfile
FROM tomcat:10.1-jdk11-openjdk-slim

# Remove default webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the WAR file
COPY ROOT.war /usr/local/tomcat/webapps/

# Make scripts executable
RUN chmod +x /usr/local/tomcat/bin/*.sh

EXPOSE 8080

CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
