module Mutations
  class CompleteTodo < Mutations::BaseMutation
    argument :id, ID, required: true

    field :todo, Types::TodoType, null: false
    field :errors, [String], null: false

    def resolve(id:)
      todo = Todo.find_by(id: id)
      if todo.nil?
        {
          todo: nil,
          errors: ["Todo not found."]
        }
      elsif todo.update(completed: true)
        {
          todo: todo,
          errors: []
        }
      else
        {
          todo: nil,
          errors: todo.errors.full_messages
        }
      end
    end
  end
end