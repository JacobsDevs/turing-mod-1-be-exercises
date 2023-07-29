require './lib/card'

require './lib/turn'

require './lib/deck'

require './lib/round'

card1 = Card.new('What is the capital of Alaska?', 'Juneau', :Geography)
card2 = Card.new('What is the capital of Victoria?', 'Melbourne', :Geography)
card3 = Card.new('Who is the lead singer of The Arctic Monkeys', 'Alex Turner', :Music)

RSpec.describe Round do
  it 'exists' do
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    round = Round.new(deck)

    expect(round).to be_instance_of(Round)
  end

  it 'has a deck' do
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    round = Round.new(deck)

    expect(round.deck).to eq(deck)
  end

  it 'has turns' do
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    round = Round.new(deck)

    expect(round.turns).to eq([])
  end

  it 'returns the first card in deck' do
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    round = Round.new(deck)

    expect(round.current_card).to eq(card1)
  end

  it 'can take a new turn' do
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    new_turn = round.take_turn('Juneau')

    expect(new_turn).to be_instance_of(Turn)
  end

  it 'stores new turns' do
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    new_turn = round.take_turn('Juneau')

    expect(round.turns[0]).to eq(new_turn)
  end

  it 'checks turn answer' do
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    new_turn = round.take_turn('Juneau')

    expect(new_turn.correct?).to eq(true)
  end

  it 'collects turns' do
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    new_turn = round.take_turn('Juneau')

    expect(round.turns).to eq([new_turn])
  end

  it 'counts correct turns' do
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    round.take_turn('Juneau')

    expect(round.number_correct).to eq(1)
  end

  it 'handles multiple rounds' do
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    round.take_turn('Juneau')
    round.take_turn('Melbourne')

    expect(round.number_correct).to eq(2)
  end

  it 'gives human readable feedback' do
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    round.take_turn('Juneau')
    round.take_turn('Melbourne')

    expect(round.turns.last.feedback).to eq('Correct!')
  end

  it 'counts correct turns by category' do
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    round.take_turn('Juneau')
    round.take_turn('Melbourne')
    round.take_turn('Alex Turner')

    expect(round.number_correct_by_category(:Geography)).to eq(2)
  end

  it 'counts correct turns by percentage' do
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    round.take_turn('Juneau')
    round.take_turn('Melbourne')
    round.take_turn('Alex Turne')

    expect(round.percent_correct).to eq(66.67)
  end

  it 'counts correct turns by percentage by category' do
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    round = Round.new(deck)
    round.take_turn('Juneau')
    round.take_turn('Not Melbourne')
    round.take_turn('Alex Turner')

    expect(round.percent_correct_by_category(:Geography)).to eq(50.0)
  end
end
