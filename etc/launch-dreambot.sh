# Wait for the X server to be up and running
while ! xset q &>/dev/null; do
    sleep 1
done

export DISPLAY=":1"
wget https://dreambot.org/DBLauncher.jar -O /root/DBLauncher.jar
java -jar /root/DBLauncher.jar