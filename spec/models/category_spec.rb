require 'rails_helper'
require 'pry'

RSpec.describe Category, type: :model do
  let(:user) { create(:user) }
  let(:category) { create(:category, user: user) }

  it 'is valid with a name, and icon class' do
    expect(category).to be_valid
  end

  it 'is invalid without a name' do
    category = build(:category, name: nil)

    expect(category).to_not be_valid
  end

  it 'is valid without an icon' do
    category = build(:category, icon: nil)

    expect(category).to be_valid
  end

  it 'belongs to user' do
    expect(category.user).to eq(user)
  end
end
