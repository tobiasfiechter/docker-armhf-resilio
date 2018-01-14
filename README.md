![alt text](https://dockerbuildbadges.quelltext.eu/status.svg?organization=cyberto&repository=docker-armhf-resilio "Dockerhub")

Resilio Sync Docker image for the Raspberry Pi with Resins cross build!
---

### pull & RUN

```bash
docker pull cyberto/docker-armhf-resilio
```

```bash
mkdir -p $HOME/sync/share &&
docker run -d --name Sync \
  -p 8888:8888 -p 55555 \
  -v $HOME/sync/share:/mnt/sync \
  --restart on-failure \
  cyberto/docker-armhf-resilio
```

then visit http://raspberrypi.local:8888 (on Windows without Zeroconf replace `raspberrypi.local` with your hostname) to setup
