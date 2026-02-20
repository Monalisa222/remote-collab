require 'rails_helper'

RSpec.describe ProposalCreator, type: :service do
  let(:organization) { create(:organization) }
  let(:params) { { title: "New Proposal", description: "This is a test proposal." } }
  let(:user) { create(:user) }

  it "creates a new proposal" do
    service = ProposalCreator.new(organization: organization, user: user, params: params)
    proposal = service.call

    expect(proposal).to be_persisted
    expect(proposal.title).to eq("New Proposal")
    expect(proposal.description).to eq("This is a test proposal.")
    expect(proposal.organization).to eq(organization)
    expect(proposal.user).to eq(user)
  end
end
