# Gems
source 'https://rubygems.org'

# Assets
source 'https://rails-assets.org'

ruby '2.2.0'


gem 'rails', '4.2.0'


# Controller
gem 'responders'
gem 'active_model_serializers', '~> 0.9.0'

# Template
gem 'slim-rails'
gem 'foundation-rails'


# Authentication
gem 'devise'
gem 'omniauth-facebook'


# Database
gem 'pg' # Use postgresql as the database for Active Record

group :production do
  gem 'rails_12factor'
end


# Asset Pipeline
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'rails-assets-openlayers3' # Open Street Map support
gem 'rails-assets-magnific-popup' # 
gem 'rails-assets-angular-devise'
gem 'rails-assets-angular-loading-bar'
gem 'angularjs-rails'
gem 'angular-rails-templates'
gem 'angular_rails_csrf'
gem 'font-awesome-rails'

# Gem to work with maps: http://leafletjs.com/
gem 'rails-assets-leaflet'


# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
#gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
#gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :test do
  gem 'poltergeist' # Node.js is required to run spec/features/ tests: https://github.com/teampoltergeist/poltergeist
  gem 'database_cleaner'
  gem 'shoulda-matchers', require: false
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  #gem 'spring'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end

