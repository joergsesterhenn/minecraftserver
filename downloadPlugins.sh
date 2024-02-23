#!/bin/bash
pushd /opt/papermc/plugins
curl -L https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/spigot -o geyser.jar
#curl -LO https://ci.opencollab.dev/job/GeyserMC/job/Geyser/job/master/lastSuccessfulBuild/artifact/bootstrap/spigot/build/libs/Geyser-Spigot.jar

curl -L https://download.geysermc.org/v2/projects/floodgate/versions/latest/builds/latest/downloads/spigot -o floodgate.jar

#curl -LO https://ci.opencollab.dev/job/GeyserMC/job/Floodgate/job/master/lastSuccessfulBuild/artifact/spigot/build/libs/floodgate-spigot.jar

popd
