#!/bin/sh
# Cloud init script for Amazon AMI

# Install ruby necessary libs
apt-get update
apt-get install -y ruby ruby-dev libopenssl-ruby rdoc ri irb build-essential wget ssl-cert curl

export PATH=$PATH:/usr/local/bin

if [ -f `which gem` ]
then
  echo 'Rubygems installed'
else
  echo 'Install rubygems'
  mkdir ~/tmp
  cd ~/tmp
  rm -rf rubygems*
  wget http://production.cf.rubygems.org/rubygems/rubygems-1.8.12.tgz
  tar -xzf rubygems-1.8.12.tgz
  cd rubygems*
  ruby setup.rb
  cd ~
  rm -rf ~/tmp
fi

if [ -f `which chef-solo` ]
then
  echo 'Chef installed'
else
  echo 'Install chef'
  gem install chef --no-rdoc --no-ri
fi

#echo 'Clone original formula'
#git clone git@github.com:Shopximity/internal-chef.git
#cd internal-chef

echo 'Start chef-solo:'
cd `dirname $0`
chef-solo -c solo.rb
