class Print

  def initialize
    @turn_number = 0
  end

  def intro(cards)
    puts "Welcome! You're playing with #{cards.length} cards."
    puts "-------------------------------------------------"
  end

  def turn_number
    @turn_number += 1
  end

  def making_turn(cards, round)
    puts "This is card number #{turn_number} out of #{cards.length}."
    puts "Question: #{round.current_card().question}"

    puts "Guess: "
    guess = gets.chomp
    turn = round.take_turn(guess)
    puts turn.feedback()
  end
end