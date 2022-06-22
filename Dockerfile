FROM centos

MAINTAINER prashant.gaur91@gmail.com.com

RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN curl -O http://apache.mirrors.ionfish.org/tomcat/tomcat-8/v8.5.15/bin/apache-tomcat-8.5.15.zip
RUN unzip apache-tomcat-8.5.15.zip
RUN mv apache-tomcat-8.5.15/* /opt/tomcat/.
RUN yum -y install java
RUN java -version

WORKDIR /opt/tomcat/webapps
RUN curl -O -L https://github.com/AKSarav/SampleWebApp/raw/master/dist/SampleWebApp.war

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
