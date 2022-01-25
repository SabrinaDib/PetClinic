FROM tomcat:9.0.55
COPY target/petclinic.war /usr/local/tomcat/webapps/ROOT.wa
