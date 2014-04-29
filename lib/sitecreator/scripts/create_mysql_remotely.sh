#! /bin/bash

if [ -z $REMOTE_HOST ]; then
	print "ERROR: No remote host set (use 'remote_host' env variable"
	exit 1;
fi

ssh $REMOTE_HOST "lib/sitecreator/scripts/create_mysql.sh $@"
