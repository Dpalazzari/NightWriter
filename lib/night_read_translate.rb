require '../lib/characters.rb'
require 'pry'

class NightRead

  attr_reader :input,
              :library

  def initialize(input)
    @input = input
    @library = Characters.new

  end

  def split_braille
    braille_chars = input.split("\n")
    creating_braille_groups(braille_chars)
  end

  def creating_braille_groups(braille_chars)
    letter_1 = braille_chars[0].scan(/../)
    letter_2 = braille_chars[1].scan(/../)
    letter_3 = braille_chars[2].scan(/../)
    letters = letter_1.zip(letter_2, letter_3)
    decipher_english_chars(letters)
  end

  def decipher_english_chars(letters)
    translated = letters.map do |letter|
      library.letters[letter]
    end
    find_caps_and_nums(translated)
  end

  def find_caps_and_nums(translated)
    final_phrase = []
    while translated.length > 0
      current_letter = translated.shift
      if current_letter == "^"
        current_letter = translated.shift.capitalize
      elsif current_letter == "#"
        current_letter = translated.shift
        current_letter = library.switch_characters[current_letter]
      end
      final_phrase << current_letter
    end
    final_phrase.join
  end




end
