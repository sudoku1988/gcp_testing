FROM centos:centos7

MAINTAINER prashant.gaur91@gmail.com.com

RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat

RUN yum -y install unzip
RUN curl -O https://downloads.apache.org/tomcat/tomcat-8/v8.5.79/bin/apache-tomcat-8.5.79.zip
RUN unzip apache-tomcat-8.5.79.zip
RUN mv apache-tomcat-8.5.79/* /opt/tomcat/.
RUN yum -y install java
RUN java -version

WORKDIR /opt/tomcat/webapps
RUN curl -O -L https://github.com/AKSarav/SampleWebApp/raw/master/dist/SampleWebApp.war
RUN chmod -R 777 /opt/tomcat/apache-tomcat-8.5.79
#EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run", "--host 0.0.0.0", "--disable-host-check"]
