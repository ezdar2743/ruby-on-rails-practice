module Mutations
  class UpdateTodo < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :content, String, required: true
    argument :completed, Boolean, required:true

    field :todo, Types::TodoType, null: false
    field :errors, [String], null: false

    def resolve(id:, content:, completed:)
      todo = Todo.find_by(id: id)

      if todo.nil?
        {todo: nil, errors: ["Todo not found."]}
      elsif todo.update(content: content, completed: completed)
        {todo: todo, errors: []}
      else {
        todo: nil,
        errors: todo.errors.full_messages
      }
      end
    end
  end
end
