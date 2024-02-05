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
end
