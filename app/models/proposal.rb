class Proposal < ApplicationRecord
  belongs_to :organization
  has_many :tasks, dependent: :destroy

  validates :title, presence: true

  broadcasts_to ->(proposal) { "organization_#{proposal.organization_id}_proposals" }

  after_create_commit :notify_background

  private

  def notify_background
    ProposalNotificationJob.perform_later(id)
  end
end
