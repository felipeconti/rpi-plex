FROM resin/rpi-raspbian

VOLUME ["/config", "/data"]

ENV HOME=/config

EXPOSE 32400

ENV TERM=xterm

ADD installPackages.sh /installPackages.sh
RUN /installPackages.sh

ADD start.sh /start.sh

CMD ["bash", "start.sh"]
