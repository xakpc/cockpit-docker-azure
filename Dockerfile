FROM agentejo/cockpit
LABEL maintainer="Pavel Osadchuk <me@xakpc.info>"

ENV SSH_PORT 2222
#ENV COCKPIT_STORAGE_FOLDER /home/cockpit/storage
#ENV COCKPIT_CONFIG_DIR /home/cockpit/config

COPY init_container.sh /bin/

#COPY src/defines.php /var/www/html/
#RUN chown -R www-data:www-data /var/www/html/
#RUN mkdir /home/cockpit \
#  && mkdir /home/cockpit/storage \  
#  && mkdir /home/cockpit/config \
#  && mv /var/www/html/storage/* /home/cockpit/storage/  

RUN apt-get -y install openssh-server \
     && echo "root:Docker!" | chpasswd 

COPY sshd_config /etc/ssh/
#COPY ssh_setup.sh /home
#RUN /home/ssh_setup.sh
#RUN mkdir -p /opt/startup \
#   && chmod -R +x /opt/startup \
#   && chmod -R +x /home/ssh_setup.sh \
#   && (sleep 1;/home/ssh_setup.sh 2>&1 > /dev/null) \
#   && rm -rf /tmp/*

EXPOSE 2222 80

#RUN   \
#   rm -f /var/log/apache2/* \
#   && chmod 777 /bin/init_container.sh \
#   && rm -rf /var/log/apache2 \
#   && mkdir -p /home/LogFiles \
#   && ln -s /home/LogFiles /var/log/apache2 

ENTRYPOINT ["/bin/init_container.sh"]