require 'rails_helper'

RSpec.describe Address, type: :model do
  it 'belongs to child' do
    address = Address.reflect_on_association(:child)
    expect(address.macro).to eq(:belongs_to)
  end
end
