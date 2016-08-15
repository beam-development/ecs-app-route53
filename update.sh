#!bin/bash

# AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, ZONE & RECORD should be environment variables

URL='http://169.254.169.254/latest/meta-data/local-ipv4'
MYIP=`curl -s $URL`

if [[ $MYIP =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then  
  cli53 rrcreate --replace $ZONE "$RECORD A $MYIP"
else
  echo "Invalid IP returned from: $URL"
fi
