source 'https://rubygems.org'

ruby '2.3.0'

gem 'rails', '4.2.6'
gem 'mongoid', '~> 5.1.0'
gem 'mail_form'
gem 'sass'
gem 'active_attr'
gem 'jquery-rails'
gem 'simple_form'
gem 'bluecloth'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end


group :test, :development do
  gem 'jazz_hands', github: 'jkrmr/jazz_hands'
end

group :development, :staging do
  gem 'binding_of_caller'
  gem 'haml-rails'
  gem 'quiet_assets'
end

group :test do
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'spork-rails'
end
