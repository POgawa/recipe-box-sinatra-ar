ENV['RACK_ENV'] = 'test'

require 'bundler/setup'
require 'shoulda/matchers'
Bundler.require(:default, :test)
Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each {|file| require file}
