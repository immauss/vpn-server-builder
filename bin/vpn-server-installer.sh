#!/bin/bash
# vpn server setup
#
# Need to insert a bit here about checking the hostname ... 

# install some software

echo "installing required packages"
yum install -y ipa-server openvpn-auth-ldap ipa-server-dns tmux fail2ban easy-rsa vim git 

# get fail2ban running right away
# This probably needs more configuration base on recent Xp
systtemctl start fail2ban --now

# setup the ipa-server ...
# This part will likely be interactive

ipa-server-install --setup-dns


