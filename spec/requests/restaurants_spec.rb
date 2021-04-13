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

  describe " DELETE /api/v1/restaurants/:id" do
    context "the user has authentication token" do
      it "returns 204 when user is authorized" do
        user = User.create!(email:"max@amodei", password:"123456")
        restaurant = Restaurant.create!(name:"Mcdonalds", address:"Blvrd streeet 1234", user: user)
        
        delete "/api/v1/restaurants/#{restaurant.id}",  headers: { 'X-User-Email': user.email, 'X-User-Token': user.authentication_token }
        
        expect(response.status).to eq(204)
      end
    end
    context "does not have token" do
      it "returns 401 when user is not authorized" do
        user = User.create!(email:"max@amodei", password:"123456")
        restaurant = Restaurant.create!(name:"Mcdonalds", address:"Blvrd streeet 1234", user: user)
        
       delete "/api/v1/restaurants/#{restaurant.id}"
  
        expect(response.status).to eq(401)
      end
    end
  end

end




