package "openssh-server" do
    action :upgrade
end
case node["platform"]
when "debian","ubuntu"
    service "ssh" do
	action :restart
    end
else
    service "sshd" do
	action :restart
    end
end
