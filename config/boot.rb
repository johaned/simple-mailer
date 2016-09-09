require 'rubygems'

# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

###### Heroku deployment hack ######
# copy mongoid config example file into 'real' file
if ENV['RACK_ENV'] == 'production'
  # Mongo
  config_root = File.join(Bundler.root, 'config')
  mongoid_example_path = File.join(config_root, 'mongoid.yml.example')
  mongoid_real_path = File.join(config_root, 'mongoid.yml')
  `cp #{mongoid_example_path} #{mongoid_real_path}`
  # Email provider
  email_provider_example_path = File.join(config_root, 'email_provider.yml.example')
  email_provider_real_path = File.join(config_root, 'email_provider.yml')
  `cp #{email_provider_example_path} #{email_provider_real_path}`
end
