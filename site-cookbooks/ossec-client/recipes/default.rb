template "/etc/yum.repos.d/atomic.repo" do
    source "atomic.erb"
    owner "root"
    group "root"
    mode "0644"
end

template "/etc/pki/rpm-gpg/RPM-GPG-KEY.art.txt" do
    source "RPM-GPG-KEY.art.erb"
    owner "root"
    group "root"
    mode "0644"
end

package "ossec-hids-client" do
    action :install
    options "--enable-repo=atomic"
end

template "/var/ossec/etc/ossec-agent.conf" do
    source "ossec-agent.conf.erb"
    owner "root"
    group "root"
    mode "0644"
end

link "/var/ossec/etc/ossec.conf" do
    to "/var/ossec/etc/ossec-agent.conf"
    link_type :symbolic
end

service "ossec-hids" do
    action :enable
    action :start
end