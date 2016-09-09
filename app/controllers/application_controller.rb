class ApplicationController < ActionController::Base
  protect_from_forgery

  http_basic_authenticate_with name: 'cali-ruby', password: ENV['ACCESS_KEY'] if Rails.env == 'production'
end
