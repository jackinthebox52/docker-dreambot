FROM ubuntu:latest

LABEL maintainer="Jack Massey<jackmassey2000@gmail.com>"

ENV HOME /root
ARG DEBIAN_FRONTEND noninteractive
ENV JAVA openjdk-8-jdk

RUN apt-get update \
	&& apt-get install -y \
        supervisor \
		openssh-server nano \
		openbox \
		x11vnc xvfb \
        websockify \
		pwgen \
        $JAVA \
	&& apt-get autoclean \
	&& apt-get autoremove \
	&& rm -rf /var/lib/apt/lists

WORKDIR /root

ADD etc /etc/docker-dreambot

EXPOSE 5900
EXPOSE 22

ENTRYPOINT ["/etc/docker-dreambot/entry.sh"]