curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
apt install -y nodejs

npm i -g yarn # Install Yarn

cd /var/www/pterodactyl
yarn # Installs panel build dependencies

cd /var/www/pterodactyl
export NODE_OPTIONS=--openssl-legacy-provider # for NodeJS v17+
yarn build:production # Build panel

echo "Panel Rebuilt"
