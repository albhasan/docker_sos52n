52 North Sensor Observation Service running as a docker container
============

Scripts for running 52 North's Sensor Observation Service as a docker container.


<h3>Files:</h3>
<ul>
	<li><code>LICENSE</code> - License file.</li>
	<li><code>README.md</code> - This file.</li>
	<li><code>run.sh</code> - Bash script.</li>
</ul>


<h3>Prerequisites:</h3>
<ul>
	<li>Internet access.</li>
	<li><a href="http://www.docker.com/">Docker</a>.</li>
</ul>


<h3>Dependencies:</h3>
<ul>
	<li>Docker container for <a href="https://hub.docker.com/_/tomcat/">tomcat</a>.</li>
	<li>52 North's implementation of OGC <a href="http://sensorweb.demo.52north.org/sensorwebtestbed/">Sensor Observation Service</a>.</li>
</ul>


<h3>Instructions:</h3>
<ol>
	<li>Clone the project and then go to the docker_scidb folder: <code>git clone https://github.com/albhasan/docker_sos52n.git</code></li>
	<li>Enable <code>setup.sh</code> for execution <code>chmod +x setup.sh</code> </li>
	<li>Run <code>setup.sh</code>. This script creates two Docker containers: One with Tomcat and the other with PostGRESQL-PostGIS.</li>
	<li>Take control of the DB container <code>docker exec -it -u postgres some-postgis /bin/bash</code></li>
	<li>Create a SQL script in order to create a PostGIS database <code>echo 'CREATE DATABASE sos WITH OWNER = postgres ENCODING = UTF8 TEMPLATE = template_postgis;' >> /tmp/sosdb.sql</code></li>
	<li>Run the SQL script <code>psql -f /tmp/sosdb.sql</code></li>
	<li>Get out of the DB container <code>exit</code></li>
	<li>Finally, the SOS server is available the though the host at <code>http://localhost:8080/52n-sos-webapp/</code>. Go there and follow the SOS's configuration tutorial. You will need the following information:
		<ul>
			<li>The database name is <code>sos</code> (see the SQL script).</li>
			<li>The POSTGRES host IP is diplayed by running <code>docker run -it --link some-postgis:postgres --rm postgres sh -c 'exec echo "$POSTGRES_PORT_5432_TCP_ADDR"'</code> </li>
			<li>The POSTGRES host port is diplayed by running <code>docker run -it --link some-postgis:postgres --rm postgres sh -c 'exec echo "$POSTGRES_PORT_5432_TCP_PORT"'</code></li>
			<li>The postgres user password is <code>postgres</code></li>
		</ul>
	</li>
</ol>
