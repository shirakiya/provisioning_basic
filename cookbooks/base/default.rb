execute 'apt update -y'
execute 'apt upgrade -y'

%w(
  gcc
  g++
  make
  openssl
  libssl-dev
  libbz2-dev
  libreadline-dev
  libsqlite3-dev
  sysv-rc-conf
  libjpeg-dev
  libfreetype6-dev
  libxft-dev
  zlib1g-dev
  swig
  tree
).each do |pkg|
  package pkg do
    action :install
  end
end

home_dir = "/home/#{node[:user][:username]}"

file "#{home_dir}/.bash_profile" do
  action :create
  not_if "test -e #{home_dir}/.bash_profile"
end
