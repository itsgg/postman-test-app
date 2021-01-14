module Types
  class MutationType < Types::BaseObject
    field :add_contact, mutation: Mutations::AddContact
    field :add_user, mutation: Mutations::AddUser
  end
end
