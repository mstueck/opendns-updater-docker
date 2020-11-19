#!/bin/sh

currentPubIP=$(curl -s https://diagnostics.opendns.com/myip)
previousPubIP=$currentPubIP

echo $currentPubIP &>/dev/stdout

curl --user "$OpenDNS_Username:$OpenDNS_Password" "https://@updates.opendns.com/nic/update?hostname=$OpenDNS_Net_Label" &>/dev/stdout

exec "$@"
