package 'git'

directory "/home/vagrant/.ssh"

template "/home/vagrant/.ssh/id_rsa" do
  owner 'root'
  group 'root'
  source "id_rsa.erb"
  mode 0644
end

template "/home/vagrant/.ssh/id_rsa.pub" do
  owner 'root'
  group 'root'
  source "id_rsa.pub.erb"
  mode 0644
end
