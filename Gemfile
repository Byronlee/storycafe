source 'http://ruby.taobao.org'


group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby
  gem "therubyracer" ,'~> 0.10.0'
  gem "less"
  gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
  gem "twitter-bootstrap-rails"
  gem 'uglifier', '>= 1.0.3'
end

gem 'rails', '3.2.8'
gem 'devise'

group :development do 
  gem 'pry-rails'
end

group :development,:test do
  gem "rails_best_practices"
  gem 'guard-rspec'
  gem 'spork'
  gem 'guard-spork'
end

group :test do 
  gem 'ruby_gntp'
  gem 'rb-inotify'
  gem 'rb-fsevent'
  gem 'libnotify'
# gem 'growl'
  gem 'factory_girl_rails'
  gem "rspec"
  gem "rspec-rails"
  gem "mongoid-rspec"
  gem 'simplecov',:require => false
end

gem 'mongoid'
gem 'bson_ext'
gem 'mongoid_auto_inc',:path => "lib/mongoid_auto_inc"
gem 'mongoid_rails_migrations'

gem "slim"
gem 'slim-rails'

gem 'jquery-rails'

# message push
gem "private_pub"

# server
gem "thin"
# ##
