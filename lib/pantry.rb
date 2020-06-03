class Pantry
  attr_reader :stock

  def initialize
    @stock = {}
  end

  def add_ingredient(ingredient)
    @stock[ingredient] = 0
  end

  def stock_check(ingredient)
    @stock[ingredient]
  end

  def restock(ingredient, quantity)
    @stock[ingredient] += quantity
  end
end
