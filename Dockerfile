FROM alpine:latest
MAINTAINER Micheal Waltz <ecliptik@gmail.com>

RUN apk --no-cache add tor

# default port to used for incoming Tor connections
EXPOSE 9001

# copyconfigs
COPY torrc.bridge /etc/tor/torrc.bridge
COPY torrc.middle /etc/tor/torrc.middle

# Make tor keys dir for volume mount
RUN mkdir -p /var/lib/tor/.tor/keys

# make sure files are owned by tor user
RUN chown -R tor /etc/tor /var/lib/tor/

# Run as user tor
USER tor

ENTRYPOINT [ "tor" ]
