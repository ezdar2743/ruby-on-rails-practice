module Types
  class TodoType < Types::BaseObject
    field :id, ID, null: false
    field :content, String, null: false
    field :completed, Boolean, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end