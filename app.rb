require 'bundler/setup'
Bundler.require(:default)
require 'pry'
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }


get'/' do

  @top_recipes = Recipe.all.top_recipes

  erb :index
end


get'/add_recipe' do
  erb :add_recipes
end

post '/add_recipe' do
  name = params.fetch('name')
  instructions = params.fetch('instructions')
  rating = params.fetch('rating')
  new_recipe = Recipe.create({name: name, instruction: instructions, rating: rating})
  redirect '/'
end
