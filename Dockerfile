# Pull base image 
FROM ubuntu
RUN apt-get update
RUN apt-get -y install wget
#RUN add-apt-repository ppa:openjdk-r/ppa
RUN apt-get update
RUN apt-get install openjdk-8-jdk -y
RUN java -version

RUN mkdir /opt/tomcat/
WORKDIR /opt/tomcat/
RUN wget https://mirrors.estointernet.in/apache/tomcat/tomcat-9/v9.0.33/bin/apache-tomcat-9.0.33.tar.gz
RUN tar xvfz apache-tomcat-9.0.33.tar.gz
RUN mv apache-tomcat-9.0.33/* /opt/tomcat/.
#WORKDIR /opt/tomcat/webapps

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]

# Maintainer 
MAINTAINER "rajk6850@gmail.com" 
COPY ./webapp.war /usr/local/tomcat/webapps
RUN cp -R /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps
