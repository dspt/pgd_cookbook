default['pgd']['path'] = "/var/www/pgd"
default['pgd']['config_dir'] = "/var/www/pgd/pgd"
default['pgd']['virtualenv'] = "/var/www/pgd/.venv"
default['pgd']['requirements.txt'] = "/var/www/pgd/pgd/requirements.txt"
default['pgd']['user'] = 'pgd'
default['pgd']['group'] = nil

default['pgd']['repository'] = "git://git.osuosl.org/gitolite/pgd.git"
default['pgd']['branch'] = "develop"
default['pgd']['github_user'] = "git"

default['python']['binary'] = '/opt/python/bin/python2.7'
default['python']['install_method'] = "source"
default['python']['prefix_dir'] = "/opt/python"
default['python']['url'] = 'http://www.python.org/ftp/python'
default['python']['configure_options'] = %W{--prefix=#{python['prefix_dir']}}
default['python']['pip_location'] = "#{node['python']['prefix_dir']}/bin/pip"
default['python']['virtualenv_location'] = "#{node['python']['prefix_dir']}/bin/virtualenv"
default['python']['version'] = "2.7.1"
default['python']['checksum'] = "80e387bcf57eae8ce26726753584fd63e060ec11682d1145af921e85fd612292"

default['pgd']['database']['engine'] = nil
# Load the DB Credentials using the databag as defaults.
default['pgd']['database']['name'] = nil
default['pgd']['database']['user'] = nil
default['pgd']['database']['password'] = nil
default['pgd']['database']['host'] = nil
default['pgd']['database']['port'] = nil

# secrets

default['pgd']['secret_key'] = nil
default['pgd']['google_id'] = nil
