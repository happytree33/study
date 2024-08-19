#!/bin/sh
PROFILE=/home/search/prosearch/dbcrawler/batch/setenv.sh

if [ -f $PROFILE ]; then
	. $PROFILE
	echo "set global environment: $PROFILE"
	echo
else
	echo "no such global environment: $PROFILE"
	exit 1
fi

$DBCRAWLER_HOME/batch/dbcrawler.sh mail dyn

find /data/prosearch/dbcrawler/json/mail/backup -name "*.json" -mtime +3 -delete
