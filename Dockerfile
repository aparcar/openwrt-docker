FROM scratch

MAINTAINER Paul Spooren <mail@aparcar.org>

ADD rootfs.tar.gz /

ADD root/ /

EXPOSE 80 443 22

USER root

CMD ["/sbin/init"]
