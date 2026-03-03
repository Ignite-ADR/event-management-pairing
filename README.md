# Event Management System

A simple event management system built with Ruby on Rails 7. View and browse upcoming events.

## Prerequisites

- [Docker Desktop](https://www.docker.com/products/docker-desktop/) installed and running

That's it — no local Ruby, Node, or PostgreSQL needed.

## Getting Started

```bash
docker compose up --build
```

Visit **http://localhost:3000** to see the events listing page with 6 sample events.

The first run takes a few minutes to build the image. Subsequent starts are fast:

```bash
docker compose up
```

## Running Tests

```bash
docker compose exec web bundle exec rspec
```

## Stopping

```bash
docker compose down
```

To fully reset (removes database data):

```bash
docker compose down -v
```

## Live Code Editing

The app directory is mounted into the container. Edit files on your host machine, refresh the browser, and see changes immediately — no rebuild needed.

## Project Structure

```
app/
├── models/
│   └── event.rb               # Event model with validations
├── controllers/
│   └── events_controller.rb   # Handles event listing and viewing
└── views/
    └── events/
        ├── index.html.erb     # Events listing page
        └── show.html.erb      # Individual event page
spec/
├── models/
│   └── event_spec.rb         # Event model specs
└── system/
    └── view_events_spec.rb   # System specs for viewing events
```

## Tech Stack

- Ruby on Rails 7.0
- PostgreSQL 14
- Tailwind CSS
- RSpec + Capybara for testing
