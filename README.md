PGD Cookbook
=================
Deploys the Protein Geometry Database web app.


Requirements
------------
The following distributions have been tested. 

- Rhel (Centos) 6.5 

#### Cookbooks
- `git` - for managing the code base
- `nginx` - choice of webserver
- `python` - Need an older (newer for CentOS) version for compatibility
- `yum` - for installing packages

Attributes
----------
['pgd']['path'] = "/var/www/pgd"
['pgd']['config_dir'] = "/var/www/pgd/pgd"
['pgd']['virtualenv'] = "/var/www/pgd/.venv"
['pgd']['requirements.txt'] = "/var/www/pgd/pgd/requirements.txt"
['pgd']['user'] = 'pgd'
['pgd']['group'] = nil

['pgd']['repository'] = "git://git.osuosl.org/gitolite/pgd.git"
['pgd']['branch'] = "master"
['pgd']['github_user'] = "git"

['python']['binary'] = '/opt/python/bin/python2.7'
['python']['install_method'] = "source"
['python']['prefix_dir'] = "/opt/python"
['python']['url'] = 'http://www.python.org/ftp/python'
['python']['configure_options'] = %W{--prefix=#{python['prefix_dir']}}
['python']['pip_location'] = "#{node['python']['prefix_dir']}/bin/pip"
['python']['virtualenv_location'] = "#{node['python']['prefix_dir']}/bin/virtualenv"
['python']['version'] = "2.7.1"
['python']['checksum'] = "80e387bcf57eae8ce26726753584fd63e060ec11682d1145af921e85fd612292"

['pgd']['database']['engine'] = nil
['pgd']['database']['name'] = nil
['pgd']['database']['user'] = nil
['pgd']['database']['password'] = nil
['pgd']['database']['host'] = nil
['pgd']['database']['port'] = nil
# secrets
['pgd']['secret_key'] = nil
['pgd']['google_id'] = nil

Recipes
-------
#### pgd::default
Install pgd
- Make user
- Specify directory to deploy
- git clone $repo
- Pull in settings from encrypted databag
- Make changes if install django-1.3.7
- Install/ configure nginx
- Install/ configure supervisord

#### pgd:packages
Install packages for pgd code base

Usage
-----
Using Test Kitchen and OpenStack you can just $ knife verify

Testing
-------
There are some preliminary tests for packages and correct python, needs more

License and Authors
-------------------
Authors: Daniel Takamori (pono@osuosl.org)
