require 'spec_helper'

%w{autoconf automake binutils bison flex gcc gcc-c++ gettext libtool make patch pkgconfig redhat-rpm-config rpm-build byacc cscope ctags cvs diffstat doxygen elfutils gcc-gfortran git indent intltool patchutils rcs subversion swig systemtap  zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel  mysql mysql-server MySQL-python mysql-connector-odbc git python-devel mysql-devel libffi-devel liberation-sans-fonts}.each do |p| 
    describe package(p) do 
        it { should be_installed}
    end
end

describe command('/opt/python/bin/python2.7 --version') do
  it { should  return_stdout 'Python 2.7.1' }
end

describe command('/var/www/pgd/.venv/bin/python --version') do
  it { should  return_stdout 'Python 2.7.1' }
end

describe command('ls /usr/local/bin/phantomjs') do
  it { should return_exit_status 0 }
end

describe command('grep cairocffi /var/www/pgd/pgd/pgd_search/*/*.py|wc -l') do
  it { should return_stdout '3' }
end
