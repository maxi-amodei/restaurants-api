require 'rails_helper'

RSpec.describe 'Restaurants requests' do
  describe 'GET /api/v1/restaurants' do
    it 'returns a status message' do
      get('/api/v1/restaurants')

      expect(response.status).to eq(200)
    end
    it "returns the created restaurant" do
      create_restaurant("max@amodei", 123456, "Mcdonalds", "Blvrd streeet 1234")
      get('/api/v1/restaurants')
      
      array = JSON.parse(response.body)

      expect(array[0]["name"]).to eq("Mcdonalds")
    end
  end

  describe " DELETE /api/v1/restaurants/:id" do
    context "the user has authentication token" do
      it "returns 204 when user is authorized" do
        
        restaurant = create_restaurant("max@amodei", 123456, "Mcdonalds", "Blvrd streeet 1234")
        
        delete "/api/v1/restaurants/#{restaurant.id}",  headers: { 'X-User-Email': restaurant.user.email, 'X-User-Token': restaurant.user.authentication_token }
        
        expect(response.status).to eq(204)
      end
    end
    context "the user does not have authentication token" do
      it "returns 401 when user is not authorized" do
        restaurant = create_restaurant("max@amodei", 123456, "Mcdonalds", "Blvrd streeet 1234")
        
       delete "/api/v1/restaurants/#{restaurant.id}"
  
        expect(response.status).to eq(401)
      end
    end
  end

  describe "POST /api/v1/restaurants " do
    context "authenticated user creates a new restaurant" do
      it "returns 200" do
        user = create_user("max@amodei", 123456)
        post "/api/v1/restaurants", params: { "restaurant": { "name": "Mcdonalds", "address": "Blvrd strt" } }, headers: { 'X-User-Email': user.email, 'X-User-Token': user.authentication_token }
        
        expect(response.status).to eq(200)
      end
    end
    context "Authenticated user but invalid restaurant params" do
      it "returns 422" do
        user = create_user("max@amodei", 123456)
        post "/api/v1/restaurants", params: { "restaurant": { "name": "", "address": "" } }, headers: { 'X-User-Email': user.email, 'X-User-Token': user.authentication_token }
        
        expect(response.status).to eq(422)
      end
    end
    context "Unauthenticated user creates restaurant" do
      it "returns 401" do
        user = create_user("max@amodei", 123456)
        post "/api/v1/restaurants", params: { "restaurant": { "name": "Mcdonalds", "address": "Blvrd strt" } }, headers: { 'X-User-Email': "not_a_user@gmail.com", 'X-User-Token': "xhxhsdhshsnsn786" }
        
        expect(response.status).to eq(401)
      end
    end
  end

  describe "PATCH /api/v1/restaurants/:id" do
    context "Authenticated and params correct" do
      it "returns 200" do
        restaurant = create_restaurant("max@amodei", 123456, "Mcdonalds", "Blvrd streeet 1234")
          
          patch "/api/v1/restaurants/#{restaurant.id}", params: { "restaurant": { "name": "Mcdonald's", "address": "Blvrd strt" } },  headers: { 'X-User-Email': restaurant.user.email, 'X-User-Token': restaurant.user.authentication_token }
        
          expect(response.status).to eq(200)
      end
    end
  end
end




