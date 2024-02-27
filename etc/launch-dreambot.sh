# Wait for the X server to be up and running
sleep 5

export DISPLAY=":1"
wget https://dreambot.org/DBLauncher.jar -O /root/DBLauncher.jar
java -jar /root/DBLauncher.jar