
log "Installing additional system packages for Protein Geometry Database"

developmenttools = %w[ autoconf automake binutils bison flex gcc gcc-c++ gettext libtool make patch pkgconfig redhat-rpm-config rpm-build byacc cscope ctags cvs diffstat doxygen elfutils gcc-gfortran git indent intltool patchutils rcs subversion swig systemtap ]
pythondevel = %w[ zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel ]
mysql = %w[ mysql mysql-server MySQL-python mysql-connector-odbc git python-devel mysql-devel libffi-devel liberation-sans-fonts ]

developmenttools.each do |p|
  package p
end

pythondevel.each do |p|
  package p
end

mysql.each do |p|
  package p
end

