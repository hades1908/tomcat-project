# Use the official Tomcat image as the base image
FROM tomcat:latest
WORKDIR /usr/local/tomcat
ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
# Remove the existing ROOT webapp from Tomcat
RUN rm -rf /usr/local/tomcat/webapps/ROOT/*

# Copy your "hello-world-app" directory into the Tomcat webapps directory
COPY ./hello-world-app/index.html /usr/local/tomcat/webapps/ROOT/

# Expose the default Tomcat port (8080)
EXPOSE 8080

# Start Tomcat when the container runs
CMD ["catalina.sh", "run"]
