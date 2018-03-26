node[:deploy].each do |app, deploy|
  puts "App: #{app}"
  puts "Deploy: #{deploy}"
  file File.join('var', 'www', "#{app}", 'config', 'app_data.yml') do
    content YAML.dump(deploy[:custom_env].to_hash)
  end
end
