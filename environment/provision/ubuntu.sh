#!/bin/bash

set -e
echo '*** Setup Ubuntu box'

echo ' ** Running apt-get update to be cutting-edge'
sudo apt-get update

echo ' ** Installing core stuff'
sudo apt-get install -y unzip
sudo apt-get install -y git-core

echo ' ** Fixing colors'
sed -i 's/#force_color_prompt=yes/force_color_prompt=yes/g' /home/vagrant/.bashrc

echo '*** /Finished setting up Ubuntu box'
