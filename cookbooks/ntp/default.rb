package 'ntp' do
  action :install
end

remote_file '/etc/ntp.conf' do
  mode '0644'
  owner 'root'
  group 'root'
end

service 'ntp' do
  action [:start, :enable]
end
