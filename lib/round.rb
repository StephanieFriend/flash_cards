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
    deck.cards.rotate!(1)
    turns.empty? ? turns[0] = turn : turns << turn
  end

  def number_correct
    number_correct_by_category()
  end

  def number_correct_by_category(category = "ALL")
    turns.count do |turn|
      turn.guess == turn.card.answer if category == turn.card.category || category == "ALL"
    end
  end

  def percent_correct
    percent_correct_by_category()
  end

  def percent_correct_by_category(category = "ALL")
    turn = turns.count do |turn|
      category == turn.card.category || category == "ALL"
    end
    (number_correct_by_category(category) / turn.to_f) * 100
  end
end