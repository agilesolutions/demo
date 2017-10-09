JEE6 WEB application: Example Using Multiple Java EE 6 Technologies Deployed as a WAR
=====================
Technologies: JPA/Hibernate/EJB/CDI/JSF/JAX-RS.    
Summary: Project generated from archetype see <http://stash.agilesolutions.com/projects/JBO/repos/jboss_archetype_war/browse>   
Target Product: EAP6+    

What is it?
-----------
Generates a WEB JEE6 application from archetype which contains:   
1. Maven config module for providing environment specific configuation files for SIT, UAT, Production and more.   
2. Provides CDI producers for loggers, JPA entity managers, etc...    
3. Provides helper class to load environment specific configuration attributes through ApplicationConfiguration.java    
4. Provides initial setup for supporting SSO through SPNEGO, see web.xml and jboss-web.xml, sections are commented out.    
4. Project complies to the guidelines described here : <https://wiki.agilesolutions.com/display/JCC/JSB+2.0+-+JBoss+Developer+Guide>  
 
CLI script generating handlers and loggers   
-----------    

/subsystem=logging/periodic-rotating-file-handler=atl:add(level=INFO, formatter="%d{yyyy-MM-dd HH:mm:ss,SSS} %-5p [%c] (%t) |%X{USER-ID}|%s%E%n", suffix=".dd", append=true, file={"relative-to"=>"jboss.server.log.dir","path"=>"../appl/atl.log"})   
/subsystem=logging/periodic-rotating-file-handler=bal:add(level=INFO, formatter="%d{yyyy-MM-dd HH:mm:ss,SSS} %-5p [%c] (%t) |%X{USER-ID}|%s%E%n", suffix=".dd", append=true, file={"relative-to"=>"jboss.server.log.dir","path"=>"../appl/bal.log"})   
/subsystem=logging/periodic-rotating-file-handler=exl:add(level=INFO, formatter="%d{yyyy-MM-dd HH:mm:ss,SSS} %-5p [%c] (%t) |%X{USER-ID}|%s%E%n", suffix=".dd", append=true, file={"relative-to"=>"jboss.server.log.dir","path"=>"../appl/exl.log"})   
/subsystem=logging/periodic-rotating-file-handler=sal:add(level=INFO, formatter="%d{yyyy-MM-dd HH:mm:ss,SSS} %-5p [%c] (%t) |%X{USER-ID}|%s%E%n", suffix=".dd", append=true, file={"relative-to"=>"jboss.server.log.dir","path"=>"../appl/sal.log"})   

/subsystem=logging/logger=BIZ_AUDIT_LOG:add(level=INFO, handlers=["bal"])   
/subsystem=logging/logger=BIZ_AUDIT_LOG:write-attribute(name="use-parent-handlers", value="false")   
/subsystem=logging/logger=SECURITY_AUDIT_LOG:add(level=INFO, handlers=["sal"])   
/subsystem=logging/logger=SECURITY_AUDIT_LOG:write-attribute(name="use-parent-handlers", value="false")   
/subsystem=logging/logger=EXCEPTION_LOG:add(level=INFO, handlers=["exl"])   
/subsystem=logging/logger=EXCEPTION_LOG:write-attribute(name="use-parent-handlers", value="false")   
/subsystem=logging/logger=ACTIVITY_TRACE_LOG:add(level=INFO, handlers=["atl"])   
/subsystem=logging/logger=ACTIVITY_TRACE_LOG:write-attribute(name="use-parent-handlers", value="false")   
