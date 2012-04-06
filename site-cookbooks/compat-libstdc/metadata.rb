maintainer        "Vladislav Mikhaylov"
maintainer_email  "vladislav.mikhailov@gdev.biz"
license           "Apache 2.0"
description       "Installs libs for Oracle client compatibilty"
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "0.7.0"
recipe            "compat-libstdc", "Installs compat-libstdc++-33"
%w{ centos redhat fedora amazon }.each do |os|
    supports os
end