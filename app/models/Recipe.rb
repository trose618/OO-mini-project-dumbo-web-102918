class Recipe
  attr_reader :name
  @@all = []

  def self.all
    #should return all of the recipe instances
    @@all
  end

  def self.most_popular
    popular = all[0]
    Recipe.all.each{|recipe|popular = recipe if recipe.users.count > popular.users.count}
    popular
    #should return the recipe instance with the highest number of users (the recipe that has the most recipe cards)
  end

  def initialize(name)
    @name = name
    @@all << self
  end

  def users
    RecipeCard.all.select{|object|object.recipe == self}.map{|card| card.user}
    #should return the user instances who have recipe cards with this recipe
  end

  def add_ingredients(ingredients)
    ingredients.each{|ingredient|RecipeIngredient.new(self, ingredient)}
    #should take an array of ingredient instances as an argument, and associate each of those ingredients with this recipe
  end


  def ingredients
    RecipeIngredient.all.select{|recipe_ingredient|recipe_ingredient.recipe == self}.map{|recipe|recipe.ingredient}
    #should return all ingredients in this recipe
  end

  def allergens
    ingredients.select{|ingredient|Allergen.all.include?(ingredient)}
    #should return all of the ingredients in this recipe that are allergens
  end

end
