require './lib/deck'
require './lib/round'
require './lib/print'
require './lib/card_generator'

print = Print.new

filename = "lib/cards.txt"
cards = CardGenerator.new(filename).cards

deck = Deck.new(cards)
round = Round.new(deck)

print.start(cards, round)

