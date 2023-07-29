require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'
require './lib/card_generator'

system('clear')
generator = CardGenerator.new('./files/cards.txt')
round = Round.new(Deck.new(generator.cards))
round.start