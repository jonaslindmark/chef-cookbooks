directory "/usr/local/nodejs"

remote_file "/tmp/node.tar.gz" do
  source "http://nodejs.org/dist/v#{node[:nodejs][:version]}/node-v#{node[:nodejs][:version]}-linux-x86.tar.gz"
  mode "0644"
  not_if { File.exist?("/tmp/node.tar.gz") }
end

execute "Unpack Node.js" do
  command "tar --strip-components=1 -xzf /tmp/node.tar.gz -C /usr/local/nodejs"
  not_if { File.exist?("/usr/local/node") }
end

execute "Add Node.js to path" do
  command "ln -s /usr/local/nodejs/bin/node /usr/sbin/.; ln -s /usr/local/nodejs/bin/npm /usr/sbin/.;"
  not_if { File.exist?("/usr/sbin/node") }
end

execute "install coffee and grunt" do
  command "npm install -g coffee-script; npm install -g grunt-cli"
end
