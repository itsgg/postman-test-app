module Types
  class QueryType < Types::BaseObject
    field :users, resolver: Queries::FetchUsers
    field :user, resolver: Queries::FetchUser
  end
end
