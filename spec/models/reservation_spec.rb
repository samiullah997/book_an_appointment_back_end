require 'rails_helper'

RSpec.describe Reservation, type: :model do
  let(:user) { User.create(name: 'name', email: 'all@email1.com', password: 'password') }
  let(:bike) do
    Bike.create(name: 'AlusiA', bike_image: 'https://imgd.aeplcdn.com/', bike_type: 'HNDA', description: 'Tption',
                brand: 'This Brand', daily_rate: '2000', user_id: user.id)
  end
  let(:valid_attributes) do
    { date: '2021-03-01', user_id: user.id, bike_id: bike.id }
  end
  it 'is valid with valid attributes' do
    subject = Reservation.new(valid_attributes)
    expect(subject).to be_valid
  end

  it 'is not valid without a bike_id' do
    reservation = Reservation.new(valid_attributes.except(:bike_id))
    expect(reservation).to be_valid
  end
  it 'is not valid without a user_id' do
    reservation = Reservation.new(valid_attributes.except(:user_id))
    expect(reservation).to be_valid
  end
end
