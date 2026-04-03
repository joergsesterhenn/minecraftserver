#!/bin/bash

# #############################
# ####  missing plugins:  #####
# #############################
#
# codframe (discontinued)

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


echo "####### Updating Modrinth Plugins ######"

#define modrinth plugins
modrinthplugins=(griefprevention fastasyncworldedit multiverse-core multiverse-inventories multiverse-signportals multiverse-portals multiverse-netherportals worldguard)

for plugin in "${modrinthplugins[@]}"
do
  echo "####### Updating --$plugin-- #######"
  API_URL="https://api.modrinth.com/v2/project/${plugin}/version"
  LATEST_JSON=$(curl -s "${API_URL}")
  DOWNLOAD_URL=$(echo "$LATEST_JSON" | jq -r '.[0].files[0].url')
  if [[ -z "$DOWNLOAD_URL" || "$DOWNLOAD_URL" == "null" ]]; then
  echo "Failed to get download URL"
  exit 1
  fi
  echo "########## curl -L $DOWNLOAD_URL -o /opt/papermc/plugins/${plugin}.jar"
  curl -fsL "$DOWNLOAD_URL" -o "/opt/papermc/plugins/${plugin}.jar"
  echo "####### Downloading --$plugin-- finished with exit code --$?-- #######"
done


echo "####### Updating Spiggot Plugins #######"

# we get spiggot plugins via spiget api if we have the resourceid
declare -A spiggotplugins
spiggotplugins=(["28140"]=LuckPerms ["17311"]=WorldEditSelectionVisualizer ["44703"]=BuildBattle ["19254"]=ViaVersion ["25391"]=VoidGen ["63714"]=Bedwars)

for plugin in "${!spiggotplugins[@]}"
do
  echo "####### Updating -- ${spiggotplugins[${plugin}]} -- ResourceID: $plugin -- #######"
  echo "########## curl -fsL https://api.spiget.org/v2/resources/$plugin/download -o /opt/papermc/plugins/${spiggotplugins[${plugin}]}.jar"
  curl -fsL https://api.spiget.org/v2/resources/$plugin/download -o /opt/papermc/plugins/${spiggotplugins[${plugin}]}.jar
  echo "####### Downloading --$plugin-- finished with exit code --$?-- #######"
done

echo "### Updating --dynmap-- ###"
curl -fsL https://mediafilez.forgecdn.net/files/7460/127/Dynmap-3.8-spigot.jar -o /opt/papermc/plugins/dynmap.jar


echo "####### Updating --citizen-- #######"
curl -fsL https://ci.citizensnpcs.co/job/citizens2/lastSuccessfulBuild/artifact/dist/target/*zip*/target.zip -o /opt/papermc/plugins/citizen.zip
rm /opt/papermc/plugins/Citizen*.jar
unzip -j /opt/papermc/plugins/citizen.zip -d /opt/papermc/plugins/
rm /opt/papermc/plugins/citizen.zip

