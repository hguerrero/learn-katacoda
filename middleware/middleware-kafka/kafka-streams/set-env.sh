echo "Waiting for project..."
while [ ! -f /opt/projects/kafka-streams/pom.xml ]; do sleep 1; done # wait for the setup.sh file to exist
echo "Ready"