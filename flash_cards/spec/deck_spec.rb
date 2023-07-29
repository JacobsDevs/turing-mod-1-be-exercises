require './lib/card'
require './lib/deck'

card1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
card2 = Card.new("What is the capital of Victoria?", "Melbourne", :Geography)
card3 = Card.new("Who is the lead singer of The Arctic Monkeys", "Alex Turner", :Music)
cards = [card1, card2, card3]

RSpec.describe Deck do
  it 'exists' do
		deck = Deck.new(cards)

    expect(deck).to be_instance_of(Deck)
  end

	it 'contains cards' do
		deck = Deck.new(cards)
		
		expect(deck.cards).to eq(cards)
	end

	it 'counts cards' do
		deck = Deck.new(cards)

		expect(deck.count).to eq(3)
	end

	it 'returns cards by category' do
	  deck = Deck.new(cards)

		expect(deck.cards_in_category(:Music)).to eq([card3])
  end

	it 'doesn\'t return cards when category doesn\'t exist' do
		deck = Deck.new(cards)

		expect(deck.cards_in_category(:Math)).to eq([])
	end
end
