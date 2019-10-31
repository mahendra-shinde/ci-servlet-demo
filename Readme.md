## Sample Java Web Application with Servlet API 3.x 

This demo is based on servlet demo from oracle sample available [here](https://www.oracle.com/webfolder/technetwork/tutorials/obe/java/basic_app_embedded_tomcat/basic_app-tomcat-embedded.html).

I have made few fixes to original demo to make it compatible with current scenario.

Build the application using `mvn package` and it would produce artefact `target/emp-app.war` you can then deploy this file on remote/local tomcat (or any other Servlet 3.x Compatible Runtime). 

The application uses `relative URLs` in all request mappings so changing context-root from `emp-app` to `ROOT` should never result in `ERROR 404`.
