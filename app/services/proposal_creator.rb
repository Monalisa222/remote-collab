class ProposalCreator
  def initialize(organization:, user:, params:)
    @organization = organization
    @user = user
    @params = params
  end

  def call
    proposal = @organization.proposals.build(@params.merge(user: @user))
    if proposal.save
      ProposalNotificationJob.perform_later(proposal.id)
      proposal
    else
      proposal
    end
  end
end