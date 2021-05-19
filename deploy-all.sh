#!/bin/bash

BASEDIR=$PWD
echo "$BASEDIR directory"
#Check enviroment variables required
if [[ -z $HOST_DOMAIN ]]; then
	echo "Using default HOST_DOMAIN"
	HOST_DOMAIN=localhost
fi

if [[ -z $EMAIL_DOMAIN ]]; then
	echo "Using default EMAIL_DOMAIN"
	EMAIL_DOMAIN=mail@example.com
fi

if [[ -z $WP_DB_PASS ]]; then
	echo "Using default WP_DB_PASS"
	WP_DB_PASS=mywppass
fi

if [[ -z $NEXT_DB_PASS ]]; then
	echo "Using default NEXT_DB_PASS"
	NEXT_DB_PASS=mynextpass
fi

export HOST_DOMAIN=$HOST_DOMAIN
export EMAIL_DOMAIN=$EMAIL_DOMAIN
export WP_DB_PASS=$WP_DB_PASS
export NEXT_DB_PASS=$NEXT_DB_PASS
export WITH_NGINX=$WITH_NGINX

#Create docker-network
echo "Creating docker network..."
./create-network.sh

#Nginx-proxy
echo "Nginx-proxy deployment..."
cd nginx-proxy
./deploy.sh

cd $BASEDIR
#Worpress
echo "Worpress deployment..."
cd wordpress
./deploy.sh

cd $BASEDIR
#Thingsboard
echo "Nextcloud deployment..."
cd nextcloud
./deploy.sh

echo "Deployment has finished"
