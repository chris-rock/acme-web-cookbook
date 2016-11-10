#
# Cookbook Name:: acme-web
# Recipe:: web
#

remote_file "#{Chef::Config[:file_cache_path]}/gh-pages.tar.gz" do
  source 'https://github.com/chef/inspec/archive/gh-pages.tar.gz'
  mode '0755'
  action :create
end

install_path = "/usr/share/nginx/inspec"
bash 'extract inspec web page' do
  cwd Chef::Config[:file_cache_path]
  code <<-EOF
    tar -xvf gh-pages.tar.gz
    mv inspec-gh-pages #{install_path}
  EOF
  user "root"
  not_if { ::File.exists?(install_path) }
end

template '/etc/nginx/sites-enabled/inspec' do
  source 'inspec.conf.erb'
  action :create
end

bash 'extract inspec web page' do
  cwd Chef::Config[:file_cache_path]
  code <<-EOF
    tar -xvf gh-pages.tar.gz
    mv inspec-gh-pages #{install_path}
  EOF
  user "root"
  not_if { ::File.exists?(install_path) }
end

service "nginx" do
  action :restart
end
