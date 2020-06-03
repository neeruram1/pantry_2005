require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/ingredient'
require './lib/pantry'
require './lib/recipe'
require './lib/cook_book'

class CookBookTest < Minitest::Test
  def setup
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    @ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
    @ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})

    @pantry = Pantry.new
    @pantry.stock_ingredient(@ingredient1)
    @pantry.stock_ingredient(@ingredient2)
    @pantry.stock_ingredient(@ingredient3)
    @pantry.stock_ingredient(@ingredient4)

    @recipe1 = Recipe.new("Mac and Cheese")
    @recipe2 = Recipe.new("Cheese Burger")

    @recipe1.initial_amount(@ingredient1)
    @recipe1.initial_amount(@ingredient2)
    @recipe2.initial_amount(@ingredient1)
    @recipe2.initial_amount(@ingredient3)
    @recipe2.initial_amount(@ingredient4)

    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient2, 8)

    @recipe2.add_ingredient(@ingredient1, 2)
    @recipe2.add_ingredient(@ingredient3, 4)
    @recipe2.add_ingredient(@ingredient4, 1)

    @cookbook = CookBook.new
  end

  def test_it_exists
    assert_instance_of CookBook, @cookbook
  end

  def test_it_has_attributes
    assert_equal [], @cookbook.recipes
  end

  def test_it_can_add_recipes
    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)

    assert_equal [@recipe1, @recipe2], @cookbook.recipes
  end

  def test_it_can_has_ingredients
    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)
    
    assert_equal ["Cheese", "Macaroni", "Ground Beef", "Bun"], @cookbook.ingredients
  end
end
