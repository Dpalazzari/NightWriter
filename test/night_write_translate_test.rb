require 'pry'
gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/night_write_translate.rb'


class NightWriteTest < Minitest::Test

    def test_the_class_exists_at_all
      nightwrite = NightWrite.new("turtle")
      assert_equal NightWrite, nightwrite.class
    end

    def test_it_initializes_with_arguments
      nightwrite = NightWrite.new("turtle")
      assert_equal "turtle", nightwrite.input
    end

    def test_it_will_identify_the_library_from_the_alphabet_class
      nightwrite = NightWrite.new("turtle")
      assert_equal ["0.", "..", ".."], nightwrite.library["a"]
    end

    def test_it_returns_an_array
      nightwrite = NightWrite.new("car")
      array = [["00", "..", ".."], ["0.", "..", ".."], ["0.", "00", "0."]]
      assert nightwrite.translate_to_braille
    end

    def test_it_will_transpose_into_three_arrays
      nightwrite = NightWrite.new("car")
      new_array = ["000.0.", "....00", "....0."]
      assert nightwrite.translate_to_braille
    end

    def test_it_will_create_rows
      nightwrite = NightWrite.new("car")
      row_1 = "000.0."
      row_2 = "....00"
      row_3 = "....0."
      assert nightwrite.translate_to_braille
    end

    def test_it_can_translate_one_capital_letter
      nightwrite = NightWrite.new("T")
      assert_equal "...0\n..00\n.00.", nightwrite.translate_to_braille
    end

    def test_it_can_capitalize_two_letters
      nightwrite = NightWrite.new("TT")
      assert_equal "...0...0\n..00..00\n.00..00.", nightwrite.translate_to_braille
    end

    def test_it_can_have_one_lower_case_and_one_capital
      nightwrite = NightWrite.new("Tt")
      assert_equal "...0.0\n..0000\n.00.0.", nightwrite.translate_to_braille
    end

    def test_it_can_print_multiple_caps_in_a_word
      nightwrite = NightWrite.new("CaR")
      assert_equal "..000...0.\n........00\n.0.....00.", nightwrite.translate_to_braille
    end

    def test_it_can_print_one_number
      nightwrite = NightWrite.new("1")
      assert_equal ".00.\n.0..\n00..", nightwrite.translate_to_braille
    end

    def test_it_can_print_two_numbers_one_letter
      nightwrite = NightWrite.new("1r3")
      assert_equal ".00.0..000\n.0..00.0..\n00..0.00..", nightwrite.translate_to_braille
    end

    def test_it_can_print_one_number_and_one_capital_letter
      nightwrite = NightWrite.new("5T")
      assert_equal ".00....0\n.0.0..00\n00...00.", nightwrite.translate_to_braille
    end

    def test_it_can_print_capital_letters_numbers_and_lowercase_letters
      nightwrite = NightWrite.new("C4r")
      assert_equal "..00.0000.\n.....0.000\n.0..00..0.", nightwrite.translate_to_braille
    end
end
