require '../lib/writer_alphabet.rb'
require 'pry'

class NightWrite

  attr_reader :input,
              :library

  def initialize(input)
    @input = input
    @library = WriterAlphabet.new.letters
  end

  def translate_to_braille
    single_letters = input.chars.map do |letter|
      @library[letter]
    end
    braille = transposing(single_letters)
    rows(braille)
  end

  def transposing(single_letters)
    single_letters.transpose.map do |letter|
      letter.join
    end
  end

  def rows(braille)
    row_1 = braille[0]
    row_2 = braille[1]
    row_3 = braille[2]
    translated = "#{row_1}\n#{row_2}\n#{row_3}"
  end
end


# translate = NightWrite.new("turtle")
# translate.translate_to_braille
