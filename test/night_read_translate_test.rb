require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/night_read_translate.rb'


class NightReadTest < Minitest::Test

  def test_the_class_exists_at_all
    skip
    nightread = NightRead.new
    assert_equal NightRead, nightread.class
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

  def test_translate_can_work_for_uppercase_and_lowercase_at_same_time
    nightread = NightRead.new("..000.\n...000\n.0..0.")
    assert_equal "Dr", nightread.translate_to_english
  end

  def test_it_can_find_the_pound_symbol
    nightread = NightRead.new(".0\n.0\n00")
    assert_equal "#", nightread.translate_to_english
  end

  def test_it_can_access_the_numbers_method_in_character_class
    nightread = NightRead.new(".0\n00\n..")
    nightread.translate_to_english
    assert_equal "0", nightread.inverse_num[[".0", "00", ".."]]
  end


end
