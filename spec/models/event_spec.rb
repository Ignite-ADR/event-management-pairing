require "rails_helper"

RSpec.describe Event, type: :model do
  subject(:event) do
    Event.new(
      title: "Test Event",
      description: "A test event description",
      date: 1.week.from_now,
      capacity: 50
    )
  end

  it "is valid with all attributes" do
    expect(event).to be_valid
  end

  it "is invalid without a title" do
    event.title = nil
    expect(event).not_to be_valid
    expect(event.errors[:title]).to include("can't be blank")
  end

  it "is invalid without a date" do
    event.date = nil
    expect(event).not_to be_valid
    expect(event.errors[:date]).to include("can't be blank")
  end

  it "is invalid without a capacity" do
    event.capacity = nil
    expect(event).not_to be_valid
    expect(event.errors[:capacity]).to include("can't be blank")
  end

  it "is invalid with a capacity of 0" do
    event.capacity = 0
    expect(event).not_to be_valid
    expect(event.errors[:capacity]).to include("must be greater than 0")
  end

  it "is invalid with a negative capacity" do
    event.capacity = -1
    expect(event).not_to be_valid
    expect(event.errors[:capacity]).to include("must be greater than 0")
  end

  it "is valid without a description" do
    event.description = nil
    expect(event).to be_valid
  end
end
