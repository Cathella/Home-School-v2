require 'rails_helper'

RSpec.describe Member, type: :model do
  it 'belongs to group' do
    member = Member.reflect_on_association(:group)
    expect(member.macro).to eq(:belongs_to)
  end

  it 'belongs to child' do
    member = Member.reflect_on_association(:child)
    expect(member.macro).to eq(:belongs_to)
  end
end
