FROM balenalib/armv7hf-debian

RUN [ "cross-build-start" ]

# - RESILIO SYNC - #

ENV RESILIO_URL=https://download-cdn.resilio.com/stable/linux-armhf/resilio-sync_armhf.tar.gz

ADD ${RESILIO_URL} /tmp/sync.tgz

RUN tar -xf /tmp/sync.tgz -C /usr/bin rslsync && rm -f /tmp/sync.tgz

COPY sync.conf.default /etc/
COPY run_sync /usr/bin/

RUN chmod +x /usr/bin/run_sync

EXPOSE 8888
EXPOSE 55555

VOLUME /mnt/sync

ENTRYPOINT ["run_sync"]
CMD ["--config", "/mnt/sync/sync.conf"]

RUN [ "cross-build-end" ]
