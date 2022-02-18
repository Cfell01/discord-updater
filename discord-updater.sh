#!/bin/bash

clear

LAST=$1

wget -O ~/Downloads/discord.tar.gz "https://discordapp.com/api/download?platform=linux&format=tar.gz";

echo 'Download Complete'

mkdir -p ~/Applications;

echo 'Directory Created'

tar xvzf ~/Downloads/discord.tar.gz -C ~/Applications;

echo 'Archive Extracted to /Applications'

echo

sudo cp -r ~/Applications/Discord /usr/lib64/

if [ $? -eq 0 ]; then
  echo 'COPY SUCCEED'
else
  echo 'FAIL cp'
fi

sudo rm -rfd /usr/lib64/discord

if [ $? -eq 0 ]; then
  echo 'RM SUCCED'
else
  echo 'FAIL rm previous'
fi

sudo mv /usr/lib64/Discord /usr/lib64/discord

if [ $? -eq 0 ]; then
  echo 'MV SUCCEED'
else
  echo 'FAIL rename'
fi

sudo rm -rfd ~/Downloads/*.tar.gz

if [ $? -eq 0 ]; then
  echo 'DELETING TAR.GZ'
else
  echo 'FAIL delete tar.gz'
fi

sudo rm -rfd ~/Applications/Discord

if [ $? -eq 0 ]; then
  echo 'DELETING Discord directory'
else
  echo 'FAIL delete directory'
fi
