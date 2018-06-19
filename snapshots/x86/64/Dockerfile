FROM scratch

MAINTAINER Paul Spooren <mail@aparcar.org>

ADD https://downloads.openwrt.org/snapshots/targets/x86/64/openwrt-x86-64-generic-rootfs.tar.gz /

RUN mkdir /var/lock

USER root
CMD /sbin/init
