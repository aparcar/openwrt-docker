#!/bin/sh

BASE_URL="https://downloads.openwrt.org"
X86_LATEST="snapshots/targets/x86/64/openwrt-x86-64-generic-rootfs.tar.gz"
X86_STABLE="releases/17.01.4/targets/x86/64/lede-17.01.4-x86-64-generic-rootfs.tar.gz"
ARM_LATEST="snapshots/targets/armvirt/64/openwrt-armvirt-64-default-rootfs.tar.gz"

build_rootfs() {
    curl -s "$BASE_URL/$2" | docker import - "$DOCKER_USERNAME/openwrt-rootfs:$2"
    docker push "$DOCKER_USERNAME/openwrt-rootfs:$1"

}

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

build_rootfs() "latest" "$X86_LATEST"
build_rootfs() "stable" "$X86_STABLE"
build_rootfs() "arm-latest" "$ARM_LATEST"
