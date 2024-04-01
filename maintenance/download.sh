#!/bin/bash

# Define the plugin IDs on Spiget
PLUGINS=(390 14467 26341 8865 8866 27123 1486 1487 63 8983)

PLUGIN_NAMES=(multiverse-core multiverse-netherportals multiverse-inventories multiverse-portals multiverse-signportals screaming-bedwars worldedit worldguard voidgen luckperms)

# Make the API request for each plugin and retrieve the download link and expected checksum
for i in ${!PLUGINS[@]}; do
  PLUGIN_ID=${PLUGINS[i]}
  PLUGIN_INFO=$(curl -s "https://api.spiget.org/v2/resources/$PLUGIN_ID")
  PLUGIN_VERSION=$(echo "$PLUGIN_INFO" | jq -r '.versions[0].id')
  DOWNLOAD_LINK="https://api.spiget.org/v2/resources/$PLUGIN_ID/versions/$PLUGIN_VERSION/download"
  EXPECTED_CHECKSUM=$(echo "$PLUGIN_INFO" | jq -r '.file.sha256')

  echo "PluginID $PLUGIN_ID"
  echo "PluginVersion $PLUGIN_VERSION"
  echo "PluginInfo $PLUGIN_INFO"
  echo "DownloadLink $DOWNLOAD_LINK"

  # Download the plugin file
  echo "curl -Lo \"${PLUGIN_NAMES[i]}.jar\" \"$DOWNLOAD_LINK\""
  curl -Lo "${PLUGIN_NAMES[i]}.jar" "$DOWNLOAD_LINK"

  # Check the SHA-256 checksum of the downloaded file
  DOWNLOADED_CHECKSUM=$(sha256sum "${PLUGIN_NAMES[i]}.jar" | awk '{ print $1 }')
  if [ "$DOWNLOADED_CHECKSUM" != "$EXPECTED_CHECKSUM" ]; then
    echo "Error: checksum for ${PLUGIN_NAMES[i]} does not match the expected value."
    exit 1
  fi
done

# Download the two additional plugins
curl -LO https://ci.opencollab.dev/job/GeyserMC/job/Geyser/job/master/lastSuccessfulBuild/artifact/bootstrap/spigot/build/libs/Geyser-Spigot.jar
curl -LO https://ci.opencollab.dev/job/GeyserMC/job/Floodgate/job/master/lastSuccessfulBuild/artifact/spigot/build/libs/floodgate-spigot.jar

# Backup the existing plugins
BACKUP_FOLDER="./backup-$(date +'%Y-%m-%d_%H-%M-%S')"
mkdir "$BACKUP_FOLDER"
cp -v /path/to/your/plugins/folder/*.jar "$BACKUP_FOLDER"

# Install the new plugins
for i in ${!PLUGIN_NAMES[@]}; do
  mv "${PLUGIN_NAMES[i]}.jar" ./plugins/
done

# Install the two additional plugins
mv Geyser-Spigot.jar ./plugins/
mv floodgate-spigot.jar ./plugins/
