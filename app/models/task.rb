class Task < ApplicationRecord
  belongs_to :proposal

  enum :status, { pending: 0, completed: 1 }

  broadcasts_to ->(task) { "proposal_#{task.proposal_id}_tasks" }

  validates :title, presence: true
end
