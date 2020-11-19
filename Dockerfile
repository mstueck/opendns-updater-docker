FROM alpine:latest

# --- define Docker Environment Variables
ENV previousPubIP "0.0.0.0"
ENV OpenDNS_Username ""
ENV OpenDNS_Password ""
ENV OpenDNS_Net_Label ""

# --- Add the required packages for ddclient to function
RUN apk update && \
	apk add curl

# --- Add user definitions to configuration file
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# --- start ddclient
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/bin/sh"]