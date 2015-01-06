#!/bin/bash

set -e
echo '*** Setup Google Cloud SDK'

echo ' ** Installing python packages'
sudo apt-get install -y python-dev
sudo apt-get install -y python-setuptools python-pip
sudo apt-get install -y python-software-properties python g++ make
sudo apt-get build-dep -y python-imaging
sudo apt-get install libjpeg8 libjpeg62-dev libfreetype6 libfreetype6-dev
sudo pip install jinja2
sudo pip install Pillow

# Make the helper binaries executable and globally available
echo ' ** Setup support CLI commands'
echo 'export PATH=/vagrant/environment/utils:\$PATH' >> /home/vagrant/.profile
cd /vagrant/environment/utils
chmod +x app-server
chmod +x app-deploy

# Download Cloud SDK
echo ' ** Setup Google Cloud SDK command-line tools'
echo '  * Downloading Cloud SDK'
cd /home/vagrant
wget -q https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz
tar xzvpf google-cloud-sdk.tar.gz
rm google-cloud-sdk.tar.gz

# Silent install Cloud SDK
echo '  * Installing Cloud SDK'
./google-cloud-sdk/install.sh --rc-path=/home/vagrant/.profile --bash-completion=true --path-update=true --disable-installation-options

# Install GAE language packages
./google-cloud-sdk/bin/gcloud components update pkg-go pkg-python
# Install GAE new preview feature (dev_appserver 2)
./google-cloud-sdk/bin/gcloud components update app -q

sudo chown vagrant:vagrant -R google-cloud-sdk/

echo '*** /Finished setting up Cloud SDK'
