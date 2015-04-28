name             'example5'
maintainer       'Tristan Gonzalez'
maintainer_email 'learnchef@getchef.com'
license          'Apache 2.0'
description      'Installs ntp and configures it.'
long_description 'Installs ntp and configures it.'
supports         'ubuntu'
version          '0.1.0'

depends "apt"
depends "yum-epel"
depends "mysql", "~> 6.0"
