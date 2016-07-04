FROM vm-registry.sandbox.lan/bit/debian:jessie

RUN apt-get clean \
  && apt-get -y update \
  && apt-get install -y curl \
  && rm -rf /var/lib/apt/lists/*

RUN echo 'deb http://reposrv.loc.lan/repository/debian/deb.nodesource.com/node_6.x jessie main' > /etc/apt/sources.list.d/nodejs_6x.list

RUN curl http://reposrv.loc.lan/repository/debian/keys/nodesource.gpg.key | apt-key add -

RUN apt-get clean \
  && apt-get -y update \
  && apt-get install -y nodejs \
  && rm -rf /var/lib/apt/lists/*

COPY server.js /opt/server.js

EXPOSE 3000

CMD ["/usr/bin/nodejs", "/opt/server.js"]