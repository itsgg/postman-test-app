module Types
  class ContactType < Types::BaseObject
    field :id, ID, null: false
    field :owner_id, Integer, null: true
    field :user_id, Integer, null: true
  end
end
