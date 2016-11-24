include_recipe "../xbuild/default.rb"

home_dir = "/home/#{node[:user][:username]}"
version = node[:nodejs][:version]

execute "install node" do
  command "/tmp/xbuild/node-install #{version} #{home_dir}/node"

  not_if "test -e #{home_dir}/node"
end

execute "change owner node.js" do
  command "chown -R #{node[:user][:username]}:#{node[:user][:groupname]} #{home_dir}/node"
end

file "#{home_dir}/.bash_profile" do
  action :edit
  block do |content|
    content << "\nexport PATH=$HOME/node/bin:$PATH"
  end

  not_if "grep '$HOME/node/bin:$PATH' #{home_dir}/.bash_profile"
end
