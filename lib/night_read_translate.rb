require '../lib/alphabet.rb'

class NightRead

  attr_reader :library,
              :inverse_library

  def initialize(input)
    @input = input
    codex = Alphabet.new
    @library = codex.letters
    @inverse_library = @library.invert
  end

  def remove_line_break
    @new_input = @input.split("\n")
    index_input_1 = @new_input[0]
    index_input_2 = @new_input[1]
    index_input_3 = @new_input[2]

    letter_1 = index_input_1.scan(/../)
    letter_2 = index_input_2.scan(/../)
    letter_3 = index_input_3.scan(/../)

    letters = letter_1.zip(letter_2, letter_3)

    translated = letters.map do |letter|
      @inverse_library[letter]
    end
    final_phrase = translated.join
  end

end

# test = NightRead.new("000.00\n.0.000\n..0...")
# test.remove_line_break
