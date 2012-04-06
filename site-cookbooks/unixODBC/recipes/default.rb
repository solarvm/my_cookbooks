case node[:platform]
when "centos","redhat","fedora","amazon"
    package "unixODBC" do
	action :install
    end
    package "unixODBC-devel" do
	action :install
    end
when "debian","ubuntu"
    package "unixodbc" do
	action :install
    end
    package "unixodbc-dev" do
	action :install
    end
end