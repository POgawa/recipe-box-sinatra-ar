require 'spec_helper'

describe(Recipe) do
  it do
    should have_and_belong_to_many(:categories)
  end

  it{ should validate_presence_of(:name)}

  describe('#recipe_cap') do
    it('capitalizes recipes') do
      recipe = Recipe.create(name: "chicken noodle")
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
