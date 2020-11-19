#!/bin/sh

set -e

curl --user "$OpenDNS_Username:$OpenDNS_Password" "https://@updates.opendns.com/nic/update?hostname=$OpenDNS_Net_Label" &>/dev/null

exec "$@"
