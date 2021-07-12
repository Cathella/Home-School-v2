require 'rails_helper'

RSpec.describe Child, type: :model do
  subject {
    described_class.new(
      full_name: 'Nakitto Catherine', 
      email: 'nakitto@child.com', 
      password: 'password', 
      password_confirmation: 'password')
  }

  it 'creates Child with valid attributes' do
    expect(subject).to be_valid
  end

  it 'has an address' do
    child = Child.reflect_on_association(:address)
    expect(child.macro).to eq(:has_one)
  end

  it 'has a profile' do
    child = Child.reflect_on_association(:profile)
    expect(child.macro).to eq(:has_one)
  end
end
