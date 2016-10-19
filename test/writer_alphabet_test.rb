require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/writer_alphabet.rb'

class WriterAlphabetTest < Minitest::Test

  def test_the_writer_alphabet_class_exists
    writer_alphabet = WriterAlphabet.new
    assert_equal WriterAlphabet, writer_alphabet.class
  end

  def test_user_can_pull_the_value_from_the_key
    writer_alphabet = WriterAlphabet.new
    assert_equal ["0.", "..", ".."], writer_alphabet.letters["a"]
  end

end
