#!/bin/bash
#
# script to setup CA and install certs/keys needed for openvpn server 
#
yum -y install easy-rsa

mkdir -p /etc/openvpn/easyrsa 
cp -rp  /usr/share/easy-rsa/3.0.3/* /etc/openvpn/easyrsa/
cd /etc/openvpn/easyrsa 
./easyrsa init-pki
./easyrsa build-ca
./easyrsa build-server-full vpn-server
./easyrsa gen-dh
