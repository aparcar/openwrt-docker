#!/bin/sh

BASE_URL="https://downloads.openwrt.org"

build_rootfs() {
    curl -s "$BASE_URL/$2" | docker import - "$DOCKER_USERNAME/openwrt-rootfs:$1"
    docker push "$DOCKER_USERNAME/openwrt-rootfs:$1"
}

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

build_rootfs "latest" "snapshots/targets/x86/64/openwrt-x86-64-generic-rootfs.tar.gz"
build_rootfs "stable" "releases/17.01.4/targets/x86/64/lede-17.01.4-x86-64-generic-rootfs.tar.gz"
build_rootfs "arm-latest" "snapshots/targets/armvirt/64/openwrt-armvirt-64-default-rootfs.tar.gz"
