#! /bin/bash

USERNAME=$1
PASSWORD=$2

/user/sbin/useradd -s /bin/bash -m $USERNAME
echo $USERNAME:$PASSWORD | /usr/sbin/chpasswd