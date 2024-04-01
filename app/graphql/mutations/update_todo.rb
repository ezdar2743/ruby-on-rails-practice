module Mutations
  class UpdateTodo < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :content, String, required: false
    argument :completed, Boolean, required: false

    field :todo, Types::TodoType, null: false
    field :errors, [String], null: false

    def resolve(id:, content: nil, completed: nil)
      todo = Todo.find_by(id: id)

      if todo.nil?
        raise GraphQL::ExecutionError.new('Todo not found.', extensions: { code: 'TODO_NOT_FOUND' })
      end

      update_params = {}
      update_params[:content] = content unless content.nil?
      update_params[:completed] = completed unless completed.nil?

      if todo.update(update_params)
        { todo: todo, errors: [] }
      else
        raise GraphQL::ExecutionError.new('Unable to update Todo.', extensions: { code: 'TODO_UPDATE_FAILED', errors: todo.errors.full_messages })
      end
    end
  end
end
