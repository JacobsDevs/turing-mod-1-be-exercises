RSpec.describe Curator do
	describe '#initialize' do
		it 'exists and has an empty photographs array' do
			curator = Curator.new
			expect(curator).to be_an_instance_of(Curator)
			expect(curator.photographs).to eq([])
			expect(curator.artists).to eq([])
		end
	end

	describe 'Methods' do
		it 'can #add_photograph' do
			curator = Curator.new
			photo_1 = Photograph.new({
				id: "1",      
				name: "Rue Mouffetard, Paris (Boy with Bottles)",      
				artist_id: "1",      
				year: "1954"      
			})
			
			photo_2 = Photograph.new({
						id: "2",      
						name: "Moonrise, Hernandez",      
						artist_id: "2",      
						year: "1941"      
			})

			curator.add_photograph(photo_1)
			curator.add_photograph(photo_2)
			expect(curator.photographs).to eq([photo_1, photo_2])
		end
	  
		it 'can #add_artist' do
		  curator = Curator.new
			artist_1 = Artist.new({
				id: "1",      
				name: "Henri Cartier-Bresson",      
				born: "1908",      
				died: "2004",      
				country: "France"      
				})
				artist_2 = Artist.new({
						id: "2",      
						name: "Ansel Adams",      
						born: "1902",      
						died: "1984",      
						country: "United States"      
				})
				curator.add_artist(artist_1)
				curator.add_artist(artist_2)
				expect(curator.artists).to eq([artist_1, artist_2])
		end

		it 'can #find_artist_by_id' do
			curator = Curator.new
			artist_1 = Artist.new({
				id: "1",      
				name: "Henri Cartier-Bresson",      
				born: "1908",      
				died: "2004",      
				country: "France"      
				})
				artist_2 = Artist.new({
						id: "2",      
						name: "Ansel Adams",      
						born: "1902",      
						died: "1984",      
						country: "United States"      
				})
				curator.add_artist(artist_1)
				curator.add_artist(artist_2)
				expect(curator.find_artist_by_id("1")).to eq(artist_1)
		end
		before(:each) do
			@curator = Curator.new
			@artist_1 = Artist.new({
				id: "1",      
				name: "Henri Cartier-Bresson",      
				born: "1908",      
				died: "2004",      
				country: "France"      
				})
				@artist_2 = Artist.new({
						id: "2",      
						name: "Ansel Adams",      
						born: "1902",      
						died: "1984",      
						country: "United States"      
				})
				@artist_3 = Artist.new({
					id: "3",      
					name: "Willy Ronis",      
					born: "1910",      
					died: "2009",      
					country: "France"      
					})
			@curator.add_artist(@artist_1)
			@curator.add_artist(@artist_2)
			@curator.add_artist(@artist_3)
			@photo_1 = Photograph.new({
				id: "1",      
				name: "Portrait of Alberto Giacometti",      
				artist_id: "1",      
				year: "1938"      
			})
			@photo_2 = Photograph.new({
				id: "2",      
				name: "Behind the Gare Saint-Lazare",      
				artist_id: "1",      
				year: "1932"      
			})
			@photo_3 = Photograph.new({
				id: "3",      
				name: "Place Vendome",      
				artist_id: "3",      
				year: "1947"      
			})
			@photo_4 = Photograph.new({
				id: "4",      
				name: "Moon Over Half Dome",      
				artist_id: "2",      
				year: "1960"      
			})
			@photo_5 = Photograph.new({
				id: "5",      
				name: "Oak Tree, Snow Storm, Yosemite, from Portfolio One: Twelve Photographic Prints",      
				artist_id: "2",      
				year: "1948"      
			})
			@curator.add_photograph(@photo_1)
			@curator.add_photograph(@photo_2)
			@curator.add_photograph(@photo_3)
			@curator.add_photograph(@photo_4)
			@curator.add_photograph(@photo_5)
		end
		it 'can returns a list with #artist_photographs' do
		  expect(@curator.artist_photographs(@artist_1)).to eq([@photo_1, @photo_2])
		end
		it 'can return a hash of all #artists_and_photographs' do
			expect(@curator.artists_and_photographs).to eq({@artist_1=>[@photo_1, @photo_2], @artist_2=>[@photo_4, @photo_5], @artist_3=>[@photo_3]})
		end
		it 'can return an array of #artists_with_multiple_photographs' do
		  expect(@curator.artists_with_multiple_photographs).to eq([@artist_1, @artist_2])
		end
		it 'can return an array of #photographs_from_country' do
      expect(@curator.photographs_from_country("France")).to eq([@photo_1, @photo_2, @photo_3])
			expect(@curator.photographs_from_country("United States")).to eq([@photo_4, @photo_5])
		end
	end

	describe 'file_io compatability' do
	  it 'can #build_photographs' do
		  curator = Curator.new
			curator.build_photographs('./data/photographs.csv')
			expect(curator.photographs[0]).to be_an_instance_of Photograph
		end
		it 'can #build_artists' do
		  curator = Curator.new
			curator.build_artists('./data/artists.csv')
			expect(curator.artists[0]).to be_an_instance_of Artist
		end
	end

	describe 'Iteration 4 Methods' do
		it 'can list #photographs_in_date_range' do
		  curator = Curator.new
			curator.build_artists('./data/artists.csv')
			curator.build_photographs('./data/photographs.csv')
			expect(curator.photographs_in_date_range(1954..1962).length).to eq(2)
		end
		it 'can find #artist_age_when_photographed' do
			curator = Curator.new
			curator.build_artists('./data/artists.csv')
			curator.build_photographs('./data/photographs.csv')
			expect(curator.artist_age_when_photographed('Ansel Adams', 'Moonrise, Hernandez')).to eq(39)
		end
		it 'can #handle_artist' do
			curator = Curator.new
			curator.build_artists('./data/artists.csv')
			curator.build_photographs('./data/photographs.csv')
			artist_1 = Artist.new({
				id: "1",      
				name: "Henri Cartier-Bresson",      
				born: "1908",      
				died: "2004",      
				country: "France"      
				})
				curator.add_artist(artist_1)
			expect(curator.handle_artist(artist_1)).to be_an_instance_of Artist
			expect(curator.handle_artist("Henri Cartier-Bresson")).to be_an_instance_of Artist
		end
	end
end