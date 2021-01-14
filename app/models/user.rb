class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true

  has_many :relationships, foreign_key: 'owner_id'
  has_many :contacts, through: :relationships, source: :user
end
