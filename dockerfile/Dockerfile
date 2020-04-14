FROM tomcat:8

MAINTAINER "Carlos H. Brandt <carloshenriquebrandt at gmail>"

RUN cd $CATALINA_HOME         &&\
    rmdir webapps             &&\
    mv webapps.dist webapps

RUN catalina.sh start                           &&\
    echo 'Initializing Tomcat' && sleep 5       &&\
    catalina.sh stop

COPY conf/tomcat-users.xml ${CATALINA_HOME}/conf/tomcat-users.xml
COPY conf/Catalina/localhost/* ${CATALINA_HOME}/conf/Catalina/localhost/

#RUN DEBIAN_FRONTEND=noninteractive  &&\
#    apt-get update                  &&\
#    apt-get install -y vim curl     &&\
#    apt-get clean
