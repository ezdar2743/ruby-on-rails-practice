module Mutations
  class CompleteTodo < Mutations::BaseMutation
    argument :id, ID, required: true

    field :todo, Types::TodoType, null: false
    field :errors, [String], null: false

    def resolve(id:)
      todo = Todo.find_by(id: id)
      if todo.nil?
        raise GraphQL::ExecutionError.new('Todo not found.', extensions: { code: 'TODO_NOT_FOUND' })
      elsif todo.update(completed: true)
        {
          todo: todo,
          errors: []
        }
      else
        raise GraphQL::ExecutionError.new('Unable to complete Todo.', extensions: { code: 'TODO_COMPLETE_FAILED', errors: todo.errors.full_messages })
      end
    end
  end
end