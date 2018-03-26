node[:deploy].each do |app, deploy|
  directory "var/www/#{app}/config" do
    owner "ubuntu"
    group "www-data"
    mode 0774
    recursive true
    action :create
  end
  file File.join('var', 'www', "#{app}", '.env') do
    dotenv = ''
    deploy[:custom_env].each {|key, value| dotenv << "%s=%s\n" % [key, value]}
    content dotenv
  end
end
