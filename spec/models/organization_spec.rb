require 'rails_helper'

RSpec.describe Organization, type: :model do
  let(:organization) { create(:organization) }

  it "is valid with valid attributes" do
    expect(organization).to be_valid
  end

  it "is not valid without a name" do
    organization.name = nil
    expect(organization).not_to be_valid
  end

  it "has many proposals" do
    expect(Organization.reflect_on_association(:proposals).macro).to eq(:has_many)
  end

  it "has many users through memberships" do
    expect(Organization.reflect_on_association(:users).macro).to eq(:has_many)
  end
end
