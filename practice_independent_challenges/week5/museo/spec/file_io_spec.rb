RSpec.describe FileIo do
	describe '#intialize' do
		it 'exists' do
			io = FileIo.new
			expect(io).to be_an_instance_of(FileIo)
		end
	end
	describe 'Methods' do
	  it 'can #open_data' do
			io = FileIo.new
			expect(io.open_data('./data/artists.csv')).to be_an_instance_of(CSV::Table)
		end
	end
end