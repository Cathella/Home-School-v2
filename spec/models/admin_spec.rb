require 'rails_helper'

RSpec.describe Admin, type: :model do
  subject {
    described_class.new(
      full_name: 'Nakitto Catherine',
      email: 'nakitto@admin.com',
      password: 'password',
      password_confirmation: 'password'
    )
  }

  it 'creates Admin with valid attributes 'do
    expect(subject).to be_valid
  end
end
