require 'rails_helper'

RSpec.describe ' bikes', type: :request do
  let(:user) { User.create!(name: 'name', email: 'all@email.com', password: 'password') }
  let(:valid_attributes) do
    { name: 'AlusiA', bike_image: 'https://imgd.aeplcdn.com/', bike_type: 'HNDA', description: 'Tption', brand: 'This Brand', daily_rate: '2000', user_id: user.id }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Bike.create! valid_attributes
      get api_v1_bikes_path
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'renders a JSON response with the new s' do
        post api_v1_bikes_url, params: { bike: valid_attributes }, as: :json
        expect(response).to be_successful
      end
    end
  end
end
