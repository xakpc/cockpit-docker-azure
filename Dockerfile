FROM agentejo/cockpit
LABEL maintainer="Pavel Osadchuk <me@xakpc.info>"

ENV SSH_PORT 2222
ENV COCKPIT_STORAGE_FOLDER /home/cockpit/storage
ENV COCKPIT_CONFIG_DIR /home/cockpit/config

RUN mkdir /home/cockpit \
  && mkdir /home/cockpit/storage \
  && mkdir /home/cockpit/config \
  && mv /var/www/html/storage/* /home/cockpit/storage/

COPY sshd_config /etc/ssh/

RUN echo "root:Docker!" | chpasswd \

COPY ssh_setup.sh /tmp
RUN chmod -R +x /tmp/ssh_setup.sh \
   && (sleep 1;/tmp/ssh_setup.sh 2>&1 > /dev/null) \
   && rm -rf /tmp/*
   
EXPOSE 2222 8080
