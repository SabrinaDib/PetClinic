FROM tomcat:9.0.55
LABEL maintainer="sabrinaDIB"
COPY target/petclinic.war /usr/local/tomcat/webapps/ROOT.wa
