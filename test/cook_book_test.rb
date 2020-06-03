require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/ingredient'
require './lib/pantry'
require './lib/recipe'
require './lib/cook_book'

class CookBookTest < Minitest::Test
  def setup
    @recipe1 = Recipe.new("Mac and Cheese")
    @recipe2 = Recipe.new("Cheese Burger")
    @cookbook = CookBook.new
  end


end
