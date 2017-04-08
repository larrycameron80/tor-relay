# tor-relay
Simple Tor Relay in a Docker Container

Based off Jessie Frazelle's blog
- https://blog.jessfraz.com/post/running-a-tor-relay-with-docker/

# Use
Ths container is brought up using [docker-compose](https://docs.docker.com/compose/).

## Build
Edit `torrc.bridge` or `torrc.middle` to include your nickname and contact info.

Build container using `docker-compose`

```
docker-compose build
```

## Configuration
Update the `docker-compose.yml` `command` to use either the `torrc.bridge` or `torrc.middle` config depending on the type of relay to use.

To run a middle relay
- `command: -f /etc/tor/torrc.middle`

To run a bridge relay
- `command: -f /etc/tor/torrc.bridge`

## Keys
This container bind mounts a local dir `/.keys`/ to the containers `/var/lib/tor/.tor/keys` dir in order to keep the same keys. Make sure that local permssions on `/.keys/` is set to UID `100` (the UID of the `tor` user within the container) in order to avoid permission errors.

## Bring up the container

```
docker-compose up
```
