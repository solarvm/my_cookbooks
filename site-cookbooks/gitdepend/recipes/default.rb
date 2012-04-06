case node[:platform]
when "centos","redhat","fedora","amazon"
    package "curl" do
	action :install
    end
    package "curl-devel" do
	action :install
    end
    package "openssl-devel" do
	action :install
    end
when "debian","ubuntu" 
    package "tclcurl" do
	action :install
    end
    package "libcurl4-openssl-dev" do
	action :install
    end
    package "libssl-dev" do
	action :install
    end
end