source 'https://rubygems.org'


gem 'sinatra-activerecord'
gem("sinatra-contrib", require: "sinatra/reloader")
gem('pg')
gem 'rake'
gem 'shoulda-matchers', require: false

group(:production) do
  gem 'sinatra'
end

group(:test) do
  gem 'rspec'
  gem 'capybara'
  gem 'pry'

end
