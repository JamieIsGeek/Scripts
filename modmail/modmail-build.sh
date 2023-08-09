#!/bin/bash

echo "Beginning creation"

# Make bot folder with files
mkdir modmail
cd modmail
touch .env
wget https://raw.githubusercontent.com/modmail-dev/modmail/master/docker-compose.yml

# Gather env information
read -p "Enter bot token: " token
read -p "Enter log viewer URL: " log_url
read -p "Enter your Guild ID: " guild_id
read -p "Enter the Modmail Guild ID: " mm_id
read -p "Enter the Owner IDs (Separated by commas): " owner_id
read -p "Enter your MongoDB connection URI: " connection_uri

# Set values in .env
echo "TOKEN:$token" >> .env
echo "LOG_URL:$log_url" >> .env
echo "GUILD_ID:$guild_id" >> .env
echo "MODMAIL_GUILD_ID:$mm_id" >> .env
echo "OWNERS:$owner_id" >> .env
echo "CONNECTION_URI:$connection_uri" >> .env

# Start the bot
docker compose up -d

echo "Docker container started"
