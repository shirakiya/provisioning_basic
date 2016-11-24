%w(
  base
  firewall
  locale
  ntp
  git
  python
  nodejs
  nginx
  mysql
  supervisor
).each do |cb|
  include_cookbook cb
end
