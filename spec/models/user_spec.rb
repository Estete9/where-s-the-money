require 'rails_helper'
require 'pry'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  it 'is valid with a name, email, and password' do
    expect(user).to be_valid
  end

  it 'is invalid without a name' do
    user = build(:user, name: nil)
    expect(user).to_not be_valid
  end

  it 'is invalid without an email' do
    user = build(:user, email: nil)
    expect(user).to_not be_valid
  end

  it 'is invalid without a password' do
    user = FactoryBot.build(:user, password: nil)
    expect(user).to_not be_valid
  end

  it 'has many categories' do
    category1 = create(:category, user:)
    category2 = create(:category, user:)

    expect(user.categories).to include(category1, category2)
  end
end
