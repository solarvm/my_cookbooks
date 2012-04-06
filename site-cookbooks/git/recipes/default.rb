urlbase = node["git"]["urlbase"]
version = node["git"]["ver"]
prefix = node["git"]["prefix"]

url="#{urlbase}/git-#{version}.tar.gz"

script "install_git" do
    interpreter "bash"
    user "root"
    cwd "/usr/src"
    code <<-EOH
    wget #{url}
    tar zxf git-#{version}.tar.gz
    cd git-#{version}
    ./configure --with-curl --with-openssl --prefix=#{prefix}
    make && make install
    cd ..
    rm -rf git-#{version}
    rm -f git-#{version}.tar.gz
    EOH
end