FROM alpine:latest

# --- define Docker Environment Variables
ENV ddclient_VERSION 3.9.1
ENV OpenDNS_Username ""
ENV OpenDNS_Password ""
ENV OpenDNS_Net-Label ""

# --- Add the required packages for ddclient to function
RUN apk update && \
		apk add wget unzip make perl perl-utils perl-test-taint perl-netaddr-ip perl-net-ip perl-yaml perl-log-log4perl perl-io-socket-ssl openrc nano


# --- Download & Unpack the defined version of ddclient for GitHub
RUN wget https://github.com/ddclient/ddclient/archive/v$ddclient_VERSION.zip -O /tmp/ddclient-$ddclient_VERSION.zip
RUN unzip /tmp/ddclient-$ddclient_VERSION.zip


# --- Setup the installation and initalise ddclient
RUN cp /tmp/ddclient-$ddclient_VERSION/ddclient /usr/bin
RUN mkdir /etc/ddclient && \
	mkdir /var/cache/ddclient
COPY ddclient.conf /etc/ddclient/ddclient.conf
RUN cp /tmp/ddclient-$ddclient_VERSION/sample-etc_rc.d_init.d_ddclient.alpine /etc/init.d/ddclient

# --- Add user definitions to configuration file
COPY entrypoint.sh /entrypoint.sh

# --- start ddclient
RUN rc-update add ddclient
RUN rc-service ddclient start
RUN rc-
