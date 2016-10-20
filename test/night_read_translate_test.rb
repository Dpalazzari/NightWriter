require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/night_read_translate.rb'


class NightReadTest < Minitest::Test

  def test_the_class_exists_at_all
    nightread = NightRead.new("...0\n..0.\n.0..")
    assert_equal NightRead, nightread.class
  end

  def test_it_capitalizes_carrot_letters
    nightread = NightRead.new("...0\n..0.\n.0..")
    assert_equal "I", nightread.split_braille
  end

  def test_it_does_not_capitalize_a_lowercase_character
    nightread = NightRead.new(".0.0\n0.0.\n....")
    assert_equal "ii", nightread.split_braille
  end

  def test_find_caps_and_nums_returns_nil_if_no_capital_letter_exists
    nightread = NightRead.new(".0.0\n0.0.\n....")
    assert_equal "ii", nightread.find_caps_and_nums(["i", "i"])
  end

  def test_find_carrot_returns_a_word_with_a_capital_letter
    nightread = NightRead.new(".0.0\n0.0.\n....")
    assert_equal "Drew", nightread.find_caps_and_nums(["^", "d", "r", "e", "w"])
  end

  def test_translate_can_work_for_uppercase_and_lowercase_at_same_time
    nightread = NightRead.new("..000.\n...000\n.0..0.")
    assert_equal "Dr", nightread.split_braille
  end

  def test_it_can_find_the_pound_symbol
    nightread = NightRead.new(".0\n.0\n00")
    assert_equal "#", nightread.library.letters[[".0", ".0", "00"]]
  end

  def test_it_can_print_one_number
    nightread = NightRead.new(".0.0\n.00.\n00..")
    assert_equal "9", nightread.split_braille
  end

  def test_it_can_print_two_numbers
    nightread = NightRead.new(".0.0.0.0\n.00..00.\n00..00..")
    assert_equal "99", nightread.split_braille
  end

  def test_it_can_translate_a_capital_letter_and_a_number
    nightread = NightRead.new(".0.0..0.\n.00...0.\n00...00.")
    assert_equal "9L", nightread.split_braille
  end

  def test_it_can_print_a_lowercase_letter_uppercase_letter_and_a_number
    nightread = NightRead.new(".0.0..0.00\n.00...0...\n00...00.00")
    assert_equal "9Lx", nightread.split_braille
  end

  def test_it_can_print_a_number_a_capital_letter_a_lowercase_letter_and_a_special_character
    nightread = NightRead.new(".0.0..0.00..\n.00...0...00\n00...00.000.")
    assert_equal "9Lx!", nightread.split_braille
  end




end
