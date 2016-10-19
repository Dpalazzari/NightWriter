require '../lib/writer_alphabet.rb'
require 'pry'

class NightWrite

  attr_reader :input,
              :library,
              :new_array,
              :row_1,
              :row_2,
              :row_3

  def initialize(input)
    @input = input
    codex = WriterAlphabet.new
    @library = codex.letters
    @new_array = new_array
    @row_1 = row_1
    @row_2 = row_2
    @row_3 = row_3
  end

  def translate_to_braille
    array = input.chomp.chars.map do |letter|
      @library[letter]
    end
    @new_array = array.transpose.map do |letter|
      letter.join
    end
    rows
  end

  def rows
    @row_1 = @new_array[0]
    @row_2 = @new_array[1]
    @row_3 = @new_array[2]
    translated = "#{@row_1}\n#{@row_2}\n#{@row_3}"
  end
end


# translate = NightWrite.new("turtle")
# translate.translate_to_braille
