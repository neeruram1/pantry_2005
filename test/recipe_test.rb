require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/ingredient'
require './lib/pantry'
require './lib/recipe'

class RecipeTest < Minitest::Test
  def setup
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    @recipe1 = Recipe.new("Mac and Cheese")
  end

  def test_it_exists
    assert_instance_of Recipe, @recipe1
  end

  def test_it_has_attributes
    assert_equal "Mac and Cheese", @recipe1.name
    assert_equal ({}), @recipe1.ingredients_required
  end

  def test_its_ingredients_start_with_0_required_amount
    @recipe1.initial_amount(@ingredient1)
    @recipe1.initial_amount(@ingredient2)

    assert_equal 0, @recipe1.ingredients_required[@ingredient1]
    assert_equal 0, @recipe1.ingredients_required[@ingredient2]
    end

  def test_it_can_add_ingredients
    @recipe1.initial_amount(@ingredient1)
    @recipe1.initial_amount(@ingredient2)

    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient1, 4)
    @recipe1.add_ingredient(@ingredient2, 8)

    expected = {
              @ingredient1 => 6,
              @ingredient2 => 8
    }
    assert_equal expected, @recipe1.ingredients_required
  end

  def test_it_has_ingredients
    @recipe1.initial_amount(@ingredient1)
    @recipe1.initial_amount(@ingredient2)

    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient1, 4)
    @recipe1.add_ingredient(@ingredient2, 8)

    assert_equal [@ingredient1, @ingredient2], @recipe1.ingredients
  end
end
