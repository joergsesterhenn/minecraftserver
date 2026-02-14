Welcome to the minecraftserver wiki!

This repo contains the config of my minecraft server.

## Server
The server implementation is papermc (see https://papermc.io/).

## Hosting
The server is hosted for free in the orcale cloud (see https://blogs.oracle.com/developers/how-to-setup-and-run-a-free-minecraft-server-in-the-cloud).

## Maintenance scripts
In the maintenance folder there are scripts that automate 
* server updates - I use the script by @OwenCochell to keep papermc uptodate (https://github.com/OwenCochell/PaperMC-Update/tree/master).
* plugin updates 
* backups  

#### Crontab for scheduling
Those scripts are run on a crontab schedule (see https://webdock.io/en/docs/how-guides/system-maintenance/how-configure-crontab-linux):

    0 2 * * * /opt/papermc/maintenance/backup.sh
    0 0 1 * * /opt/papermc/maintenance/monthly_backup.sh
    0 3 * * * /opt/papermc/maintenance/update_server.sh

## Plugins
In the plugins folder are the configs for all plugins. 

I use these plugins
| plugin| purpose | url |
| ----------- | ----------- | ----------- |
| Geyser  | Allow bedrock player to join  | https://geysermc.org/ |
| Floodgate  | Needed by geyser  | https://geysermc.org/ |
| ViaVersion| Allow older/newer versions of clients to join the server |https://viaversion.com/ |
| Multiverse| Manage multiple worlds on one server | https://mvplugins.org/ |
| LuckPerms | Manage permissions for players and groups | https://luckperms.net/ |
| Dynmap | Creates a 2D map of all worlds, viewable in a browser | https://github.com/webbukkit/dynmap |
| WorldEdit | Edit your world with a brush | https://worldedit.enginehub.org/en/latest/# |
| WorldGuard | Protect areas of your World against manipulation | https://worldguard.enginehub.org/en/latest/#|
| BuildBattle | Minigame BuildBattle | https://github.com/Plugily-Projects/BuildBattle |
| ScreamingBedwars | Minigame Bedwars | https://github.com/ScreamingSandals/BedWars |

## Worlds
On the top level there are a number of folders for all the worlds configs. 
