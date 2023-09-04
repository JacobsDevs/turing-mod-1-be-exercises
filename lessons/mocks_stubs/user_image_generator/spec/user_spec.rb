require 'rspec'
require './lib/image_generator'
require './lib/user'

RSpec.describe User do
  describe '#initialize' do
    it 'exists' do
      # I pass a real image generator object - this is potentially slow and costly
      # Lets mock this object whenever possible
      image = double(20)
      user = User.new("t@gmail.com", image)
      expect(user).to be_a User
    end

    it 'has attributes' do
      #I don't need an actual ImageGenerator object. I use a mock instead.
      mock_image_generator = instance_double("Image", max_image_size: 45)
      user = User.new("t@gmail.com", mock_image_generator)

      expect(user.email).to eq "t@gmail.com"
      expect(user.image_generator).to eq mock_image_generator
    end
  end

	describe 'Methods' do
	  it 'can #change_id_via_user_input' do
		  mock = instance_double("a", max_image_size: 10)
			user = User.new("t@gmail.com", mock)
			
			allow(user).to receive(:gets).and_return('5')
			user.change_id_via_user_input

			expect(user.id).to eq(5)
		end

		it 'can #add_image_generators' do
			mock = instance_double("a", max_image_size: 3)
			user = User.new("t@gmail.com", mock)
			
      allow(mock).to receive(:generate_images).and_return(["image0", "image1", "image2"])
			expect(user.add_image_history(user.create_images)).to eq([["image0", "image1", "image2"]])
		end

		it 'can #assign_new_random_image' do
			mock = instance_double("a", max_image_size: 3)
			user = User.new("t@gmail.com", mock)
			
			allow(mock).to receive(:generate_images).and_return(["image0"])
			allow(user).to receive(:image).and_return("image0")
			expect(user.assign_new_random_image).to eq(["image0"])
			expect(user.profile_image).to eq("image0")
			
		end
	end
end
