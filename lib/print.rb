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

  def results(round, cards)
    puts "****** Game over! ******"
    puts "You had #{round.number_correct} correct guesses out of #{cards.length} for a total score of #{round.percent_correct.to_i}%."
  end

  def category_results(round, cards)
    new_categories = cards.group_by do |card|
      card.category
    end
    new_categories.keys.each do |key|
      puts "#{key} - #{round.percent_correct_by_category(key)}% correct"
    end
  end
end