FROM jboss/wildfly:latest
COPY **\*.war /opt/jboss/wildfly/standalone/deployments
EXPOSE 8080
CMD /opt/jboss/wildfly/bin/standalone.sh -b 0.0.0.0