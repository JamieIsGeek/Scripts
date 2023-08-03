#!/bin/bash

# Put panel in maintenance
cd /var/www/pterodactyl
php artisan down

# Download Update
curl -L https://github.com/pterodactyl/panel/releases/latest/download/panel.tar.gz | tar -xzv
chmod -R 755 storage/* bootstrap/cache

# Update Dependencies
composer install --no-dev --optimize-autoloader

# Clear Compiled Template Data
php artisan view:clear
php artisan config:clear

# Database Updates
php artisan migrate --seed --force

# Set Permissions
chown -R www-data:www-data /var/www/pterodactyl/*

# Restart queue workers
php artisan queue:restart

# Take panel out of maintenance
php artisan up

echo "Panel Updated and Online"
