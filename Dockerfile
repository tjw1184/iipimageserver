## Started from ubuntu\latest (bionic 18.04 at time)

FROM krallin/ubuntu-tini:bionic

## update everything, install iipimage-server and cleanup
RUN apt-get -y update && \
    apt-get install -y --fix-missing apache2 libapache2-mod-fcgid nano && \
    apt-get install -y --fix-missing iipimage-server && \
    apt-get clean && \
    rm -rf /tmp/* /var/tmp/*

## copy startup script and set permissions
COPY startup.sh /usr/local/bin/startup.sh
RUN chmod +x /usr/local/bin/startup.sh

## copy iipzoom files to container
RUN mkdir /var/www/html/iipzoom
COPY iipzoom/* /var/www/html/iipzoom/

## setup iipmooviewer
RUN mkdir /var/www/html/iipmooviewer
RUN git clone https://github.com/ruven/iipmooviewer.git /var/www/html/iipmooviewer

## document ports and volumes to be remapped
EXPOSE 80
VOLUME /pics

## execute our startup script
ENTRYPOINT ["/usr/local/bin/tini", "--", "/usr/local/bin/startup.sh"]
