module Queries
  class FetchUser < Queries::BaseQuery
    argument :id, ID, required: true
    
    type Types::UserType, null: false

    def resolve(id:)
      User.find(id)
    rescue ActiveRecord::RecordNotFound => _e
      GraphQL::ExecutionError.new 'User does not exits.'
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new "Invalid attributes for #{e.record.class}: #{e.record.errors.full_messages.join(', ')}"
    end
  end
end
