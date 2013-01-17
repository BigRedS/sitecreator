#! /bin/bash;

DOMAIN=$1
PASSWORD=$2
pfa_adddomain $DOMAIN
pfa_adduser admin@$DOMAIN -p $PASSWORD
