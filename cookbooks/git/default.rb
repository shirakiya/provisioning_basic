home_dir = "/home/#{node[:user][:username]}"
ssh_dir = "#{home_dir}/.ssh"
gitconfig_path = "#{home_dir}/.gitconfig"
sshconfig_path = "#{ssh_dir}/config"


package "git" do
  action :install
end

directory ssh_dir do
  action :create
  mode "0700"
  owner node[:user][:username]
  group node[:user][:groupname]
end

# .gitconfigの配置
remote_file gitconfig_path do
  action :create
  source "./files/.gitconfig"
  mode "0644"
  owner node[:user][:username]
  group node[:user][:groupname]
end

# .ssh/configの配置
# template sshconfig_path do
#   action :create
#   mode "0644"
#   owner node[:user][:username]
#   group node[:user][:groupname]
# end
