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
    correct_counter()
  end

  def number_correct_by_category(category)
    turns.find_all do |turn|
      correct_counter() if category == turn.card.category
    end
    #correct_counter()
  end

  def correct_counter
    turns.count do |turn|
      turn.guess == turn.card.answer
    end
  end
end