#!/bin/bash

# SYNOPSIS
#    iptables 
#    iptables ip port

# DESCRIPTION
#   This script is to restrict a host to sending data noly to a specified host.
#   This script has two types. 
#   Use 'iptables.sh ip port' to config special ip and port.
#   Argument ip is the special host's ip.
#   Argument port is to ssh connect. This script use "iptables -P OUTPUT DROP" 
#   make server can't send data. So, we filst have to open a port for ssh.

#   Use 'iptables.sh' to clear config.

# $1 ip
# $2 port

if [ $# == 0 ]
then
    iptables -P OUTPUT ACCEPT
    iptables -F
    iptables -X
elif [ $# == 2 ]
then
    iptables -F
    iptables -X

    iptables -A OUTPUT -p tcp --sport $2 -m state --state ESTABLISHED -j ACCEPT
    iptables -P OUTPUT DROP
    iptables -A OUTPUT -d $1 -j ACCEPT
else
    echo $0 web_ip ssh_port
fi
