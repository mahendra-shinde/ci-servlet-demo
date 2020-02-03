FROM tomcat:latest as base

FROM maven:3-jdk-8-slim as builder
WORKDIR /app
COPY . .
RUN ["mvn","package"]

FROM base
COPY --from=builder ["/app/target/*.war", "/usr/local/tomcat/webapps/ROOT.war"]
