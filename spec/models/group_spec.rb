require 'rails_helper'

RSpec.describe Group, type: :model do  
  it 'belongs to teacher' do
    group = Group.reflect_on_association(:teacher)
    expect(group.macro).to eq(:belongs_to)
  end

  it 'has many members' do
    group = Group.reflect_on_association(:members)
    expect(group.macro).to eq(:has_many)
  end
end
