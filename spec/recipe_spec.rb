require 'spec_helper'

describe(Recipe) do

  it('validates name') do
    recipe = Recipe.new(name: "")
    expect(recipe.save).to(eq(false))
  end

  it('validates number is equal to or not more than 5') do
    recipe = Recipe.new(name: "chicken noodle", rating: 6)
    expect(recipe.save).to(eq(false))
  end

  it('validates number is equal to or not more than 5') do
    recipe = Recipe.new(name: "chicken noodle", rating: 4)
    expect(recipe.save).to(eq(true))
  end

  describe('#recipe_cap') do
    it('capitalizes recipes') do
      recipe = Recipe.create(name: "chicken noodle", rating: 3)
      expect(recipe.name).to(eq("Chicken Noodle"))
    end
  end


  describe('top_recipes') do
    it('returns the top recipes in the box') do
      recipe = Recipe.create(name: "chicken noodle", rating: 5)
      recipe1 = Recipe.create(name: "chicken", rating: 5)
      recipe2 = Recipe.create(name: " noodle", rating: 3)
      expect(Recipe.all.top_recipes.length).to(eq(2))
    end
  end



end
