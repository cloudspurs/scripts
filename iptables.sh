#!/bin/bash
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
