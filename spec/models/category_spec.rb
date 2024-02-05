require 'rails_helper'
require 'pry'

RSpec.describe Category, type: :model do
  it 'is valid with a name, and icon class' do
    category = build(:category)

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
end
