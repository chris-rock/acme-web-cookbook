#
# Cookbook Name:: acme-web
# Recipe:: nginx
#

# install nginx
package 'nginx'

# generate ssl certs for https
directory '/etc/nginx/ssl' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

openssl_x509 '/etc/nginx/ssl/mycert.pem' do
  common_name 'www.acme.com'
  org 'Acme Inc'
  org_unit 'Lab'
  country 'US'
end

# remove default page
file '/etc/nginx/sites-enabled/default' do
  action :delete
end

# restart nginx after installation
service "nginx" do
  action :restart
end
