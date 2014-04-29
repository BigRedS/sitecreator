#! /bin/bash

USERNAME=$1
PASSWORD=$2
HOST=$3


/usr/sbin/useradd -s /bin/bash -m '$USERNAME'
echo '$USERNAME:$PASSWORD' | /usr/sbin/chpasswd


if [ ! -z $HOST ]; then
	ssh $HOST "/usr/sbin/useradd -s /bin/bash -m '$USERNAME'"
	ssh $HOST "echo '$USERNAME:$PASSWORD' | /usr/sbin/chpasswd"
fi
