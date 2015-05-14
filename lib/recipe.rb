class Recipe < ActiveRecord::Base
  has_and_belongs_to_many :ingredients
  has_and_belongs_to_many :categories
  validates_presence_of :name
  before_save(:recipe_cap)
  validates_presence_of :rating
  validates :rating, :numericality => { less_than_or_equal_to: 5}

  scope(:top_recipes, -> do
    where({:rating => 5})
  end)

private

  def recipe_cap
    self.name = self.name.titleize
  end

end
