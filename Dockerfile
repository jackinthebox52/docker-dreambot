FROM ubuntu:latest

LABEL Jack Massey<jackmassey2000@gmail.com>

ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
	&& apt-get install -y supervisor \
		openssh-server nano \
		openbox \
		x11vnc xvfb \
		pwgen \
	&& apt-get autoclean \
	&& apt-get autoremove \
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /root

ADD etc /etc

EXPOSE 5900
EXPOSE 22

ENTRYPOINT ["/etc/docker-dreambot-start.sh"]