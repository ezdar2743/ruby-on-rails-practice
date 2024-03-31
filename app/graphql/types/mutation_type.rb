# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
  field :create_todo, mutation: Mutations::CreateTodo
  field :complete_todo, mutation: Mutations::CompleteTodo
  field :update_todo, mutation: Mutations::UpdateTodo
  end
end
