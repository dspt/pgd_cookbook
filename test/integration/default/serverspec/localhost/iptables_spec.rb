require 'spec_helper'

describe package('git') do
    it { should be_installed }
end

describe port(80) do
  it { should_not be_listening }
end

describe service('sshd') do
  it { should be_enabled }
end

describe file('/tmp/folder') do
  it { should be_directory }
  it { should be_mode 755 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'root' }
end

%w{autoconf automake binutils bison flex gcc gcc-c++ gettext libtool make patch pkgconfig redhat-rpm-config rpm-build byacc cscope ctags cvs diffstat doxygen elfutils gcc-gfortran git indent intltool patchutils rcs subversion swig systemtap  zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel  mysql mysql-server MySQL-python mysql-connector-odbc git python-devel mysql-devel libffi-devel liberation-sans-fonts }.each do |p| 
    describe package(p) do 
        it { should be_installed}
    end
end

