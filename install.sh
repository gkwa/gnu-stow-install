#!/bin/sh

if yum >/dev/null 2>&1
then
	# stow relies on perl's Test::Output, so fetch with cpan, but amazon
	# awi doesn't provide cpan
	yum -y install perl-CPAN
fi

stowver=2.1.3

mkdir -p /usr/local/src
cd /usr/local/src
curl -O http://ftp.gnu.org/gnu/stow/stow-$stowver.tar.gz
tar xvf stow-$stowver.tar.gz
cd stow-$stowver
PERL_MM_USE_DEFAULT=1 perl -MCPAN -e 'CPAN::install "Test::Output";'
./configure
make install
