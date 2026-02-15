# Minecraftserver

This repo contains the config of my minecraft server.

## Server
The server implementation is papermc (see https://papermc.io/).

## Hosting
The server is hosted for free in the orcale cloud (see https://blogs.oracle.com/developers/how-to-setup-and-run-a-free-minecraft-server-in-the-cloud).

The machine 

    VM.Standard.A1.Flex
    OCPU: 4
    Network (Gbit/s): 4
    Memory (GB): 24
    Blockmemory(GB): 50 (Boot) + 150

The OS

    Oracle Linux Server release 9.7
    oraclelinux-release-9.7-1.0.6.el9.aarch64
    Kernel 6.12.0-107.59.3.4.el9uek.aarch64
    updated from image: Oracle-Linux-8.6-aarch64-2022.12.15-0

Installed Packages

    adobe-source-code-pro-fonts-0:2.030.1.050-12.el9.1.noarch
    alternatives-0:1.24-2.0.1.el9.aarch64
    bind-utils-32:9.16.23-34.0.1.el9_7.1.aarch64
    binutils-gold-0:2.35.2-67.0.1.el9_7.1.aarch64
    cloud-init-0:24.4-7.0.1.el9_7.1.noarch
    cloud-utils-growpart-0:0.33-1.el9.aarch64
    cockpit-bridge-0:344-1.0.1.el9.noarch
    cockpit-ws-selinux-0:344-1.0.1.el9.aarch64
    compat-openssl11-1:1.1.1k-5.el9_6.1.aarch64
    dbus-broker-0:28-7.el9.aarch64
    dejavu-sans-fonts-0:2.37-18.el9.noarch
    device-mapper-multipath-0:0.8.7-39.el9_7.1.aarch64
    dtrace-0:2.0.5-2.el9.aarch64
    efibootmgr-0:16-12.0.1.el9.aarch64
    environment-modules-0:5.3.0-2.el9.aarch64
    epel-release-0:8-22.el8.noarch
    flashrom-0:1.2-10.el9.aarch64
    fonts-filesystem-1:2.0.5-7.el9.1.noarch
    fribidi-0:1.0.10-6.el9.2.aarch64
    fwupd-plugin-flashrom-0:1.9.31-1.0.1.el9.aarch64
    gawk-all-langpacks-0:5.1.0-6.el9.aarch64
    gcc-toolset-14-annobin-docs-0:12.88-1.el9.noarch
    gcc-toolset-14-annobin-plugin-gcc-0:12.88-1.el9.aarch64
    gcc-toolset-14-binutils-0:2.41-5.el9_7.1.aarch64
    gcc-toolset-14-binutils-devel-0:2.41-5.el9_7.1.aarch64
    gcc-toolset-14-gcc-0:14.2.1-12.el9_7.aarch64
    gcc-toolset-14-gcc-c++-0:14.2.1-12.el9_7.aarch64
    gcc-toolset-14-libstdc++-devel-0:14.2.1-12.el9_7.aarch64
    gcc-toolset-14-runtime-0:14.0-2.el9.aarch64
    gdisk-0:1.0.7-5.el9.aarch64
    git-0:2.47.3-1.el9_6.aarch64
    graphite2-0:1.3.14-9.el9.aarch64
    grub2-efi-aa64-1:2.06-114.0.1.el9_7.aarch64
    grub2-tools-minimal-1:2.06-114.0.1.el9_7.aarch64
    harfbuzz-0:2.7.4-10.el9.aarch64
    inih-0:49-6.el9.aarch64
    initscripts-rename-device-0:10.11.8-4.0.1.el9.aarch64
    initscripts-service-0:10.11.8-4.0.1.el9.noarch
    iperf3-0:3.9-14.el9_7.1.aarch64
    iproute-tc-0:6.14.0-2.el9.aarch64
    iptables-nft-0:1.8.10-11.el9_5.aarch64
    iptables-nft-services-0:1.8.10-11.el9_5.noarch
    iscsi-initiator-utils-0:6.2.1.11-0.git4b3e853.0.1.el9.aarch64
    java-21-amazon-corretto-devel-1:21.0.10.7-1.aarch64
    jq-0:1.6-19.el9.aarch64
    kernel-uek-0:6.12.0-107.59.3.4.el9uek.aarch64
    kernel-uek-core-0:6.12.0-107.59.3.4.el9uek.aarch64
    kernel-uek-devel-0:5.4.17-2136.332.5.2.el8uek.aarch64
    kernel-uek-devel-0:5.4.17-2136.352.5.el8uek.aarch64
    kernel-uek-devel-0:6.12.0-107.59.3.4.el9uek.aarch64
    kernel-uek-modules-0:6.12.0-107.59.3.4.el9uek.aarch64
    kernel-uek-modules-core-0:6.12.0-107.59.3.4.el9uek.aarch64
    kernel-uek-modules-desktop-0:6.12.0-107.59.3.4.el9uek.aarch64
    kernel-uek-modules-extra-netfilter-0:6.12.0-107.59.3.4.el9uek.aarch64
    kernel-uek-modules-usb-0:6.12.0-107.59.3.4.el9uek.aarch64
    kernel-uek-modules-wireless-0:6.12.0-107.59.3.4.el9uek.aarch64
    ksplice-0:2.0.17-1.el9.aarch64
    ksplice-release-el9-0:1.0-2.el9.aarch64
    langpacks-core-en-0:3.0-16.el9.noarch
    langpacks-core-font-en-0:3.0-16.el9.noarch
    langpacks-en-0:3.0-16.el9.noarch
    leapp-deps-el9-0:5.0.9-1.0.3.el9.noarch
    leapp-repository-deps-el9-0:5.0.9-1.0.3.el9.noarch
    ledmon-libs-0:1.1.0-3.el9.aarch64
    libXft-0:2.3.3-8.el9.aarch64
    libbrotli-0:1.0.9-9.el9_7.aarch64
    libcap-ng-python3-0:0.8.2-7.el9.aarch64
    libcbor-0:0.7.0-5.el9.aarch64
    libdatrie-0:0.2.13-4.el9.aarch64
    libeconf-0:0.4.1-4.el9.aarch64
    libev-0:4.33-6.el9.aarch64
    libfido2-0:1.13.0-2.el9.aarch64
    libjcat-0:0.1.6-3.el9.aarch64
    libnvme-0:1.13-1.el9.aarch64
    libproxy-webkitgtk4-0:0.4.15-35.el9.aarch64
    libreport-filesystem-0:2.15.2-6.0.3.el9.noarch
    librsvg2-0:2.50.7-3.el9.aarch64
    librsvg2-tools-0:2.50.7-3.el9.aarch64
    libthai-0:0.1.28-8.el9.aarch64
    libtool-ltdl-0:2.4.6-46.el9.aarch64
    libtracecmd-0:1.5.2-2.el9.aarch64
    libtracefs-0:1.8.1-2.el9.aarch64
    liburing-0:2.5-1.el9.aarch64
    libuv-1:1.42.0-2.el9_4.aarch64
    libverto-libev-0:0.3.2-3.el9.aarch64
    linux-firmware-whence-999:20251110-999.45.gitc0af6c70.el9.noarch
    ltrace-0:0.7.91-43.el9.aarch64
    mailx-0:12.5-29.el8.aarch64
    man-pages-0:6.04-9.el9_7.noarch
    nfs-utils-1:2.5.4-38.0.1.el9.aarch64
    nginx-2:1.20.1-22.0.1.el9_6.3.aarch64
    nginx-core-2:1.20.1-22.0.1.el9_6.3.aarch64
    nodejs-docs-1:16.20.2-8.0.1.el9_4.noarch
    nodejs-libs-1:16.20.2-8.0.1.el9_4.aarch64
    npm-1:8.19.4-1.16.20.2.8.0.1.el9_4.aarch64
    oci-included-release-el9-0:1.0-2.el9.aarch64
    oci-linux-config-0:2.0-1.0.17.el9.noarch
    openssl-fips-provider-0:3.0.7-8.0.1.el9.aarch64
    openssl-fips-provider-so-0:3.0.7-8.0.1.el9.aarch64
    oracle-cloud-agent-0:1.55.6-13.el9.aarch64
    oracle-logos-httpd-0:90.4-1.0.1.el9.noarch
    oraclelinux-release-el9-0:1.0-26.el9.aarch64
    pango-0:1.48.7-3.el9.aarch64
    pcp-0:6.3.7-5.0.6.el9.aarch64
    pcp-conf-0:6.3.7-5.0.6.el9.aarch64
    pcp-libs-0:6.3.7-5.0.6.el9.aarch64
    pcp-selinux-0:6.3.7-5.0.6.el9.aarch64
    pcp-system-tools-0:6.3.7-5.0.6.el9.aarch64
    pcre2-syntax-0:10.40-6.0.1.el9.noarch
    perf-0:5.14.0-611.30.1.el9_7.aarch64
    perl-AutoLoader-0:5.74-481.1.el9_6.noarch
    perl-B-0:1.80-481.1.el9_6.aarch64
    perl-Class-Struct-0:0.66-481.1.el9_6.noarch
    perl-DynaLoader-0:1.47-481.1.el9_6.aarch64
    perl-Fcntl-0:1.13-481.1.el9_6.aarch64
    perl-File-Basename-0:2.85-481.1.el9_6.noarch
    perl-File-Copy-0:2.34-481.1.el9_6.noarch
    perl-File-Find-0:1.37-481.1.el9_6.noarch
    perl-File-stat-0:1.09-481.1.el9_6.noarch
    perl-FileHandle-0:2.03-481.1.el9_6.noarch
    perl-Getopt-Std-0:1.12-481.1.el9_6.noarch
    perl-IPC-Open3-0:1.21-481.1.el9_6.noarch
    perl-NDBM_File-0:1.15-481.1.el9_6.aarch64
    perl-POSIX-0:1.94-481.1.el9_6.aarch64
    perl-SelectSaver-0:1.02-481.1.el9_6.noarch
    perl-Symbol-0:1.08-481.1.el9_6.noarch
    perl-Tie-RefHash-0:1.40-4.el9.noarch
    perl-base-0:2.27-481.1.el9_6.noarch
    perl-if-0:0.60.800-481.1.el9_6.noarch
    perl-lib-0:0.65-481.1.el9_6.aarch64
    perl-macros-4:5.32.1-481.1.el9_6.noarch
    perl-meta-notation-0:5.32.1-481.1.el9_6.noarch
    perl-mro-0:1.23-481.1.el9_6.aarch64
    perl-overload-0:1.31-481.1.el9_6.noarch
    perl-overloading-0:0.02-481.1.el9_6.noarch
    perl-sigtrap-0:1.09-481.1.el9_6.noarch
    perl-subs-0:1.03-481.1.el9_6.noarch
    perl-vars-0:1.05-481.1.el9_6.noarch
    postfix-2:3.5.25-1.el9.aarch64
    powerline-fonts-0:2.8.4-1.el8.noarch
    python-unversioned-command-0:3.9.25-3.0.1.el9_7.noarch
    python3-0:3.9.25-3.0.1.el9_7.aarch64
    python3-attrs-0:20.3.0-7.0.1.el9.noarch
    python3-dasbus-0:1.5-1.el9.noarch
    python3-file-magic-0:5.39-16.el9.noarch
    python3-gobject-base-noarch-0:3.40.1-6.el9.noarch
    python3-inotify-0:0.9.6-25.el9.noarch
    python3-pcp-0:6.3.7-5.0.6.el9.aarch64
    python3-pyrsistent-0:0.17.3-8.el9.aarch64
    rpm-sign-libs-0:4.16.1.3-39.el9.aarch64
    rsyslog-logrotate-0:8.2506.0-2.0.1.el9.aarch64
    scl-utils-1:2.0.3-4.el9.aarch64
    setools-console-0:4.4.4-1.el9.aarch64
    shim-aa64-0:16.1-1.0.2.el9.aarch64
    snapd-0:2.72-1.el8.aarch64
    systemd-boot-unsigned-0:252-55.0.3.el9.aarch64
    systemd-rpm-macros-0:252-55.0.3.el9_7.7.noarch
    systemtap-0:5.3-3.0.1.el9.aarch64
    tcl-1:8.6.10-7.el9.aarch64
    trace-cmd-0:3.3.1-2.el9.aarch64
    tuned-profiles-oci-recommend-0:2.26.0-1.0.1.el9.noarch
    util-linux-core-0:2.37.4-21.0.1.el9_7.aarch64
    webkit2gtk3-jsc-0:2.50.4-1.el9_7.aarch64
    xml-common-0:0.6.3-58.el9.noarch
    yum-utils-0:4.3.0-24.0.1.el9_7.noarch

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
