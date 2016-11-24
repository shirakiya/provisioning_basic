package "supervisor" do
  action :install
end

service "supervisor" do
  action [:start, :enable]
end
