module Types
  class TodoType < Types::BaseObject
    field :id, ID, null: false
    field :content, String, null: false
    field :completed, Boolean, null: false
  end
end