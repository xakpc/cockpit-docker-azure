#!/bin/sh
echo "ssh_host_rsa_key"
if [ ! -f "/etc/ssh/ssh_host_rsa_key" ]; then
  # generate fresh rsa key
  ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa
  echo "done"
fi

if [ ! -f "/etc/ssh/ssh_host_dsa_key" ]; then
  # generate fresh dsa key
  ssh-keygen -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa
  echo "done"
fi

if [ ! -f "/etc/ssh/ssh_host_ecdsa_key" ]; then
  # generate fresh ecdsa key
  ssh-keygen -f /etc/ssh/ssh_host_ecdsa_key -N '' -t dsa
  echo "done"
fi

if [ ! -f "/etc/ssh/ssh_host_ed25519_key" ]; then
  # generate fresh ecdsa key
  ssh-keygen -f /etc/ssh/ssh_host_ed25519_key -N '' -t dsa
  vecho "done"
fi

#prepare run dir
if [ ! -d "/var/run/sshd" ]; then
  mkdir -p /var/run/sshd
  echo "done"
fi
