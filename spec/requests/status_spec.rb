require 'rails_helper'

RSpec.describe 'Status requests' do
  describe 'GET /api/v1/restaurants' do
    it 'returns a status message' do
      get('/api/v1/restaurants')
          
      expect(response.status).to eq(200)
    end
  end
end