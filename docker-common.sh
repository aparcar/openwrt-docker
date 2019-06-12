#!/bin/bash

set -e
set -x

docker login -u $DOCKER_USER -p $DOCKER_PASS

# LEDE Build System (LEDE GnuPG key for unattended build jobs)
curl 'https://git.openwrt.org/?p=keyring.git;a=blob_plain;f=gpg/626471F1.asc' | gpg --import \
    && echo '54CC74307A2C6DC9CE618269CD84BCED626471F1:6:' | gpg --import-ownertrust

# LEDE Release Builder (17.01 "Reboot" Signing Key)
curl 'https://git.openwrt.org/?p=keyring.git;a=blob_plain;f=gpg/D52BBB6B.asc' | gpg --import \
    && echo 'B09BE781AE8A0CD4702FDCD3833C6010D52BBB6B:6:' | gpg --import-ownertrust

# OpenWrt Release Builder (18.06 Signing Key)
curl 'https://git.openwrt.org/?p=keyring.git;a=blob_plain;f=gpg/17E1CE16.asc' | gpg --import \
    && echo '6768C55E79B032D77A28DA5F0F20257417E1CE16:6:' | gpg --import-ownertrust
