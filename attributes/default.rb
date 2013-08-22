case platform
when "ubuntu"
  default['mongodb']['package'] = "mongodb-10gen"
when "centos", "redhat", "fedora"
  default['mongodb']['package'] = "mongo-10gen"
end