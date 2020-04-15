#!/bin/bash
# vpn server setup
#
# Need to insert a bit here about checking the hostname ... 
NAME=$(hostname -s)
if [ $NAME = "localhost" ]; then
	echo "What hostname will we use? (node1)"
	read name
	echo "What hostname will we use ? Recomend vpn.<your domain>"
	echo "You can not use just your domain. You will need to add an NS record for the"
	echo "new subdmain in your current dns"
	read domain
	echo "Setting hostname to $name.$domain"
	hostnamectl set-hostname "$name.$domain"
fi
#Check IP and hostname match
DNSIP=$(dig $name.$domain +short)
REALIP=$(

# install some software

echo "installing required packages"
yum install -y ipa-server openvpn-auth-ldap ipa-server-dns tmux fail2ban easy-rsa vim git 

# get fail2ban running right away
# This probably needs more configuration base on recent Xp
systemctl enable fail2ban --now

# setup the ipa-server ...
# This part will likely be interactive

ipa-server-install --setup-dns

# Enable ports for ip server
for service in https ldap ldaps dns kerberos ntp; do
	firewall-cmd --add-service $service --permanent
done
firewall-cmd --reload
