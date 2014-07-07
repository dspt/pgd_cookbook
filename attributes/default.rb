default['pgd']['path'] = "/var/www/pgd"
default['pgd']['user'] = 'pgd'
default['pgd']['group'] = nil

default['pgd']['repository'] = "git://git.osuosl.org/gitolite/pgd.git"
default['pgd']['branch'] = "develop"
default['pgd']['github_user'] = "git"

default['pgd']['install_dir'] = '/var/www/pgd'
default['pgd']['config_dir'] = '/var/www/pgd/config'

default['python']['binary'] = '/opt/python/bin/python2.7'
default['python']['install_method'] = "source"
default['python']['prefix_dir'] = "/opt/python"
default['python']['url'] = 'http://www.python.org/ftp/python'
default['python']['configure_options'] = %W{--prefix=#{python['prefix_dir']}}
default['python']['pip_location'] = "#{node['python']['prefix_dir']}/bin/pip"
default['python']['version'] = "2.7.1"
default['python']['checksum'] = "80e387bcf57eae8ce26726753584fd63e060ec11682d1145af921e85fd612292"
