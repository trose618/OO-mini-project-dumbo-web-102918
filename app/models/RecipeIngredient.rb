class RecipeIngredient
  attr_reader :ingredient, :recipe

  @@all = []

  def self.all
    @@all
  end

  def initialize(recipe, ingredient)
    @recipe = recipe
    @ingredient = ingredient
    @@all << self
  end
end
