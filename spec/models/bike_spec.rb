require 'rails_helper'

RSpec.describe Bike, type: :model do
  subject do
    user = User.create(name: 'User', email: 'Email.com', password: 'Password')
    Bike.create(name: 'AlusiA', bike_image: 'https://imgd.aeplcdn.com/', bike_type: 'HNDA', description: 'Tption',
                brand: 'This Brand', daily_rate: '2000', user_id: user.id)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    bike = Bike.new(name: nil)
    expect(bike).to_not be_valid
  end
  it 'is not valid without a bike_type' do
    bike = Bike.new(bike_type: nil)
    expect(bike).to_not be_valid
  end
  it 'is not valid without a description' do
    bike = Bike.new(description: nil)
    expect(bike).to_not be_valid
  end
end
