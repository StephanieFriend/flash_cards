require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/turn'

class TurnTest < Minitest::Test

  def test_it_exists
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_instance_of Turn, turn
  end

  def test_it_has_attributes
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn = Turn.new("Juneau", card)

    assert_equal "Juneau", turn.guess
    assert_equal card, turn.card
  end

  def test_it_can_return_if_guess_is_correct
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn1 = Turn.new("Juneau", card1)

    assert_equal true, turn1.correct?

    card2 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn2 = Turn.new("Denver", card2)

    assert_equal false, turn2.correct?
  end

  def test_it_can_give_feedback
    card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn1 = Turn.new("Juneau", card1)

    assert_equal "Correct!", turn1.feedback

    card2 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    turn2 = Turn.new("Denver", card2)

    assert_equal "Incorrect.", turn2.feedback
  end
end