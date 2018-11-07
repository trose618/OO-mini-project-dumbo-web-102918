require 'date'

class RecipeCard

  attr_reader :user, :recipe, :date, :rating

  @@all = []

  def self.all
    @@all
  end

  def initialize(user, recipe, year, month, date,rating)
    @user = user
    @recipe = recipe
    @date = Date.new(year,month,date)
    @rating = rating
    @@all << self
  end

end
