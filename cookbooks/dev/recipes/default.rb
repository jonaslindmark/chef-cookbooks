directory "/usr/local/nodejs"

cookbook_file "/tmp/vim.tar.gz" do
  source "vim.tar.gz"
  owner 'root'
  group 'root'
  mode "0640"
end

execute "set up vim" do
  command "cd /tmp; tar -xzf vim.tar.gz; mv .vim /home/vagrant/"
  not_if { File.exist?("/home/vagrant/.vim") }
end

template "/home/vagrant/.vimrc" do
  owner 'vagrant'
  group 'vagrant'
  source ".vimrc.erb"
end

template "/home/vagrant/.tmux.conf" do
  owner 'vagrant'
  group 'vagrant'
  source "tmux.conf.erb"
end
