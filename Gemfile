source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.1'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
gem 'stylus'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby
gem 'slim-rails'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

gem 'wiselinks'
gem 'nprogress-rails'
gem 'hstore_accessor'
gem 'inherited_resources', github: 'onemanstartup/inherited_resources', branch: 'master'
gem 'has_scope'
gem 'kaminari'
gem 'datagrid'
gem 'evil-blocks-rails'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

gem 'draper'


####################
#  Authentication  #
####################
gem 'devise'
# gem 'omniauth-vkontakte'
# gem 'omniauth-facebook'
# gem 'omniauth-twitter'
gem 'simple_token_authentication'
gem 'pundit', github: 'elabs/pundit'


####################
# Later for production
# ##################
# gem 'csso-rails'
# gem 'autoprefixer-rails'







group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
  gem 'guard-livereload', require: false
  gem 'guard-rubocop', require: false
  gem 'rack-livereload'
  gem 'rb-fsevent',       require: false
  gem 'pry-byebug'
  gem 'byebug'
  gem 'pry-rails'
  gem 'pry-coolline'
  gem 'pry-remote'
end

group :development, :test do
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'guard-minitest'
  gem 'terminal-notifier-guard'
  gem 'guard-bundler', require: false
end

group :test do
  gem "minitest-rails"
  gem 'rr', require: false
end

group :metrics do
  gem 'rubocop', require: false
end

group :development do
  gem 'thin'
  gem 'capistrano', '~> 3.2.0'
  # gem 'capistrano', '~> 3.0.1'
  gem 'capistrano-rails'
  gem 'capistrano-bundler'
  gem 'capistrano-rvm'
  # gem 'capistrano-puma', github: 'seuros/capistrano-puma'
  gem 'capistrano-nc', '~> 0.1.3'
  gem 'capistrano-nvm', require: false
  gem 'capistrano3-puma', github: "seuros/capistrano-puma"
end


