require 'swagger_helper'

describe 'User API' do
  path '/api/v1/users' do
    post 'Creates a user' do
      tags 'Users'
      consumes 'application/json', 'application/xml'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          id: { type: :integer },
          email: { type: :string },
          name: { type: :string },
          username: { type: :string },
          encrypted_password: { type: :string },
          image: { type: :string }
        },
        required: %w[id email name username encrypted_password]
      }

      response '201', 'User created' do
        let(:user) { { email: 'alusinejalloh@gmail.com', name: 'Jalloh', username: 'AJ', image: 'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80', encrypted_password: '12345678' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:user) { { name: 'foo' } }
        run_test!
      end
    end
  end

  path '/api/v1/users/{id}' do
    get 'Retrieves a user' do
      tags 'User'
      produces 'application/json', 'application/xml'
      parameter name: :id, in: :path, type: :string

      response '200', 'name found' do
        schema type: :object,
               roperties: {
                 id: { type: :integer },
                 email: { type: :string },
                 name: { type: :string },
                 username: { type: :string },
                 encrypted_password: { type: :string },
                 image: { type: :string }
               },
               required: %w[id email name username encrypted_password]

        let(:id) { User.create(email: 'alusinejalloh@gmail.com', name: 'Jalloh', username: 'AJ', image: 'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=580&q=80', encrypted_password: '12345678').id }
        run_test!
      end

      response '404', 'user not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
