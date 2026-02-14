#!/bin/bash
echo "##### Update paper to latest version #####"
#echo "skipping until newest is stable again"
su minecraft -c 'python /opt/papermc/maintenance/server_update.py -o /opt/papermc/paper.jar'
echo "##### Update geyser/floodgate to latest version #####"
su minecraft -c '/opt/papermc/maintenance/downloadPlugins.sh'
echo "#####  Restarting Minecraft Server #####"
su opc -c 'sudo systemctl restart minecraft'
