require 'rspec'
require_relative '../lib/venue'

describe Venue do
  before(:each) do
		@venue = Venue.new('Bluebird', 4)
		@venue.add_patron('Mike')
		@venue.add_patron('Megan')
		@venue.add_patron('Bob')
	end

	describe '#initialize' do
    it 'is a venue' do
      expect(@venue).to be_a Venue
    end

    it 'can read the name' do
      expect(@venue.name).to eq 'Bluebird'
    end

    it 'can read the capacity' do
      expect(@venue.capacity).to eq 4
    end

    it 'has no patrons by default' do  
		  venue = Venue.new('Bluey', 4)
			expect(venue.patrons).to eq []
    end
  end

  # Iteration 2

  describe '#add_patron' do
    it 'returns a list of patrons' do
      expect(@venue.patrons).to eq ['Mike', 'Megan', 'Bob']
    end
  end

  describe '#yell_at_patrons' do
    it 'returns a list of uppercased names' do
      expect(@venue.yell_at_patrons).to eq ['MIKE', 'MEGAN', 'BOB']
    end
  end
	
	# Iteration 3
  describe '#over_capacity' do
		it 'returns false if not over capacity' do
			expect(@venue.over_capacity?).to eq false
		end
		
		it 'returns true if over capacity' do
			@venue.add_patron('James')
			@venue.add_patron('Cat')
			expect(@venue.over_capacity?).to eq true
		end
	end

	# Iteration 4
	describe '#kick_out' do
		it 'will not kick_out unless over capacity' do
			@venue.add_patron('James')
			expected = @venue.patrons
			@venue.kick_out
      expect(@venue.patrons).to eq expected
		end

		it 'kicks out last to enter if over capacity until under capacity' do
			@venue.add_patron('James')
			@venue.add_patron('Bobbie')
			@venue.add_patron('Jamie')
			@venue.kick_out
      expect(@venue.patrons).to eq ['Mike', 'Megan', 'Bob', 'James']
		end
	end
end