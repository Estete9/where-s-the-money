require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with a name, email, and password' do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end

  it 'is invalid without a name' do
    user = FactoryBot.build(:user, name: nil)
    expect(user).to_not be_valid
  end

  it 'is invalid without an email' do
    user = FactoryBot.build(:user, email: nil)
    expect(user).to_not be_valid
  end

  it 'is invalid without a password' do
    user = FactoryBot.build(:user, password: nil)
    expect(user).to_not be_valid
  end


end
