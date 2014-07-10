include_recipe "pgd::packages"
include_recipe "yum"
include_recipe "nginx"
include_recipe "python"
include_recipe "python::pip"
include_recipe "git"

user node['pgd']['user'] do
  home "/home/pgd"
  shell "/bin/bash"
end

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

database_engine = node['pgd']['database']['engine'] || settings['database_engine']
database_name = node['pgd']['database']['name'] || settings['database_name']
database_user = node['pgd']['database']['user'] || settings['database_user']
database_password = node['pgd']['database']['password'] || settings['database_password']
database_host = node['pgd']['database']['host'] || settings['database_host']
database_port = node['pgd']['database']['port'] || settings['database_port']

secret_key = node['pgd']['secret_key'] || settings['secret_key']
google_id = node['pgd']['google_id'] || settings['google_id']

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

django_admin = ::File.join(node['pgd']['virtualenv'], '/bin/django-admin.py')
django_version = '1.3.7' # `#{django_admin} --version`

if django_version.chomp == '1.3.7'
  python_pip 'django-registration' do
    virtualenv node['pgd']['virtualenv']
    action :remove
  end
  
  python_pip 'django-registration' do
    virtualenv node['pgd']['virtualenv']
    action :install
    version '0.8'
  end
  
  pythonpackages = %w[mysql-python cairocffi simplejson]
  
  pythonpackages.each do |p|
    python_pip p do
      virtualenv node['pgd']['virtualenv']
      action :install
    end
  end

  config_file = ::File.join(node['pgd']['config_dir'], 'wsgi.py')
  template config_file do
    source "wsgi.py.erb"
    owner node['pgd']['user']
    group node['pgd']['group']
    mode "0644"
  end

  execute 'sed' do
    command "sed -i 's/import cairo/import cairocffi as cairo/' /var/www/pgd/pgd/pgd_search/*/*.py"
  end

else
  log django_version
  # A couple more things to import from Jack's install_pgd.sh
end

 
config_file = ::File.join(node['pgd']['config_dir'], 'gunicorn_config.py')
template config_file do
  source "gunicorn_config.py.erb"
  owner node['pgd']['user']
  group node['pgd']['group']
  mode "0644"
end

python_pip 'gunicorn' do
  virtualenv node['pgd']['virtualenv']
  action :install
end

package 'nginx'

server_name = 'pgd' 
template "#{node['nginx']['dir']}/nginx.conf" do
  source "nginx.conf.erb"
  owner "root"
  group "root"
  mode 00644
end

package 'supervisor'

template "/etc/supervisord.conf" do
  source "supervisord.conf.erb"
  owner "root"
  group "root"
  mode 00644
end

service 'supervisord' do
  action :restart
end
