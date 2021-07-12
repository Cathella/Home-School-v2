require 'rails_helper'

RSpec.describe Detail, type: :model do
  it 'belongs to teacher' do
    detail = Detail.reflect_on_association(:teacher)
    expect(detail.macro).to eq(:belongs_to)
  end
end
