
module Mutations
  class CreateTodo < BaseMutation
    argument :content, String, required: true

    field :todo, Types::TodoType, null: false

    def resolve(content:)
      todo = Todo.create!(content: content, completed: false)
      { todo: todo }
    end
  end
end
