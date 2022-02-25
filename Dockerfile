## Stage-1: Pre-Fetch the base image
FROM tomcat:8 as base

## Stage-2: Using `maven` image, build WAR from source code 
FROM maven:3-jdk-8-slim as builder
WORKDIR /app
COPY . .
RUN ["mvn","package"]

## Stage-3: Using WAR made by `builder` stage and `base` image from first stage
##          Create the final container image
FROM base
COPY --from=builder ["/app/target/*.war", "/usr/local/tomcat/webapps/ROOT.war"]
