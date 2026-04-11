#!/bin/bash

# #############################
# ####  missing plugins:  #####
# #############################
#
# codframe (discontinued)

echo "####### Updating Geyser Plugins #######"

#define geyser plugins
# whole section can move to modrinth once this issue is closed:
# https://github.com/GeyserMC/Floodgate/issues/609
geyserplugins=(floodgate)
for plugin in "${geyserplugins[@]}"
do
  echo "####### Updating --$plugin-- #######"
  echo "########## curl -fsL  https://download.geysermc.org/v2/projects/$plugin/versions/latest/builds/latest/downloads/spigot -o /opt/papermc/plugins/$plugin.jar"
  curl -fsL  https://download.geysermc.org/v2/projects/$plugin/versions/latest/builds/latest/downloads/spigot -o /opt/papermc/plugins/$plugin.jar
  echo "####### Downloading --$plugin-- finished with exit code --$?-- #######"
done


echo "####### Updating Modrinth Plugins ######"

#define modrinth plugins
modrinthplugins=(geyser voidgen viaversion luckperms griefprevention fastasyncworldedit multiverse-core multiverse-inventories multiverse-signportals multiverse-portals multiverse-netherportals worldguard)

for plugin in "${modrinthplugins[@]}"
do
  echo "####### Updating --$plugin-- #######"
  API_URL="https://api.modrinth.com/v2/project/${plugin}/version"
  VERSIONS=$(curl -s "${API_URL}")
  # Helper function to pick the first matching version for a loader
  get_download_url_for_loader() {
    local loader="$1"

    # 1) Try RELEASE versions first
    local release_url=$(echo "$VERSIONS" | jq -r --arg loader "$loader" '
      [
        .[]
        | select(.version_type == "release")
        | select(any(.game_versions[]; startswith("1.21")))
        | select(any(.loaders[]; . == $loader))
      ]
      | sort_by(.date_published)
      | reverse
      | .[0].files[0].url
    ')

    if [[ -n "$release_url" && "$release_url" != "null" ]]; then
      echo "$release_url"
      return
    fi

    # 2) Fall back to ANY version (beta, alpha, rc…)
    echo "$VERSIONS" | jq -r --arg loader "$loader" '
      [
        .[]
        | select(any(.game_versions[]; startswith("1.21")))
        | select(any(.loaders[]; . == $loader))
      ]
      | sort_by(.date_published)
      | reverse
      | .[0].files[0].url
    '
  }

  # Priority: paper → spigot → bukkit
  DOWNLOAD_URL=$(get_download_url_for_loader "paper")

  if [[ -z "$DOWNLOAD_URL" || "$DOWNLOAD_URL" == "null" ]]; then
    DOWNLOAD_URL=$(get_download_url_for_loader "spigot")
  fi

  if [[ -z "$DOWNLOAD_URL" || "$DOWNLOAD_URL" == "null" ]]; then
    DOWNLOAD_URL=$(get_download_url_for_loader "bukkit")
  fi

  if [[ -z "$DOWNLOAD_URL" || "$DOWNLOAD_URL" == "null" ]]; then
    echo "Failed to find a compatible version for $plugin"
    exit 1
  fi

  echo "########## curl -L $DOWNLOAD_URL -o /opt/papermc/plugins/${plugin}.jar"
  curl -fsL "$DOWNLOAD_URL" -o "/opt/papermc/plugins/${plugin}.jar"
  echo "####### Downloading --$plugin-- finished with exit code --$?-- #######"
done


echo "####### Updating Hangar Plugins ######"

hangarplugins=(
  "ScreamingSandals/ScreamingBedWars"
  "MrMicky/WorldEditSelectionVisualizer"
)

for plugin in "${hangarplugins[@]}"; do
  AUTHOR="${plugin%%/*}"
  PROJECT="${plugin##*/}"

  echo "####### Updating --$PROJECT-- #######"

  API_URL="https://hangar.papermc.io/api/v1/projects/${AUTHOR}/${PROJECT}/versions"
  VERSIONS_JSON=$(curl -s -H "User-Agent: joerg-mc-updater/1.0" "$API_URL")

  # Find latest version supporting MC 1.21
  VERSION=$(echo "$VERSIONS_JSON" | jq -r '
    .result[]
    | select(.platformDependencies.PAPER | index("1.21"))
    | .name
  ' | sort -V | tail -n 1)

  if [[ -z "$VERSION" || "$VERSION" == "null" ]]; then
    echo "Failed to find compatible version for $PROJECT"
    continue
  fi

  echo "Latest compatible version: $VERSION"

  VERSION_API="https://hangar.papermc.io/api/v1/projects/${AUTHOR}/${PROJECT}/versions/${VERSION}"
  FILES_JSON=$(curl -s -H "User-Agent: mc-updater/1.0" "$VERSION_API")

  DOWNLOAD_URL=$(echo "$FILES_JSON" | jq -r '.downloads.PAPER.downloadUrl')

  if [[ -z "$DOWNLOAD_URL" || "$DOWNLOAD_URL" == "null" ]]; then
    echo "Failed to get download URL for $PROJECT"
    continue
  fi

  echo "########## curl -L $DOWNLOAD_URL -o /opt/papermc/plugins/${PROJECT}.jar"
  curl -fsL -H "User-Agent: mc-updater/1.0" "$DOWNLOAD_URL" -o "/opt/papermc/plugins/${PROJECT}.jar"

  echo "####### Downloading --$PROJECT-- finished with exit code --$?-- #######"
done


echo "####### Updating Spiggot Plugins #######"

# we get spiggot plugins via spiget api if we have the resourceid
declare -A spiggotplugins
#spiggotplugins=(["17311"]=WorldEditSelectionVisualizer ["44703"]=BuildBattle ["63714"]=Bedwars)
spiggotplugins=(["44703"]=BuildBattle)
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

#echo "####### Updating --denizen-- #######"
#curl -fsL https://ci.citizensnpcs.co/job/Denizen/lastSuccessfulBuild/artifact/target/Denizen-*.jar/*zip*/target.zip -o /opt/papermc/plugins/denizen.zip
#rm /opt/papermc/plugins/Denizen*.jar
#unzip -j /opt/papermc/plugins/denizen.zip -d /opt/papermc/plugins/
#rm /opt/papermc/plugins/denizen.zip

#echo "####### Updating --depenizen-- #######"
#curl -fsL https://ci.citizensnpcs.co/job/Depenizen/lastSuccessfulBuild/artifact/target/*zip*/target.zip -o /opt/papermc/plugins/depenizen.zip
#rm /opt/papermc/plugins/Depenizen*.jar
#unzip -j /opt/papermc/plugins/depenizen.zip -d /opt/papermc/plugins/
#rm /opt/papermc/plugins/depenizen.zip

