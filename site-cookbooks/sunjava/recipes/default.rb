download_url=node[:sunjava][:url]
package=node[:sunjava][:packagename]
sha256=node[:sunjava][:checksum]

remote_file "/tmp/#{package}" do
    source "#{download_url}"
    mode "0755"
    checksum "#{sha256}"
end

execute "install" do
    command "/tmp/#{package}"
    user "root"
    group "root"
    action :run
end