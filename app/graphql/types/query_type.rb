# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :allTodos, [Types::TodoType], null:false, description: "Returns all todos"

    def all_todos
      Todo.all
    end
  end
end
