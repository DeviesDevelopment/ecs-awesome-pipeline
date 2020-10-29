FROM ubuntu:18.04

RUN apt-get update && \
    apt-get -y install apache2

COPY index.html /var/www/html/index.html
COPY run.sh /run.sh

# Configure apache
RUN echo '. /etc/apache2/envvars' > /root/run_apache.sh && \
    echo 'mkdir -p /var/run/apache2' >> /root/run_apache.sh && \
    echo 'mkdir -p /var/lock/apache2' >> /root/run_apache.sh && \ 
    echo '/usr/sbin/apache2 -D FOREGROUND' >> /root/run_apache.sh && \ 
    chmod 755 /root/run_apache.sh

EXPOSE 80

CMD /run.sh
