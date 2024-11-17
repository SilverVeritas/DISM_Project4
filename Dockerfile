FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Install required packages
RUN apt-get update && apt-get install -y \
    tomcat9 \
    default-jdk \
    && rm -rf /var/lib/apt/lists/*

# Remove default webapps
RUN rm -rf /var/lib/tomcat9/webapps/*

# Copy the WAR file
COPY ROOT.war /var/lib/tomcat9/webapps/

# Expose port 8080
EXPOSE 8080

# Start Tomcat service
CMD service tomcat9 start && tail -f /var/log/tomcat9/catalina.out
