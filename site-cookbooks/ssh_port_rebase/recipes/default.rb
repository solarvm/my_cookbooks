template "/etc/ssh/sshd_config" do
    source "sshd_config.erb"
    owner "root"
    group "root"
    mode "0644"
end
case node["platform"]
when "debian","ubuntu"
    service "ssh" do
	action :restart
    end
when "centos","redhat","fedora","amazon"
    service "sshd" do
	action :restart
    end
end

