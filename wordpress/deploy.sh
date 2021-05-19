#!/bin/bash 

#Creating directories
mkdir -p data/db
mkdir -p data/wordpress

if [[ -z $HOST_DOMAIN ]]; then
	HOST_DOMAIN=localhost
fi

if [[ -z $EMAIL_DOMAIN ]]; then
	EMAIL_DOMAIN=mail@example.com
fi

if [[ -z $WP_DB_PASS ]]; then
	WP_DB_PASS=mywppass
fi

#Check if .env file exists and delete previous generated 
if [[ -f ".env" ]]; then
	sed -i '/HOST_DOMAIN=/d' .env
	sed -i '/EMAIL_DOMAIN=/d' .env
	sed -i '/WP_DB_PASS=/d' .env
fi

echo "HOST_DOMAIN=${HOST_DOMAIN}" >> .env
echo "EMAIL_DOMAIN=${EMAIL_DOMAIN}" >> .env
echo "WP_DB_PASS=${WP_DB_PASS}" >> .env

docker-compose up -d 
