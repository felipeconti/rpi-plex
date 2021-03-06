FROM balenalib/raspberrypi3

VOLUME ["/config", "/data"]

ENV HOME=/config

EXPOSE 32400

ARG VERSION=1.19.1.2630-72c16a276
ENV FILE=plexmediaserver_${VERSION}_armhf.deb

RUN curl -SsLO https://downloads.plex.tv/plex-media-server-new/${VERSION}/debian/${FILE} && \
    dpkg -i ${FILE} && \
    rm -f ${FILE}

ADD start.sh /start.sh

CMD ["bash", "start.sh"]
