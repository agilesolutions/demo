FROM jboss/wildfly:latest
COPY target/demo.war /opt/jboss/wildfly/standalone/deployments
RUN curl --silent --insecure -o /opt/jboss/wildfly/bin/initial.cli http://localhost:8080/jdo/rest/profile/cli?name=atm_batch
EXPOSE 8080
CMD /opt/jboss/wildfly/bin/standalone.sh -b 0.0.0.0
