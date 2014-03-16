#!/bin/sh
sudo apt-get -y update
sudo apt-get -y install nginx git openjdk-7-jdk scala unzip

# Configure Java 7
sudo update-alternatives --set java /usr/lib/jvm/java-7-openjdk-amd64/jre/bin/java

# Install sbt
wget http://repo.scala-sbt.org/scalasbt/sbt-native-packages/org/scala-sbt/sbt/0.13.1/sbt.deb
sudo dpkg -i sbt.deb

# Install Play
wget http://downloads.typesafe.com/play/2.2.1/play-2.2.1.zip
unzip -d /opt play-2.2.1.zip
sudo chmod +x /opt/play-2.2.1/play
sudo ln -s /opt/play-2.2.1/play /usr/local/bin/play

# Install and Start Player app
cd ~ubuntu/
wget assets.tobyandbryan.com/feedme/feedme-player-1.0.tar.gz
tar -xzf feedme-player-1.0.tar.gz
echo "sudo ~ubuntu/start -Dhttp.port=4001" >> /etc/rc.local

