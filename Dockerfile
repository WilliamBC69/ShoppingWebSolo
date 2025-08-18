# Use an official Java runtime as a parent image
FROM tomcat:10-jdk21-temurin-jammy

# Copy the application source code to the container
WORKDIR /root/
COPY . .

# Install Tomcat
RUN apt update
RUN apt install ant -y
#RUN curl https://repo1.maven.org/maven2/org/netbeans/modules/org-netbeans-modules-java-j2seproject/RELEASE230/org-netbeans-modules-java-j2seproject-RELEASE230.jar > copylibs
RUN ant -Dj2ee.server.home=/usr/local/tomcat/ -Dlibs.CopyLibs.classpath=copylibs
#RUN ant

COPY ./dist/stbcStore.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
