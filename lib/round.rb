require './lib/turn'

ALL_CATEGORIES = "ALL"

class Round

  attr_reader :deck,
              :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def current_card
    deck.cards.first
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card())
    turns << turn
    deck.cards.rotate!(1)
    turn
  end

  def number_correct
    number_correct_by_category()
  end

  def number_correct_by_category(category = ALL_CATEGORIES)
    turns.count do |turn|
      turn.guess == turn.card.answer if category == turn.card.category || category == ALL_CATEGORIES
    end
  end

  def percent_correct
    percent_correct_by_category()
  end

  def percent_correct_by_category(category = ALL_CATEGORIES)
    turn = turns.count do |turn|
      category == turn.card.category || category == ALL_CATEGORIES
    end
    ((number_correct_by_category(category) / turn.to_f) * 100).round(1)
  end
end