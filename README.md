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
	<li>Enable <code>setup.sh</code> for execution <code>chmod +x setup.sh</code> and run it <code>./setup.sh</code>. This script downloads 52North's SOS and extracts the <code>SOS WAR</code> file. Then, the script launches a docker Tomcat and it mounts the <code>SOS WAR</code> file into Tomcat's webapps folder. Finally, the SOS server is available at <code>http://localhost:8080/52n-sos-webapp</code>
</ol>
