#!/bin/bash

BASE_URL="https://downloads.openwrt.org"
X86_LATEST="snapshots/targets/x86/64/openwrt-x86-64-generic-rootfs.tar.gz"
X86_STABLE="releases/17.01.4/targets/x86/64/lede-17.01.4-x86-64-generic-rootfs.tar.gz"
ARM_LATEST="snapshots/targets/armvirt/64/openwrt-armvirt-64-default-rootfs.tar.gz"

docker build -t "$DOCKER_USERNAME/openwrt:stable" \
    --build-arg "ROOTFS_URL=$BASE_URL/$X86_STABLE" .

docker build -t "$DOCKER_USERNAME/openwrt:latest" \
    --build-arg "ROOTFS_URL=$BASE_URL/$X86_LATEST" .

docker build -t "$DOCKER_USERNAME/openwrt:arm-latest" \
    --build-arg "ROOTFS_URL=$BASE_URL/$ARM_LATEST" .


echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
docker push "$DOCKER_USERNAME/openwrt:stable"
docker push "$DOCKER_USERNAME/openwrt:latest"
docker push "$DOCKER_USERNAME/openwrt:arm-latest"

#URLS=$(curl -s "$BASE_URL/snapshots/targets/?json" | \
#    sed -e 's/","/\n/g' -e 's/\["//g' -e 's/"\]//g')
#IMAGEBUILDER_URLS="(echo $URL | grep imagebuilder)"
#SDK_URLS="(echo $URL | grep sdk)"
#
#for IMAGEBUILDER_URL in $IMAGEBUIDLER_URLS; do
#    IMABEBUILDER_DIR="$(basename -a -s .tar.xz $IMAGEBUILDER_URL)"
#    TARGET="$(echo $IMAGEBUILDER_URL | cut -d '/' -f 1-2 | sed 's#/#_#'
#
#    docker build \
#        -t "$repo/openwrt-imagebuilder:$TARGET-latest" --build-arg \
#        "IMAGEBUILDER_URL=$IMAGEBUILDER_URL" "IMAGEBUILDER_DIR=$IMAGEBUILDER_DIR" \
#        imagebuilder/
#
#    docker push "$DOCKER_USERNAME/openwrt-imagebuilder:$TARGET-latest"
#then
#
#for SDK_URL in $IMAGEBUIDLER_URLS; do
#    IMABEBUILDER_DIR="$(basename -a -s .tar.xz $SDK_URL)"
#    TARGET="$(echo $SDK_URL | cut -d '/' -f 1-2 | sed 's#/#_#'
#
#    docker build \
#        -t "$repo/openwrt-imagebuilder:$TARGET-latest" --build-arg \
#        "SDK_URL=$SDK_URL" "SDK_DIR=$SDK_DIR" \
#        imagebuilder/
#
#    docker push "$DOCKER_USERNAME/openwrt-imagebuilder:$TARGET-latest"
#then
