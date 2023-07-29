require './lib/turn'
require './lib/card'

card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)

RSpec.describe Turn do
  it 'exists' do
		turn = Turn.new("Juneau", card)

    expect(turn).to be_instance_of(Turn)
  end

  it 'has a guess' do
    turn = Turn.new("Juneau", card)

		expect(turn.guess).to eq("Juneau")
  end

  it 'has a valid card' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
		turn = Turn.new("Juneau", card)
    expect(turn.card).to be_instance_of(Card)
  end

  it 'can compare guess with answer' do
    card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
		turn = Turn.new("Juneau", card)
    expect(turn.correct?).to eq(true || false)
  end

	it 'returns feedback if user is correct'  do
		card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
		turn = Turn.new("Juneau", card)
		expect(turn.feedback).to eq("Correct!")
	end

	it 'returns feedback if user is incorrect'  do
		card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
		turn = Turn.new("Sydney", card)
		expect(turn.feedback).to eq("Incorrect.")
	end
end
