require 'rails_helper'

RSpec.describe 'Restaurants requests' do
  describe 'GET /api/v1/restaurants' do
    it 'returns a status message' do
      get('/api/v1/restaurants')

      expect(response.status).to eq(200)
    end

    it "returns the created restaurant" do
      user = User.create!(email:"max@amodei", password:"123456")
      Restaurant.create!(name:"Mcdonalds", address:"Blvrd streeet 1234", user: user)

      get('/api/v1/restaurants')
      
      array = JSON.parse(response.body)

      expect(array[0]["name"]).to eq("Mcdonalds")
    end
  end
end




