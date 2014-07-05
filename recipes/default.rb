include_recipe "pgd::packages"
include_recipe "python"
include_recipe "git"

log "Hello Beautiful World"

directory "/tmp/folder" do
  owner "root"
  group "root"
  mode 0755
  action :create
end

