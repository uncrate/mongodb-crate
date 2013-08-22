name             'mongodb-crate'
maintainer       'John Leacox'
license          'Apache 2.0'
description      'Installs/Configures mongodb'
version          '0.1.0'

%w{
  ubuntu
  centos
  redhat
}.each do |os|
  supports os
end

depends 'uncrate_base'
