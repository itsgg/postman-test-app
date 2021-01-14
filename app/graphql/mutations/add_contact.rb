module Mutations
  class AddContact < BaseMutation
    argument :owner_id, ID, required: true
    argument :user_id, ID, required: true

    field :user, Types::UserType, null: false

    def resolve(owner_id:, user_id:)
      owner = User.find(owner_id)
      user = User.find(user_id)
      owner.contacts << user
      { user: user }
    rescue ActiveRecord::RecordNotFound => _e
      GraphQL::ExecutionError.new 'User does not exits.'
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new "Invalid attributes for #{e.record.class}: #{e.record.errors.full_messages.join(', ')}"
    end
  end
end
