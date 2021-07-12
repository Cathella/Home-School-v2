require 'rails_helper'

RSpec.describe Direction, type: :model do
  it 'belongs to teacher' do
    direction = Direction.reflect_on_association(:teacher)
    expect(direction.macro).to eq(:belongs_to)
  end
end
