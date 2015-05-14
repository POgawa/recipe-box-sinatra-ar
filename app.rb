require 'bundler/setup'
require 'pry'
Bundler.require(:default, :production)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }


get'/' do

  @top_recipes = Recipe.all.top_recipes

  erb :index
end


get'/add_recipe' do
  @categories = Category.all
erb :add_recipes
end

post '/add_recipe' do

  name = params.fetch('name')
  instructions = params.fetch('instructions')
  rating = params.fetch('rating')
  new_recipe = Recipe.new({name: name, instruction: instructions, rating: rating})

  if new_recipe.save
    category_id = params.fetch("category_id")
    category = Category.find(category_id)
    new_recipe.categories.push(category)
    redirect '/categories'
  else
    redirect '/'
  end
end

get '/categories' do
  @categories = Category.all
  erb :categories
end


post "/add_cuisine" do
  cuisine = params.fetch("name")
  Category.create({cuisine: cuisine})
  redirect '/categories'
end


get('/recipe/:id') do
  @recipe = Recipe.find(params.fetch('id'))
  erb(:recipe)
end
