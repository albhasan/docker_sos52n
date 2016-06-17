#!/bin/bash
echo "#########################################################################"
echo "LAUNCH A 52 NORTH SENSOR OBSERVATION SERVICE SERVER USING DOCKER"
echo "#########################################################################"

echo "Get the 52North SOS client..."
wget http://52north.org/downloads/send/3-sos/484-52n-sensorweb-sos-bundle-4-3-6

echo "Get the SOS WAR and rename it ..."
unzip 484-52n-sensorweb-sos-bundle-4-3-6
mv ./52n-sensorweb-sos-bundle-4.3.6/bin/target/52n-sos-webapp##4.3.6.war ./52n-sos-webapp.war

echo "Start a docker tomcat and load the SOS WAR..."
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
docker run -it --rm -p 8080:8080 -v $DIR/52n-sos-webapp.war:/usr/local/tomcat/webapps/52n-sos-webapp.war tomcat:8.0

echo "Done! - SOS available at http://localhost:8080/52n-sos-webapp/"
