name             'passenger_nginx'
maintainer       'Gabriel Mazetto'
maintainer_email 'brodock@gmail.com'
license          'MIT'
description      'Install passenger as a nginx module from apt repository'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.2'

supports 'ubuntu'
supports 'debian'

depends 'apt'
