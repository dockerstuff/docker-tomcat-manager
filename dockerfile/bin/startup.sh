#!/bin/bash
set -ue

PASSWORD=$(date | md5sum | fold -w10 | head -n1)
USER='tomcat'

TOMCAT_PASSWORD=${TOMCAT_PASSWORD:-$PASSWORD}
TOMCAT_USER=${TOMCAT_USER:-$USER}

tomcat_users() {
  U="$1"
  P="$2"
  cat > ${CATALINA_HOME}/conf/tomcat-users.xml << EOF
<?xml version="1.0" encoding="UTF-8"?>
<tomcat-users xmlns="http://tomcat.apache.org/xml"
              xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
              xsi:schemaLocation="http://tomcat.apache.org/xml tomcat-users.xsd"
              version="1.0">

  <role rolename="admin"/>
  <role rolename="admin-gui"/>
  <role rolename="manager-gui"/>
  <user username="${U}" password="${P}" roles="admin,admin-gui,manager-gui"/>

</tomcat-users>
EOF
}

tomcat_users "$TOMCAT_USER" "$TOMCAT_PASSWORD"

echo ""
echo "Tomcat manager:"
echo "-user:     $TOMCAT_USER"
echo "-password: $TOMCAT_PASSWORD"
echo ""

catalina.sh start

