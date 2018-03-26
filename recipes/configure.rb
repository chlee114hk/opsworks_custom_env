node[:deploy].each do |app, deploy|
  directory "var/www/#{app}/config" do
    owner "ubuntu"
    group "www-data"
    mode 0774
    recursive true
    action :create
  end
  file File.join('var', 'www', "#{app}", 'config', 'app_data.yml') do
    content YAML.dump({production: deploy[:custom_env].to_hash})
  end
end
