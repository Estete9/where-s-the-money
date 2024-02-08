require 'rails_helper'
require 'pry'

RSpec.describe Category, type: :model do
  let(:user) { create(:user) }
  let(:category) { create(:category, user:) }

  it 'is valid with a name, and icon class' do
    expect(category).to be_valid
  end

  it 'is invalid without a name' do
    category = build(:category, name: nil)

    expect(category).to_not be_valid
  end

  it 'is invalid without an icon' do
    category = build(:category, icon: nil)

    expect(category).to_not be_valid
  end

  it 'belongs to user' do
    expect(category.user).to eq(user)
  end

  it 'can have multiple activities' do
    activity1 = create(:activity, author: user)
    activity2 = create(:activity, author: user)
    category = create(:category, user:)

    category.activities << activity1
    category.activities << activity2

    expect(category.activities).to include(activity1, activity2)
  end
end
