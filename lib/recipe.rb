class Recipe
  attr_reader :name,
              :ingredients_required
  def initialize(name)
    @name = name
    @ingredients_required = {}
  end

  def initial_amount(ingredient)
    @ingredients_required[ingredient] = 0
  end

  def add_ingredient(ingredient, amount)
    @ingredients_required[ingredient] += amount
  end

  def ingredients
    @ingredients_required.keys
  end

  def total_calories
    ingredients_required
    ingredients_required.sum do |ingredient, amount|
      ingredient.calories * amount
    end
  end
end
