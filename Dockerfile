FROM scratch

MAINTAINER Paul Spooren <mail@aparcar.org>

ADD rootfs.tar.gz /

ADD root/ /

RUN echo 'console::askfirst:/usr/libexec/login.sh' >> /etc/inittab

EXPOSE 80 443 22

USER root

CMD ["/sbin/init"]
