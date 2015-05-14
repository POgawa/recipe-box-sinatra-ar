class Recipe < ActiveRecord::Base
  has_and_belongs_to_many :ingredients
  has_and_belongs_to_many :categories
  validates_presence_of :name
  validates_presence_of :rating
  before_save(:recipe_cap)
  validates :rating, :numericality => {greater_than: 0, less_than_or_equal_to: 5}, message: 'You must abide'

  scope(:top_recipes, -> do
    where({:rating => 5})
  end)

private

  def recipe_cap
    self.name = self.name.titleize
  end

end
