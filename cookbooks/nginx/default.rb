source_list = "/etc/apt/sources.list"
deb = 'deb http://nginx.org/packages/ubuntu/ trusty nginx'
deb_src = 'deb-src http://nginx.org/packages/ubuntu/ trusty nginx'

execute "get nginx apt-key" do
  command "curl http://nginx.org/keys/nginx_signing.key | apt-key add -"
  user "root"
end

file source_list do
  action :edit
  user "root"
  block do |content|
    content << "\n#{deb}"
  end

  not_if "grep '#{deb}' #{source_list}"
end

file source_list do
  action :edit
  user "root"
  block do |content|
    content << "\n#{deb_src}"
  end

  not_if "grep '#{deb_src}' #{source_list}"
end

execute "update apt" do
  command "apt update"
  user "root"
end

package "nginx" do
  action :install
end

service "nginx" do
  action [:start, :enable]
end

service "nginx" do
  action [:reload]
end
