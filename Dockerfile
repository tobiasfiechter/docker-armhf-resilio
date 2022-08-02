FROM balenalib/armv7hf-debian

RUN [ "cross-build-start" ]

# - RESILIO SYNC - #

ENV RESILIO_VERSION=2.7.3.1381
ENV RESILIO_URL=https://download-cdn.resilio.com/${RESILIO_VERSION}/Debian/resilio-sync_${RESILIO_VERSION}-1_armhf.deb

ADD ${RESILIO_URL} /tmp/sync.deb

RUN dpkg -i /tmp/sync.deb && rm -f /tmp/sync.deb

COPY sync.conf.default /etc/
COPY run_sync /usr/bin/

RUN chmod +x /usr/bin/run_sync

EXPOSE 8888
EXPOSE 55555

VOLUME /mnt/sync

ENTRYPOINT ["run_sync"]
CMD ["--config", "/mnt/sync/sync.conf"]

RUN [ "cross-build-end" ]
