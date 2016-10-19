require 'pry'
gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/night_read_translate.rb'


class NightReadTest < Minitest::Test

  def test_the_class_exists_at_all
    skip
    nightread = NightRead.new
    assert_equal NightRead, nightread.class
  end

  def test_it_contains_a_carrot
    skip
    handle = File.open("../lib/braille_2.txt", "r")
    incoming_text = handle.read
    handle.close
    nightread = NightRead.new(incoming_text)
    assert_equal "^i suck at coding!", nightread.translate_to_english
  end

  def test_it_capitalizes_carrot_letters
    skip
    nightread = NightRead.new("...0\n..0.\n.0..")
    assert_equal "I", nightread.translate_to_english
  end

  def test_it_does_not_capitalize_a_none_carrot_character
    skip
    nightread = NightRead.new(".0.0\n0.0.\n....")
    assert_equal "ii", nightread.translate_to_english
  end

  def test_find_carrot_returns_a_capital_letter_if_one_exists
    skip
    nightread = NightRead.new("...0\n..0.\n.0..")
    assert_equal "I", nightread.find_carrot(["^", "i"])
  end

  def test_find_carrot_returns_nil_if_no_capital_letter_exists
    skip
    nightread = NightRead.new(".0.0\n0.0.\n....")
    assert_equal "ii", nightread.find_carrot(["i", "i"])
  end

  def test_find_carrot_returns_a_word_with_a_capital_letter
    skip
    nightread = NightRead.new(".0.0\n0.0.\n....")
    assert_equal "Drew", nightread.find_carrot(["^", "d", "r", "e", "w"])
  end

  def test_find_carrot_returns_multiple_capital_letters
    skip
    nightread = NightRead.new(".0.0\n0.0.\n....")
    assert_equal "DrEw", nightread.find_carrot(["^", "d", "r", "^", "e", "w"])
  end


end
