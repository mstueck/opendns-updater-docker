#!/bin/sh

currentPubIP=$(curl -s https://diagnostic.opendns.com/myip)
previousPubIP=$currentPubIP

echo $currentPubIP 1>/dev/stdout

crontab -l > /tmp/CronJobs
echo "*/10 * * * * curl --user "$OpenDNS_Username:$OpenDNS_Password" "https://updates.opendns.com/nic/update?hostname=$OpenDNS_Net_Label"" >> /tmp/CronJobs
crontab /tmp/CronJobs

# curl --user "$OpenDNS_Username:$OpenDNS_Password" "https://updates.opendns.com/nic/update?hostname=$OpenDNS_Net_Label" 1>/dev/stdout

exec "$@"