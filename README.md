# OpenWrt Docker repository

This repository contains scripts to create Docker containers for OpenWrt.  The
scripts are run via an CI and upload such containers do docker.io.

## `rootfs`

An unpackaged version of OpenWrts rootf for different architectures. The
`./rootfs` folder requires slight modifications to work within Docker,
additional files for the rootfs should be added there before building.

### Example

    docker run --rm -it openwrt:x86-64

Enjoy a local OpenWrt container with internet access. Once closed the image is
removed.

### Tags

* x86-64
* armvirt-32
* armvirt-64

## `sdk`

Contains the OpenWrt SDK based on a `debian:latest` container with required
packages preinstalled. This can be usefull when building packages on MacOS X,
Windows or via CI.

### Example

    docker run --rm -v ./bin/:/home/build/sdk/bin -it sdk:x86-64
    # within the Docker container
    ./scripts/feeds update base
    make defconfig
    ./scripts/feeds install firewall
    make package/firewall/{clean,compile} -j$(nproc)

Enjoy a local OpenWrt SDK container building the `firewall3` package and but the
binary in hosts `./bin` folder.

### Tags

All currently available SDKs via lower case `<target>-<subtarget>`

## `imagebuilder`

Contains the OpenWrt ImageBuilder based on a `debian:latest` container with
required packages preinstalled. This can be usefull when creating images on
MacOS X, Windows or via CI.

### Example

    docker run --rm -v ./bin/:/home/build/imagebuilder/bin -it imagebuilder:x86-64
    # within the Docker container
    make image

Enjoy a local OpenWrt ImageBuilder container building an image for x86/64 and
store the binary in hosts `./bin` folder.

### Tags

All currently available ImageBuilders via lower case `<target>-<subtarget>`
