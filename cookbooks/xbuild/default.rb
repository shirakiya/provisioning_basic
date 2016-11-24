include_recipe "./../git/default.rb"

git "/tmp/xbuild" do
  repository "https://github.com/tagomoris/xbuild.git"
end
