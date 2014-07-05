default['pgd']['path'] = "/var/www/pgd"
default['pgd']['user'] = nil
default['pgd']['group'] = nil

default['pgd']['repository'] = "https://github.com/osuosl/pgd"
default['pgd']['branch'] = "develop"
default['pgd']['github_user'] = "git"

default['pgd']['install_dir'] = '/var/www/pgd'
default['pgd']['config_dir'] = '/var/www/pgd/config'

default['pgd']['static_root'] = '/var/www/pgd/collected_static'
default['pgd']['static_url'] = '/static'

default['pgd']['debug'] = false
default['pgd']['migrate'] = false
default['pgd']['site_domain'] = node['fqdn']

default['python']["prefix_dir"] = "/opt/python"
default['python']['install_method'] = "source"
default['python']['version'] = "2.7.1"
default['python']['checksum'] = "80e387bcf57eae8ce26726753584fd63e060ec11682d1145af921e85fd612292"


default['pgd']['database']['engine'] = nil
# Load the DB Credentials using the databag as defaults.
default['pgd']['database']['name'] = nil
default['pgd']['database']['user'] = nil
default['pgd']['database']['password'] = nil
default['pgd']['database']['host'] = nil
default['pgd']['database']['port'] = nil

default['pgd']['superusers'] = []

default['pgd']['host'] = node['fqdn']
default['pgd']['port'] = 8000

default['pgd']['hostsfile'] = {}


default['nginx']['default_site_enabled'] = false

default['pgd']['application_name'] = 'pgd'
default['pgd']['apache']['server_name'] = node['hostname']
default['pgd']['apache']['server_aliases'] = [node['fqdn']]

default['pgd']['apache']['processes'] = 4
default['pgd']['apache']['threads'] = 1

# secrets

default['pgd']['secret_key'] = nil
default['pgd']['web_mgr_api_key'] = nil

default['pgd']['db_server']['user'] = nil
default['pgd']['db_server']['password'] = nil

