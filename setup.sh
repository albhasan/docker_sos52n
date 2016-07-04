#!/bin/bash
echo "#########################################################################"
echo "SETUP A 52 NORTH SENSOR OBSERVATION SERVICE SERVER USING DOCKER"
echo "#########################################################################"

docker stop some-postgis
docker rm   some-postgis
docker stop sos52n
docker rm   sos52n


# Get the current folder
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Start a PostGRES - PostGIS container..."
docker run --name some-postgis --expose=5432 -e POSTGRES_PASSWORD=xxxx.xxxx.xxxx -d mdillon/postgis

echo "Start a docker tomcat, and load the SOS WAR, and link the container to PostGIS..."
docker run --name sos52n -p 8080:8080 --link some-postgis:postgres -v $DIR/52n-sos-webapp.war:/usr/local/tomcat/webapps/52n-sos-webapp.war -d tomcat:8.0

echo "PostGRESQL IP address..."
docker run -it --link some-postgis:postgres --rm postgres sh -c 'exec echo "$POSTGRES_PORT_5432_TCP_ADDR"'

echo "PostGRESQL IP port..."
docker run -it --link some-postgis:postgres --rm postgres sh -c 'exec echo "$POSTGRES_PORT_5432_TCP_PORT"'

#echo "#########################################################################"
# Create a PostGIS database
#echo "#########################################################################"
# Take control of the DB container
#docker exec -it -u postgres some-postgis /bin/bash
# Create a SQL script
#echo 'CREATE DATABASE sos WITH OWNER = postgres ENCODING = UTF8 TEMPLATE = template_postgis;' >> /tmp/sosdb.sql
# Run the SQL script
#psql -f /tmp/sosdb.sql

echo "Done! - SOS available at http://localhost:8080/52n-sos-webapp/"
