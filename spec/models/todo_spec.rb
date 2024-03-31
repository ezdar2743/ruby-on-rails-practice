require 'rails_helper'

RSpec.describe Todo, type: :model do
  it "is valid with valid attributes" do
    todo = build(:todo)
    expect(todo).to be_valid
  end

  it "is not valid without a content" do
    todo = build(:todo, content: nil)
    expect(todo).not_to be_valid
  end
end