## Started from ubuntu\latest (bionic 18.04 at time)

FROM krallin/ubuntu-tini:bionic

## update everything, install iipimage-server and cleanup
RUN apt-get -y update && \
    apt-get install -y --fix-missing apache2 libapache2-mod-fcgid git unzip nano && \
    apt-get install -y --fix-missing iipimage-server && \
    apt-get clean && \
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

## setup iipmooviewer - will download latest, there are no tags on this project
RUN mkdir /var/www/html/iipmooviewer
RUN git clone https://github.com/ruven/iipmooviewer.git /var/www/html/iipmooviewer

## setup open seadragon - currently set to release 2.4.0
RUN mkdir /var/www/html/openseadragon
ADD https://github.com/openseadragon/openseadragon/releases/download/v2.4.0/openseadragon-bin-2.4.0.zip /var/www/html/openseadragon/openseadragon.zip
RUN unzip /var/www/html/openseadragon/openseadragon.zip -d /var/www/html/openseadragon
RUN rm -f /var/www/html/openseadragon/openseadragon.zip

## document ports and volumes to be remapped
EXPOSE 80
VOLUME /pics

## execute our startup script
ENTRYPOINT ["/usr/local/bin/tini", "--", "/usr/local/bin/startup.sh"]
