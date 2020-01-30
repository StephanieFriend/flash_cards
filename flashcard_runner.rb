require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/print'

print = Print.new
card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
card_4 = Card.new("What is the record for how many stitches knitted within 3 minutes?","255", :Hobby)
card_5 = Card.new("How many books are in the 'Harry Potter' series?", "7", :Hobby)
card_6 = Card.new("What is the top selling single toy?", "Rubik's cube", :Hobby)

cards = [card_1, card_2, card_3, card_4, card_5, card_6]
deck = Deck.new(cards)
round = Round.new(deck)

print.intro(cards)
cards.length.times {print.making_turn(cards, round)}
print.results(round, cards)
print.category_results(round, cards)

