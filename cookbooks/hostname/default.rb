execute 'set hostname' do
  command "hostnamectl set-hostname #{node[:hostname]}"

  only_if "hostname | grep '^ip'"
end

template '/etc/hosts' do
  user 'root'
  mode '644'
  owner 'root'
  group 'root'
  variables( hostname: node[:hostname] )

  not_if "grep '#{node[:hostname]}' /etc/hosts"
end
