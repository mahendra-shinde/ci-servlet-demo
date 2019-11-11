FROM tomcat:latest

RUN ["rm","-R", "/usr/local/tomcat/webapps/*"]

COPY ["target/*.war", "/usr/local/tomcat/webapps/ROOT.war"]
