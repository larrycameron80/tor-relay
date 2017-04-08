# tor-relay
Simple Tor Relay in a Docker Container

Based off Jessie Frazelle's blog
- https://blog.jessfraz.com/post/running-a-tor-relay-with-docker/

# Use
Ths container is brought up using [docker-compose](https://docs.docker.com/compose/).

Edit `torrc.bridge` or `torrc.middle` to include your nickname and contact info.

Build container using `docker-compose`

```
docker-compose build
```

Update the `docker-compose.yml` `command` to use either the `torrc.bridge` or `torrc.middle` config depending on the type of relay to use.

To run a middle relay
- `command: -f /etc/tor/torrc.middle`

To run a bridge relay
- `command: -f /etc/tor/torrc.bridge`

Bring up the container

```
docker-compose up
```
