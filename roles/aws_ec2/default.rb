%w(
  base
  firewall
  locale
  ntp
  git
  awscli
  python
  nginx
  supervisor
).each do |cb|
  include_cookbook cb
end
