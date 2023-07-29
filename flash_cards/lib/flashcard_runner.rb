require './lib/card'
require './lib/deck'
require './lib/round'
require './lib/turn'


card1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
card2 = Card.new('What is the capital of Victoria?', 'Melbourne', :Geography)
card3 = Card.new('Who is the lead singer of The Arctic Monkeys', 'Alex Turner', :Music)
deck = Deck.new([card1, card2, card3])
round = Round.new(deck)
round.start