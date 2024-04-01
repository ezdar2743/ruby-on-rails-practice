# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :all_todos, [Types::TodoType], null:false, description: "Returns all todos"
    field :completed_todos, [Types::TodoType],null:false, description: "Returns all completed todos"
    def all_todos
      Todo.all
    end

    def completed_todos
      Todo.where(completed: true)
    end
  end
end
