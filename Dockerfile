## Started from ubuntu\latest (bionic 18.04 at time)

FROM krallin/ubuntu-tini:bionic

## update everything, install iipimage-server and cleanup
RUN apt-get -y update && \
    apt-get install -y --fix-missing \
    iipimage-server \
&& apt-get clean && rm -rf /tmp/* /var/tmp/*

COPY startup.sh /usr/local/bin/startup.sh
RUN chmod +x /usr/local/bin/startup.sh

EXPOSE 80
VOLUME /var/www/html
VOLUME /pics

## restart the apache2 web service to ensure it comes up correcly
##CMD service apache2 restart
ENTRYPOINT ["/usr/local/bin/tini", "--", "/bin/bash"]
