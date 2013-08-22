return if skip_unsupported_platform

case node['platform']
when "ubuntu"
  # add the mongodb PPA
  apt_repository "mongodb" do
    uri "http://downloads-distro.mongodb.org/repo/ubuntu-upstart"
    components ["dist", "10gen"]
    keyserver "keyserver.ubuntu.com"
    key "7F0CEB10"
  end

  package "mongodb" do
    package_name node['mongodb']['package']
  end

  service "mongodb" do
    service_name "mongodb"
    restart_command "service mongodb restart"
    supports [:restart, :status]
    action [:enable, :start]
  end
when "centos", "redhat"
  yum_repository "mongodb" do
    repo_name "10gen Repository"
    url "http://downloads-distro.mongodb.org/repo/redhat/os/x86_64"
    action :add
  end

  package "mongodb" do
    package_name node['mongodb']['package']
  end

  package "mongodb-server" do
    package_name "mongo-10gen-server"
  end

  service "mongodb" do
    service_name "mongodb"
    restart_command "service mongodb restart"
    supports [:restart, :status]
    action [:enable, :start]
  end
end