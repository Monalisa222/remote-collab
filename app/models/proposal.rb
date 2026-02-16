class Proposal < ApplicationRecord
  belongs_to :organization

  validates :title, presence: true

  broadcasts_to ->(proposal) { "organization_#{proposal.organization_id}_proposals" }
end
