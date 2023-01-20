require 'rails_helper'

RSpec.describe '/reservation', type: :request do
  let(:user) { User.create!(name: 'name', email: 'bb@email.com', password: 'password') }
  let(:bike) do
    Bike.create!(name: 'AlusiA', bike_image: 'https://imgd.aeplcdn.com/', bike_type: 'HNDA', description: 'Tption',
                 brand: 'This Brand', daily_rate: '2000', user_id: user.id)
  end
  let(:valid_attributes) do
    { date: Date.today, user_id: user.id, bike_id: bike.id }
  end
  let(:invalid_attributes) do
    { bike_id: nil, user_id: nil, reservation_date: nil, due_date: nil }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Reservation.create! valid_attributes
      get api_v1_reservations_url, as: :json
      expect(response).to be_successful
    end
  end
  describe 'GET /show' do
    it 'renders a successful response' do
      reservation = Reservation.create! valid_attributes
      get api_v1_reservation_url(reservation), as: :json
      expect(response).to be_successful
    end
  end
  describe 'POST /create' do
    context 'with valid parameters' do
      it 'renders a JSON response with the new reservation' do
        post api_v1_reservations_url,
             params: { reservation: valid_attributes }, as: :json

        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end
end
