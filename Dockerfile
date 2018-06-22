ARG DOCKER_USERNAME
ARG TAG
FROM ${DOCKER_USERNAME}/openwrt-rootfs:${TAG}

MAINTAINER Paul Spooren <mail@aparcar.org>

RUN mkdir -p /var/lock && \
    mkdir -p /var/run

EXPOSE 80 443 22

USER root

CMD ["/sbin/init"]
