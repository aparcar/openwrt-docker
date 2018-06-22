#!/bin/bash

build_image() {
    docker build -t "$DOCKER_USERNAME/openwrt:$1" \
        --build-arg "DOCKER_USERNAME=$DOCKER_USERNAME" \
        --build-arg "TAG=$1" .
    docker push "$DOCKER_USERNAME/openwrt:$1"
}

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

build_image "stable"
build_image "latest"
build_image "arm-latest"

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
