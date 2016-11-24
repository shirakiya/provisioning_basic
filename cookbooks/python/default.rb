include_recipe "../base/default.rb"
include_recipe "../xbuild/default.rb"

home_dir = "/home/#{node[:user][:username]}"
version = node[:python][:version]

execute "install python" do
  command "/tmp/xbuild/python-install #{version}  #{home_dir}/python"

  not_if "test -e #{home_dir}/python"
end

execute "change owner python" do
  command "chown -R #{node[:user][:username]}:#{node[:user][:groupname]} #{home_dir}/python"
end

file "#{home_dir}/.bash_profile" do
  action :edit
  block do |content|
    content << "\nexport PATH=$HOME/python/bin:$PATH"
  end

  not_if "grep '$HOME/python/bin:$PATH' #{home_dir}/.bash_profile"
end

execute "upgrade pip" do
  command "#{home_dir}/python/bin/pip install --upgrade pip"
  user node[:user][:username]
end
