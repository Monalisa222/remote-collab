class ProposalNotificationJob < ApplicationJob
  queue_as :default

  def perform(proposal_id)
    proposal = Proposal.find(proposal_id)
    
    Rails.logger.info "Background Job: Proposal #{proposal.title} created!"
  end
end
