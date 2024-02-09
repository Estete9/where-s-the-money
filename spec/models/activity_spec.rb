require 'rails_helper'

RSpec.describe Activity, type: :model do
  let(:user) { create(:user) }

  it 'is valid with a name, and amount' do
    activity = build(:activity, author: user)
    expect(activity).to be_valid
  end

  it 'is invalid without a name' do
    activity = build(:activity, author: user, name: nil)
    expect(activity).to_not be_valid
  end

  it 'is invalid without an amount' do
    activity = build(:activity, author: user, amount: nil)
    expect(activity).to_not be_valid
  end

  it 'is belongs to user' do
    activity = build(:activity, author: user)
    expect(activity.author).to eq(user)
  end

  it 'can have multiple categories' do
    category1 = create(:category, user:)
    category2 = create(:category, user:)
    activity = create(:activity, author: user)

    activity.categories << category1
    activity.categories << category2

    expect(activity.categories).to include(category1, category2)
  end
end
