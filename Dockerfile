FROM alpine:latest

# --- define Docker Environment Variables
ENV OpenDNS_Username ""
ENV OpenDNS_Password ""
ENV OpenDNS_Net_Label ""
# ENV ddclient_VERSION 3.9.1
# ENV PERL_MM_USE_DEFAULT 1

# --- Add the required packages for ddclient to function
# RUN apk update && \
#		apk add wget unzip make perl perl-utils perl-test-taint perl-netaddr-ip perl-net-ip perl-yaml perl-log-log4perl perl-io-socket-ssl nano
# RUN cpan Data::Validate::IP

RUN apk update && \
	apk add curl

CMD curl -m 30 -s --user "$OpenDNS_Username:$OpenDNS_Password" "https://@updates.opendns.com/nic/update?hostname=$OpenDNS_Net_Label" &>/dev/null


# --- Download & Unpack the defined version of ddclient for GitHub
# RUN wget https://github.com/ddclient/ddclient/archive/v$ddclient_VERSION.zip -O /tmp/ddclient-$ddclient_VERSION.zip
# RUN unzip /tmp/ddclient-$ddclient_VERSION.zip -d /tmp


# --- Setup the installation and initalise ddclient
# RUN cp /tmp/ddclient-$ddclient_VERSION/ddclient /usr/bin
# RUN mkdir /etc/ddclient && \
# 	mkdir /var/cache/ddclient
# COPY ddclient.conf /etc/ddclient/ddclient.conf
# RUN cp /tmp/ddclient-$ddclient_VERSION/sample-etc_rc.d_init.d_ddclient.alpine /etc/init.d/ddclient

# --- Add user definitions to configuration file
# COPY entrypoint.sh /entrypoint.sh
# RUN chmod +x /entrypoint.sh

# --- start ddclient
# ENTRYPOINT ["/entrypoint.sh"]
# CMD ["ddclient", "-daemon=600", "-verbose"]