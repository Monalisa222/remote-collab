require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:task) { create(:task) }

  it "is valid with valid attributes" do
    expect(task).to be_valid
  end

  it "is not valid without a title" do
    task.title = nil
    expect(task).not_to be_valid
  end

  it "belongs to proposal" do
    expect(Task.reflect_on_association(:proposal).macro).to eq(:belongs_to)
  end

  it "defaults to pending status" do
    expect(task.status).to eq("pending")
  end

  it "can be marked as completed" do
    task.completed!
    expect(task.status).to eq("completed")
  end
end