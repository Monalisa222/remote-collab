class ProposalCreator
  def initialize(organization:, params:)
    @organization = organization
    @params = params
  end

  def call
    proposal = @organization.proposals.build(@params)
    if proposal.save
      ProposalNotificationJob.perform_later(proposal.id)
      proposal
    else
      proposal
    end
  end
end