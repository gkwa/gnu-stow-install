#!/bin/sh

if yum --version >/dev/null 2>&1
then
	yum install -y curl make
else
	apt-get -y -qq update
	apt-get -y -qq install curl make
fi

stowver=2.1.3

mkdir -p /usr/local/src
cd /usr/local/src
curl -O http://ftp.gnu.org/gnu/stow/stow-$stowver.tar.gz
tar xvf stow-$stowver.tar.gz
cd stow-$stowver
mkdir -p /usr/local/stow
./configure --prefix=/usr/local/stow/stow-$stowver
make install

cd /usr/local/stow
stow stow-$stowver
