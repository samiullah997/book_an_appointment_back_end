require 'swagger_helper'

describe 'Bike API' do

  path '/api/v1/bikes' do

    post 'Creates a bike' do
      tags 'Bikes'
      consumes 'application/json', 'application/xml'
      parameter name: :bike, in: :body, schema: {
        type: :object,
        properties: {
          id: { type: :integer },
          name: { type: :string },
          bike_image: { type: :string },
          bike_type: { type: :string },
          description: { type: :string },
          brand: { type: :string },
          daily_rate: { type: :string },
          user_id: { type: :integer }
        },
        required: [ 'id', 'name', 'bike_image', 'bike_type', 'description', 'brand', 'daily_rate', 'user_id' ]
      }

      response '201', 'Bike created' do
        let(:bike) { { name: "AlusiA", bike_image: "https://imgd.aeplcdn.com/1280x720/n/cw/ec/43482/sp-125-right-front-three-quarte
r-2.jpeg?isig=0&q=80", bike_type: "HNDA", description: "Tption", brand: "This Brand", daily_rate: "2000", user_id: 1 } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:bike) { { name: 'foo' } }
        run_test!
      end
    end
  end

  path '/api/v1/bikes/{id}' do

    get 'Retrieves a bike' do
      tags 'Bikes'
      produces 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :string

      response '200', 'name found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            name: { type: :string },
            bike_image: { type: :string },
            bike_type: { type: :string },
            description: { type: :string },
            brand: { type: :string },
            daily_rate: { type: :string },
          user_id: { type: :integer }
          },
          required: [ 'id', 'name', 'bike_image', 'bike_type', 'description', 'brand', 'daily_rate', 'user_id' ]

        let(:id) { Bike.create(name: "AlusiA", bike_image: "https://imgd.aeplcdn.com/1280x720/n/cw/ec/43482/sp-125-right-front-three-quarte
r-2.jpeg?isig=0&q=80", bike_type: "HNDA", description: "Tption", brand: "This Brand", daily_rate: "2000", user_id: 1 ).id }
        run_test!
      end

      response '404', 'bike not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end