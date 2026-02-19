class Proposal < ApplicationRecord
  belongs_to :organization
  has_many :tasks, dependent: :destroy

  validates :title, presence: true

  after_create_commit do
    broadcast_append_to(
      "organization_#{organization_id}_proposals",
      target: "proposals",
      partial: "proposals/proposal",
      locals: { proposal: self }
    )
  end
end
