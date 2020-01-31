require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './lib/card_generator'

class CardGeneratorTest < Minitest::Test

  def test_it_exists
    card_generator = CardGenerator.new("lib/cards.txt")

    assert_instance_of CardGenerator, card_generator
  end

  def test_it_has_attributes
    card_generator = CardGenerator.new("lib/cards.txt")

    assert_equal "lib/cards.txt", card_generator.file_name
  end

  def test_it_can_break_up_lines_of_file_and_return_new_card
    card_generator = CardGenerator.new("lib/cards.txt")

    assert_equal "What is the capital of Alaska?", card_generator.cards.first.question
  end
end