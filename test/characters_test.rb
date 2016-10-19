require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/characters.rb'

class CharactersTest < Minitest::Test

  def test_the_class_exists_at_all
    characters = Characters.new
    assert_equal Characters, characters.class
  end

  def test_it_can_find_an_english_letter_from_a_braille_array
    characters = Characters.new
    assert_equal "a", characters.letters[["0.", "..", ".."]]
  end

  def test_it_can_find_a_number
    characters = Characters.new
    assert_equal "1", characters.numbers[["0.", "..", ".."]]
  end

  def test_it_can_switch_to_a_number_from_a_letter
    characters = Characters.new
    assert_equal "0", characters.switch_characters["j"]
  end
end
