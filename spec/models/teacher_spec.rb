require 'rails_helper'

RSpec.describe Teacher, type: :model do
  subject {
    described_class.new(
      full_name: 'Nakitto Catherine',
      email: 'cathie@teacher.com',
      password: 'password',
      password_confirmation: 'password'
    )
  }

  it 'creates Teacher with valid attributes' do
    expect(subject).to be_valid
  end

  it 'has an address' do
    teacher = Teacher.reflect_on_association(:direction)
    expect(teacher.macro).to eq(:has_one)
  end

  it 'has a profile' do
    teacher = Teacher.reflect_on_association(:detail)
    expect(teacher.macro).to eq(:has_one)
  end

  it 'has many groups' do
    teacher = Teacher.reflect_on_association(:groups)
    expect(teacher.macro).to eq(:has_many)
  end
end
