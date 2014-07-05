package "git"

log "Hello Beautiful World"

directory "/tmp/folder" do
  owner "root"
  group "root"
  mode 0755
  action :create
end

include_recipe "pgd::packages"
