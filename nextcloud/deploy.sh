#!/bin/bash 

#Creating directories
mkdir -p data/db
mkdir -p data/nextcloud

if [[ -z $HOST_DOMAIN ]]; then
	HOST_DOMAIN=localhost
fi

if [[ -z $EMAIL_DOMAIN ]]; then
	EMAIL_DOMAIN=mail@example.com
fi

if [[ -z $NEXT_DB_PASS ]]; then
	NEXT_DB_PASS=mynextpass
fi

#Check if .env file exists and delete previous generated 
if [[ -f ".env" ]]; then
	sed -i '/HOST_DOMAIN=/d' .env
	sed -i '/EMAIL_DOMAIN=/d' .env
	sed -i '/NEXT_DB_PASS=/d' .env
fi

echo "HOST_DOMAIN=${HOST_DOMAIN}" >> .env
echo "EMAIL_DOMAIN=${EMAIL_DOMAIN}" >> .env
echo "NEXT_DB_PASS=${NEXT_DB_PASS}" >> .env

docker-compose up -d 
