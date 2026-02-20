class Task < ApplicationRecord
  belongs_to :proposal

  enum :status, { pending: 0, completed: 1 }

  after_create_commit do
    broadcast_append_to(
      "proposal_#{proposal_id}_tasks",
      target: "tasks",
      partial: "tasks/task",
      locals: { task: self }
    )
  end

  after_update_commit do
    broadcast_replace_to(
      "proposal_#{proposal_id}_tasks"
    )
  end

  validates :title, presence: true
end
