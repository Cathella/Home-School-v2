require 'rails_helper'

RSpec.describe Profile, type: :model do
  it 'belongs to child' do
    profile = Profile.reflect_on_association(:child)
    expect(profile.macro).to eq(:belongs_to)
  end
end
