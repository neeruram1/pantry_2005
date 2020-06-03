require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/ingredient'
require './lib/pantry'

class PantryTest < Minitest::Test
  def setup
    @pantry = Pantry.new
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
  end

  def test_it_exists
    assert_instance_of Pantry, @pantry
  end

  def test_it_starts_with_empty_pantry
    assert_equal ({}), @pantry.stock
  end

  def test_its_ingredients_start_with_0_quantity
    @pantry.stock_ingredient(@ingredient1)

    assert_equal 0, @pantry.stock[@ingredient1]
  end

  def test_it_can_check_stock
    @pantry.stock_ingredient(@ingredient1)

    assert_equal 0, @pantry.stock_check(@ingredient1)
  end

  def test_it_can_restock
    @pantry.stock_ingredient(@ingredient1)
    @pantry.restock(@ingredient1, 5)
    @pantry.restock(@ingredient1, 10)
    @pantry.stock_ingredient(@ingredient2)
    @pantry.restock(@ingredient2, 7)

    assert_equal 15, @pantry.stock_check(@ingredient1)
    assert_equal 7, @pantry.stock_check(@ingredient2)
  end
end
