FROM maven:3.8.4-openjdk-11-slim as builder

# Copy the WAR file
COPY ROOT.war /ROOT.war

FROM tomee:9.1.0-jre11-alpine-webprofile

# Copy the WAR file from builder
COPY --from=builder /ROOT.war /usr/local/tomee/webapps/ROOT.war

# Expose port 8080
EXPOSE 8080