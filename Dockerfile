## Use bionic ubuntu (18.04) with tini for running
FROM krallin/ubuntu-tini:bionic

# Docker metadata
ARG BUILD_DATE
ARG VCS_REF
ARG VERSION
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="IIPImageServer" \
      org.label-schema.maintainer="tjw1184" \      
      org.label-schema.description="Preconfigured IIPImage Server with Display Clients OpenSeaDragon, IIPZoom and IIPMooViewer" \
      org.label-schema.url="https://github.com/tjw1184/iipimageserver" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/tjw1184/iipimageserver" \
      org.label-schema.vendor="tjw1184" \
      org.label-schema.version=$VERSION \
      org.label-schema.schema-version="1.0"

## update everything, install iipimage-server and cleanup
## need to add debian frontend noninteractive otherwise tzdata package will hang waiting for input
RUN DEBIAN_FRONTEND=noninteractive apt-get -y update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --fix-missing apache2 libapache2-mod-fcgid git php nano && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --fix-missing iipimage-server && \
    DEBIAN_FRONTEND=noninteractive apt-get clean && \
    rm -rf /tmp/* /var/tmp/*

## copy startup script and set permissions
COPY startup.sh /usr/local/bin/startup.sh
RUN chmod +x /usr/local/bin/startup.sh

## override default iipsrv.conf file
COPY iipsrv.conf /etc/apache2/mods-available/iipsrv.conf
RUN chown root:root /etc/apache2/mods-available/iipsrv.conf
RUN chmod 644 /etc/apache2/mods-available/iipsrv.conf

## copy iipzoom files to container - use 0.2 release from our repo, this is last release of EOL project
RUN mkdir /var/www/html/iipzoom
COPY iipzoom/* /var/www/html/iipzoom/

## setup iipmooviewer - will download latest, there are no tags on this project so may break in future
RUN mkdir /var/www/html/iipmooviewer
RUN git clone https://github.com/ruven/iipmooviewer.git /var/www/html/iipmooviewer

## setup open seadragon - currently set to release 3.0.0
RUN mkdir /var/www/html/openseadragon
ADD https://github.com/openseadragon/openseadragon/releases/download/v3.0.0/openseadragon-bin-3.0.0.tar.gz /var/www/html/openseadragon/openseadragon.tar.gz
RUN tar -xvf /var/www/html/openseadragon/openseadragon.tar.gz -C /var/www/html/openseadragon --strip 1
RUN rm -f /var/www/html/openseadragon/openseadragon.tar.gz

## setup iipzoom php scripts
COPY webfiles/iipzoom.php /var/www/html/iipzoom/iipzoom.php
COPY webfiles/iipzoom_redirect.php /var/www/html/iipzoom.php

## setup iipmooviewer php scripts
COPY webfiles/iipmooviewer.php /var/www/html/iipmooviewer/iipmooviewer.php
COPY webfiles/iipmooviewer_redirect.php /var/www/html/iipmooviewer.php

## setup openseadragon php scripts
COPY webfiles/openseadragon.php /var/www/html/openseadragon/openseadragon.php
COPY webfiles/openseadragon_redirect.php /var/www/html/openseadragon.php

## document ports and volumes to be remapped
EXPOSE 80
VOLUME /pics

## execute our startup script
ENTRYPOINT ["/usr/local/bin/tini", "--", "/usr/local/bin/startup.sh"]
