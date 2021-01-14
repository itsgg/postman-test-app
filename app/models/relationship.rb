class Relationship < ApplicationRecord
  belongs_to :owner, foreign_key: :owner_id, class_name: 'User'
  belongs_to :user, foreign_key: :user_id, class_name: 'User'

  validates :user_id, uniqueness: { scope: :owner_id }
end
