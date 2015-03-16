source 'https://rubygems.org'
ruby '2.0.0'

# PostgreSQL driver
gem 'pg'

# Sinatra driver
gem 'sinatra'
gem 'sinatra-contrib'

gem 'activesupport', '~>4.1'
gem 'activerecord', '~>4.1'
gem 'bcrypt-ruby'

gem 'rake'

# install a more concurrent webserver optional change procfile to use puma instead of shotgun or rackup if you like.
gem 'puma'
gem 'shotgun'

group :development do

end

group :test do
  gem 'shoulda-matchers'
  gem 'rack-test'
  gem 'rspec'
  gem 'capybara'
end

group :test, :development do
  gem 'factory_girl'
end
