require 'rails_helper'

RSpec.describe Proposal, type: :model do
  let(:proposal) { create(:proposal) }

  it "is valid with valid attributes" do
    expect(proposal).to be_valid
  end

  it "is not valid without a title" do
    proposal.title = nil
    expect(proposal).not_to be_valid
  end

  it "belongs to organization" do
    expect(Proposal.reflect_on_association(:organization).macro).to eq(:belongs_to)
  end
end
