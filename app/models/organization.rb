class Organization < ApplicationRecord
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships

  has_many :proposals, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
