cookbook_file "/tmp/go.tar.gz" do
  source "go1.0.3.linux-386.tar.gz"
  owner 'root'
  group 'root'
  mode "0640"
end

execute "extract go" do
  command "cd /tmp; tar -C /usr/local -xzf go.tar.gz"
  not_if { File.exist?("/usr/local/go") }
end

execute "add go to path" do
  command "ln -s /usr/local/go/bin/go /usr/sbin/go"
  not_if { File.exist?("/usr/sbin/go") }
end
