home_dir = "/home/#{node[:user][:username]}"
bash_profile = "#{home_dir}/.bash_profile"

package "awscli" do
  action :install
end

# 自動補完を有効にする
execute "create .bash_profile" do
  command "touch #{bash_profile}"
  user node[:user][:username]

  not_if "test -e #{bash_profile}"
end

execute "enable aws cli command completion" do
  command "echo \"complete -C \'$(which aws_completer)\' aws\" >> #{bash_profile}"
  user node[:user][:username]

  only_if "echo $SHELL | grep bash && ! grep 'aws_completer' #{bash_profile}"
end
