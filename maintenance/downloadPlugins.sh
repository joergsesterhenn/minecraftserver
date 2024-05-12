#!/bin/bash

# #############################
# ####  missing plugins:  #####
# #############################
#
# codframe (discontinued)
# dynmap (beta required)
# luckperms (no downloadlink for latest version)
# buildbattle (no downloadlink for latest version)


echo "####### Updating Geyser Plugins #######"

#define geyser plugins
geyserplugins=(geyser floodgate)
for plugin in "${geyserplugins[@]}"
do
  echo "####### Updating --$plugin-- #######"
  echo "########## curl -fsL  https://download.geysermc.org/v2/projects/$plugin/versions/latest/builds/latest/downloads/spigot -o /opt/papermc/plugins/$plugin.jar"
  curl -fsL  https://download.geysermc.org/v2/projects/$plugin/versions/latest/builds/latest/downloads/spigot -o /opt/papermc/plugins/$plugin.jar
  echo "####### Downloading --$plugin-- finished with exit code --$?-- #######"
done

echo "####### Updating Bukkit Plugins #######"

#define bukkit plugins
bukkitplugins=(screamingbedwars worldedit multiverse-core multiverse-inventories multiverse-signportals multiverse-portals multiverse-netherportals worldguard)

# dynmap is currently on beta - can not update to latests release

for plugin in "${bukkitplugins[@]}"
do
  echo "####### Updating --$plugin-- #######"
  echo "########## curl -fsL https://dev.bukkit.org/projects/$plugin/files/latest -o /opt/papermc/plugins/$plugin.jar"
  curl -fsL https://dev.bukkit.org/projects/$plugin/files/latest -o /opt/papermc/plugins/$plugin.jar
  echo "####### Downloading --$plugin-- finished with exit code --$?-- #######"
done

echo "####### Updating --citizen-- #######"
curl -fsL https://ci.citizensnpcs.co/job/citizens2/lastSuccessfulBuild/artifact/dist/target/*zip*/target.zip -o /opt/papermc/plugins/citizen.zip
rm /opt/papermc/plugins/Citizen*.jar
unzip -j /opt/papermc/plugins/citizen.zip -d /opt/papermc/plugins/
rm /opt/papermc/plugins/citizen.zip


