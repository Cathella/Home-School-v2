require 'rails_helper'

RSpec.describe Group, type: :model do
  it 'has a name' do
    group = Group.new(
      name: '',
      grade: 'P.1',
      place: 'test',
      program: 'test'
    )
    expect(group).to_not be_valid

    group.name = 'Nakitto Cathie'
    expect(group).to be_valid
  end

  it 'has a grade' do
  end

  it 'has a place' do
  end
end
