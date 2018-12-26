FROM kartoza/geoserver

ENV TOMCAT_WEBXML /usr/local/tomcat/conf/web.xml

RUN perl -pi -e "s/<\/web-app>//;"   $TOMCAT_WEBXML && \
    printf "<filter>\n"                                >> $TOMCAT_WEBXML && \
    printf "  <filter-name>CorsFilter</filter-name>\n" >> $TOMCAT_WEBXML && \
    printf "  <filter-class>org.apache.catalina.filters.CorsFilter</filter-class>\n" >> $TOMCAT_WEBXML && \
    printf "  <init-param>\n"                          >> $TOMCAT_WEBXML && \
    printf "    <param-name>cors.allowed.origins</param-name>\n" >> $TOMCAT_WEBXML && \
    printf "    <param-value>*</param-value>\n"        >> $TOMCAT_WEBXML && \
    printf "  </init-param>\n"                         >> $TOMCAT_WEBXML && \
    printf "</filter>\n"                               >> $TOMCAT_WEBXML && \
    printf "<filter-mapping>\n"                        >> $TOMCAT_WEBXML && \
    printf "  <filter-name>CorsFilter</filter-name>\n" >> $TOMCAT_WEBXML && \
    printf "  <url-pattern>/*</url-pattern>\n"         >> $TOMCAT_WEBXML && \
    printf "</filter-mapping>\n"                       >> $TOMCAT_WEBXML && \
    printf "</web-app>"                                >> $TOMCAT_WEBXML 
