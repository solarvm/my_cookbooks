maintainer        "Vladislav Mikhaylov"
maintainer_email  "vladislav.mikhailov@gdev.biz"
license           "Apache 2.0"
description       "Installs latest Git client"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "0.7.0"
depends		  "gitdepend"
recipe            "git", "Installs latest Git client"
%w{ debian ubuntu centos redhat fedora amazon }.each do |os|
    supports os
end