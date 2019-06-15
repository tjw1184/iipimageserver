## Started from ubuntu\latest (bionic 18.04 at time)

FROM ubuntu:18.04

## update everything, install iipimage-server and cleanup
RUN apt-get -y update && \
    apt-get install -y --fix-missing \
    iipimage-server \
&& apt-get clean && rm -rf /tmp/* /var/tmp/*

## restart the apache2 web service to ensure it comes up correcly
CMD service apache2 restart
