FROM ubuntu:latest

LABEL Jack Massey<jackmassey2000@gmail.com>

ENV HOME /root
ARG DEBIAN_FRONTEND noninteractive
ENV JAVA openjdk-8-jdk

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
        supervisor \
		openssh-server nano \
		openbox \
		x11vnc xvfb \
		pwgen \
        $JAVA \
	&& apt-get autoclean \
	&& apt-get autoremove \
	&& rm -rf /var/lib/apt/lists

WORKDIR /root

ADD etc /etc

EXPOSE 5900
EXPOSE 22

ENTRYPOINT ["/etc/docker-dreambot-start.sh"]