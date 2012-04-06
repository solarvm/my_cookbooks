case node[:platform]
when "centos","redhat","fedora","amazon"
    package "compat-libstdc++-33" do
	action :install
    end
end