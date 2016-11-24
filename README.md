# provisioning_basic
The provisioning tool to setup server basically.


## Environment
- Ruby >= 2.2.0
- Vagrant Plugin:
    - vagrant-itamae


## SetUp
```
$ git clone <this repository> path/to/repos
$ cd path/to/repos
$ bundle install --path vendor/bundle
```


## Howto
```
bundle exec -- itamae ssh -u {HOSTUSER} -h {IP or HOSTNAME} -y nodes/{NODE}.yml bootstrap.rb
```

## (ref.) How to use Itamae
```
# apply recipe via SSH
itamae ssh -u {user_name} -h {IP or hostname} {path_to_recipe}.rb

# use "JSON" node
itamae ssh -u {user_name} -h {IP or hostname} -j node.json {path_to_recipe}.rb

# use "YAML" node
itamae ssh -u {user_name} -h {IP or hostname} -y node.yml {path_to_recipe}.rb

# apply recipe with debug mode
itamae ssh -u {user_name} -h {IP or hostname} {path_to_recipe}.rb -l debug

# dry-run
itamae ssh -u {user_name} -h {IP or hostname} --dry-run {path_to_recipe}.rb
```
