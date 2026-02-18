require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  it "is valid with valid attributes" do
    expect(user).to be_valid
  end

  it "is not valid without a name" do
    user.name = nil
    expect(user).not_to be_valid
  end

  it "is not valid without an email" do
    user.email = nil
    expect(user).not_to be_valid
  end

  it "is not valid with a duplicate email" do
    duplicate_user = build(:user, email: user.email)
    expect(duplicate_user).not_to be_valid
  end

  it "is not valid without a password" do
    user.password = nil
    expect(user).not_to be_valid
  end

  it "is not valid if password and password_confirmation do not match" do
    user.password_confirmation = "different_password"
    expect(user).not_to be_valid
  end

  it "is invalid with duplicate email" do
    create(:user, email: "test@example.com")
    duplicate_user = build(:user, email: "test@example.com")
    expect(duplicate_user).not_to be_valid
  end

  it "has many organizations through memberships" do
    expect(User.reflect_on_association(:organizations).macro).to eq(:has_many)
  end
end
