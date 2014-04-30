#!/bin/sh

puppet module install jfryman/nginx
# Problem with recent PHP versions, getting it from git
# puppet module install nodes/php
apt-get install -y git
git clone https://github.com/jippi/puppet-php.git /etc/puppet/modules/php
puppet module install puppetlabs-mysql
