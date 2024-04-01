#!/bin/bash
echo "##### Update paper to latest version #####"
su minecraft -c '/opt/papermc/server_update.py /opt/papermc/paper.jar --quiet'
echo "##### Update geyser/floodgate to latest version #####"
su minecraft -c '/opt/papermc/downloadPlugins.sh'
echo "#####  Restarting Minecraft Server #####"
su opc -c 'sudo systemctl restart minecraft'
