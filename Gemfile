source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.0'
gem 'pg', '~> 0.18'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jbuilder', '~> 2.5'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
end

gem "jquery-rails"
gem "bootstrap-sass"
gem "autoprefixer-rails"
gem "modernizr-rails"
gem "jquery-datetimepicker-rails"
gem "jquery-ui-rails"

gem "slim-rails"
gem "devise", github: "plataformatec/devise"
gem "ace-rails-ap"
gem "redcarpet"

gem "simple_form"
gem "ransack"
gem "will_paginate"

gem "mina"
gem "mina-whenever"
gem "whenever", require: false