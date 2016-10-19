require '../lib/characters.rb'
require 'pry'

class NightRead

  attr_reader :library,
              :num,
              :inverse_num,
              :switch_characters,
              :inverse_library

  def initialize(input)
    @input = input
    codex = Characters.new
    @library = codex.letters
    @num = codex.numbers
    @switch_characters = codex.switch_characters
    @inverse_num = @num.invert
    @inverse_library = @library.invert
  end

  def translate_to_english
    new_input = @input.split("\n")
    index_input_1 = new_input[0]
    index_input_2 = new_input[1]
    index_input_3 = new_input[2]

    letter_1 = index_input_1.scan(/../)
    letter_2 = index_input_2.scan(/../)
    letter_3 = index_input_3.scan(/../)

    letters = letter_1.zip(letter_2, letter_3)
    translated = letters.map do |letter|
      @inverse_library[letter]
    end
    carrots_and_pounds(translated)
  end

  def carrots_and_pounds(translated)
    final_phrase = []
    while translated.length > 0
      current_letter = translated.shift
      if current_letter == "^"
        current_letter = translated.shift
        current_letter = current_letter.capitalize
      elsif current_letter == "#"
        current_letter = translated.shift
        current_letter = @switch_characters[current_letter]
      end
      final_phrase << current_letter
    end
    final_phrase.join
  end




end
