name 'symfony-parameters'
license 'MIT Licence'
description      'Symfony Parameters'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '3.0.1'

maintainer 'Gavin Staniforth'
maintainer_email 'gavin@usemarkup.com'

supports 'centos'

chef_version '>= 12.6' if respond_to?(:chef_version)
