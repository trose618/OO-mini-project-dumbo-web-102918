require 'date'

class User
  attr_reader :name

  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @@all << self
  end

  def recipes
    RecipeCard.all.select{|card|card.user == self}.map{|card|card.recipe}
    #should return all of the recipes this user has recipe cards for
  end

  def add_recipe_card(recipe, year, month, date, rating)
    RecipeCard.new(self, recipe, Date.new(year, month, date), rating)
    #should accept a recipe instance as an argument, as well as a date and rating, and create a new recipe card for this user and the given recipe
  end

  def declare_allergen(ingredient)
    Allergen.new(self, ingredient)
    #should accept an ingredient instance as an argument, and create a new allergen instance for this user and the given ingredient
  end

  def allergens
    Allergen.all.select{|allergy|allergy.user == self}.map{|allergy|allergy.ingredient}
    #should return all of the ingredients this user is allergic to
  end

  def top_three_recipes
    RecipeCard.all.select{|card|card.user == self}.sort_by{|card|card.rating}.last(3).reverse
    #should return the top three highest rated recipes for this user.
  end

  def most_recent_recipe
    RecipeCard.all.select{|card|card.user == self}.sort_by{|card|card.date}.last.recipe
    #should return the recipe most recently added to the users list by date
  end

  def safe_recipes
     Recipe.all.select{|recipe|(recipe.ingredients & allergens).empty?}
    #should return all recipes that do not contain ingredients the user is allergic to
  end

end
