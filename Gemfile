# Gems
source 'https://rubygems.org'

# Assets

ruby '2.2.0'


gem 'rails', '4.2.1'
gem 'puma'
gem 'sprockets', '~> 2.12.3' # Downgrading due to .gz assets not being generated.
gem 'rack-cors'


# Prerender partials so scrappers can get them
gem 'prerender_rails'


# Controller
gem 'responders'
gem 'has_scope'
gem 'active_model_serializers', '~> 0.8.3'

# Template
gem 'foundation-rails'


# Authentication
gem 'devise'
gem 'omniauth-facebook'

# Admin
gem 'typus', github: 'typus/typus'

# Database
gem 'pg'
gem 'postgres_ext-serializers', github: 'crossroads/postgres_ext-serializers'



group :production, :staging do
  gem 'rack-zippy'
  gem 'rails_12factor'
  gem 'newrelic_rpm'
end


# Asset Pipeline
gem 'sass-rails'
gem 'jquery-rails'
gem 'uglifier'
gem 'angularjs-rails'
gem 'angular_rails_csrf'
gem 'font-awesome-rails'
gem 'leaflet-markercluster-rails'


source 'https://rails-assets.org' do
  gem 'rails-assets-angular-devise'
  gem 'rails-assets-angular-loading-bar'
  gem 'rails-assets-angular-filter'
  gem 'rails-assets-angular-easyfb'
  gem 'rails-assets-angulartics'
  gem 'rails-assets-angular'

  # Gem to work with maps: http://leafletjs.com/
  gem 'rails-assets-leaflet'
  gem 'rails-assets-leaflet-routing-machine'
  gem 'rails-assets-leaflet-routing-graphhopper', '1.0.7'

end

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

  gem 'rspec-rails'
  gem 'factory_girl_rails'

  gem 'jasmine', github: "pivotal/jasmine-gem"
end

