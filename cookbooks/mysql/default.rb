%w(
  libmysqlclient-dev
  mysql-client
  mysql-server
).each do |pkg|
  package pkg do
    action :install
  end
end
