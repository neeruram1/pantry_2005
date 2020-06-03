require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/ingredient'

class IngredientTest < Minitest::Test
  def setup
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
  end







end
