maintainer        "Vladislav Mikhaylov"
maintainer_email  "vladislav.mikhailov@gdev.biz"
license           "Apache 2.0"
description       "Updates sshd_config makind sshd listen on different port"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "0.7.0"
recipe            "ssh_port_rebase", "Updates sshd config with generated from template"
recipe		  "ssh_port_rebase::ssh_upgrade","upgrades ssh-server"
%w{ centos redhat fedora amazon debian ubuntu }.each do |os|
    supports os
end