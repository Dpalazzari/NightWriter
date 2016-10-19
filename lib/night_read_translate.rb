require '../lib/characters.rb'
require 'pry'

class NightRead

  attr_reader :input,
              :library,
              :switch_characters

  def initialize(input)
    @input = input
    codex = Characters.new
    @library = codex.letters
    @switch_characters = codex.switch_characters
  end

  def translate_to_english
    new_input = @input.split("\n")
    letter_1 = new_input[0].scan(/../)
    letter_2 = new_input[1].scan(/../)
    letter_3 = new_input[2].scan(/../)

    letters = letter_1.zip(letter_2, letter_3)
    translated = letters.map do |letter|
      @library[letter]
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
