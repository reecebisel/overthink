source 'https://rubygems.org'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.0'
gem 'httparty', '~> 0.14.0
'
group :production do 
  gem 'rails_12factor'
end

group :development, :test do
  gem 'pry'
  gem 'pry-rails'
  gem 'pry-byebug'
end

group :test do
  gem 'rspec-rails', '~> 3.5', '>= 3.5.2'
  gem 'factory_girl', '~> 4.7'
end

group :development do
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
