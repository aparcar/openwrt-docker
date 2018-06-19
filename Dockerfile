FROM scratch
ARG ROOTFS_URL

MAINTAINER Paul Spooren <mail@aparcar.org>

ADD $ROOTFS_URL /

EXPOSE 80 443 22

USER root
