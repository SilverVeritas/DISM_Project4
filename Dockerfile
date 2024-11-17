FROM maven:3.8.4-openjdk-11-slim AS builder

WORKDIR /app
COPY . .
RUN mvn clean package

FROM tomcat:10.1-jdk11-openjdk-slim

# Remove default webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the WAR file from builder stage
COPY --from=builder /app/target/ROOT.war /usr/local/tomcat/webapps/

# MongoDB connection details (replace with your actual values)
ENV MONGO_CONNECTION_STRING="mongodb+srv://pserrano:Dismproj1234@dism.zanxk.mongodb.net/?retryWrites=true&w=majority&appName=DISM"
ENV MONGO_DATABASE="project4db"

EXPOSE 8080

CMD ["catalina.sh", "run"]
