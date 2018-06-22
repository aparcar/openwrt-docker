ARG ROOTFS_URL

FROM scratch

MAINTAINER Paul Spooren <mail@aparcar.org>

ADD $ROOTFS_URL /

RUN mkdir /var/lock

EXPOSE 80 443 22

USER root

CMD ["/sbin/init"]
