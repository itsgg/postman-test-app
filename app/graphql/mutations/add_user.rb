module Mutations
  class AddUser < BaseMutation
    argument :params, Types::Input::UserInput, required: true

    field :user, Types::UserType, null: false

    def resolve(params:)
      { user: User.create!(Hash(params)) }
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new "Invalid attributes for #{e.record.class}: #{e.record.errors.full_messages.join(', ')}"
    end
  end
end
