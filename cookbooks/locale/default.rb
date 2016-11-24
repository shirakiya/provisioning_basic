package 'language-pack-ja' do
  action :install
end

execute 'set local' do
  command 'update-locale LANG=ja_JP.UTF-8'
  user 'root'

  not_if "cat /etc/default/locale | grep 'ja_JP'"
end
