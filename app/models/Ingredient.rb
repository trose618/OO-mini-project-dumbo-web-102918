class Ingredient
  attr_reader :name

  @@all = []

  def self.all
    @@all
  end

  def allergic_users
    Allergen.all.select{|allergy|allergy.ingredient == self}.map{|allergy|allergy.user}
  end

  def self.most_common_allergen
    common = all[0]
    Allergen.all.each{|allergy|common = allergy.ingredient if allergy.ingredient.allergic_users.count > common.allergic_users.count}
    common
    #should return the ingredient instance that the highest number of users are allergic to
  end

  def initialize(name)
    @name = name
    @@all << self
  end
end
