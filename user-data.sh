#!/bin/sh
sudo apt-get -y update
sudo apt-get -y install nginx git default-jre scala unzip

# Install sbt
wget http://repo.scala-sbt.org/scalasbt/sbt-native-packages/org/scala-sbt/sbt/0.13.1/sbt.deb
sudo dpkg -i sbt.deb

# Install Play
wget http://downloads.typesafe.com/play/2.2.1/play-2.2.1.zip
unzip -d /opt play-2.2.1.zip
sudo chmod +x /opt/play-2.2.1/play
sudo ln -s /opt/play-2.2.1/play /usr/local/bin/play

# Install and Start Player app
mkdir -p /usr/local/src
cd /usr/local/src
git clone https://github.com/tobyjsullivan/feedme-player.git
cd ./feedme-player
sudo play run --http.port=4001
