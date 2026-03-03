require "rails_helper"

RSpec.describe "Viewing events", type: :system do
  before do
    driven_by :rack_test

    Event.create!(
      title: "Ruby Meetup",
      description: "Monthly Ruby developer meetup",
      date: DateTime.new(2026, 5, 15, 18, 0, 0),
      capacity: 50
    )

    Event.create!(
      title: "Rails Conference",
      description: "Annual Rails conference",
      date: DateTime.new(2026, 6, 20, 9, 0, 0),
      capacity: 500
    )
  end

  it "displays all events on the index page" do
    visit events_path

    expect(page).to have_content("Ruby Meetup")
    expect(page).to have_content("Rails Conference")
  end

  it "displays the root page as the events index" do
    visit root_path

    expect(page).to have_content("Upcoming Events")
    expect(page).to have_content("Ruby Meetup")
  end

  it "displays event details on the show page" do
    event = Event.find_by!(title: "Ruby Meetup")
    visit event_path(event)

    expect(page).to have_content("Ruby Meetup")
    expect(page).to have_content("Monthly Ruby developer meetup")
    expect(page).to have_content("Capacity: 50")
  end

  it "navigates from index to show page" do
    visit events_path
    click_link "Ruby Meetup"

    expect(page).to have_content("Monthly Ruby developer meetup")
  end

  it "navigates back from show to index page" do
    event = Event.find_by!(title: "Ruby Meetup")
    visit event_path(event)
    click_link "← Back to Events"

    expect(page).to have_content("Upcoming Events")
  end
end
