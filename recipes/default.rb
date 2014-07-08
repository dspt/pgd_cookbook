include_recipe "pgd::packages"
include_recipe "yum"
include_recipe "python"
include_recipe "python::pip"
include_recipe "git"

# Check directory for cloning
directory node['pgd']['path'] do
  owner node['pgd']['owner']
  group node['pgd']['group']
  recursive true
  action :create
end

# clone the repo 
git node['pgd']['path'] do
  repository node['pgd']['repository']
  user node['pgd']['owner']
  group node['pgd']['group']
end

python_virtualenv node['pgd']['virtualenv'] do
  owner node['pgd']['owner']
  group node['pgd']['group']
  action :create
end

python_pip node['pgd']['requirements.txt'] do
  options "-r"
  virtualenv node['pgd']['virtualenv']
  action :install
end

settings = Chef::EncryptedDataBagItem.load("pgd", "settings")

config_file = ::File.join(node['pgd']['config_dir'], 'settings.py')
template config_file do
  source "settings.py.erb"
  owner node['pgd']['user']
  group node['pgd']['group']
  mode "0644"
  variables({
    :database_engine => database_engine,
    :database_name => database_name,
    :database_user => database_user,
    :database_password => database_password,
    :database_host => database_host,
    :database_port => database_port,
    :secret_key =>  secret_key,
    :google_id => google_id
  })
end
