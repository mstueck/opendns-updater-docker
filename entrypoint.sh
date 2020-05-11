#!/bin/sh

set -e

sed -i 's|#OPENDNSUSERNAME|$OpenDNS_Username|g' /etc/ddclient/ddclient.conf && /
	sed -i 's|#OPENDNSPASSWORD|$OpenDNS_Password|g' /etc/ddclient/ddclient.conf && /
	sed -i 's|#OPENDNSNETWORKLABEL|$OpenDNS_Net-Label|g' /etc/ddclient/ddclient.conf

ddclient -daemon 600 -verbose

exec "$@"
