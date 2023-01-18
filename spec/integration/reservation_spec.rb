require 'swagger_helper'

describe 'Reservation API' do
  path '/api/v1/reservations' do
    post 'Creates a reservation' do
      tags 'Reservations'
      consumes 'application/json', 'application/xml'
      parameter name: :reservation, in: :body, schema: {
        type: :object,
        properties: {
          id: { type: :integer },
          reserve: { type: :boolean },
          date: { type: :string },
          bike_id: { type: :integer },
          user_id: { type: :integer }
        },
        required: %w[id reserve date bike_id user_id]
      }

      response '201', 'reservation created' do
        let(:reservation) { { reserve: true, date: '2023-01-18', bike_id: 6, user_id: 1 } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:reservation) { { name: 'foo' } }
        run_test!
      end
    end
  end

  path '/api/v1/reservations/{id}' do
    get 'Retrieves a reservation' do
      tags 'Reservation'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'name found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 reserve: { type: :boolean },
                 date: { type: :string },
                 bike_id: { type: :integer },
                 user_id: { type: :integer }
               },
               required: %w[id reserve date bike_id user_id]

        let(:id) { Reservation.create(reserve: true, date: '2023-01-18', bike_id: 6, user_id: 1).id }
        run_test!
      end

      response '404', 'reservation not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
