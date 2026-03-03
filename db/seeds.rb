events = [
  {
    title: "Ruby on Rails Workshop",
    description: "A hands-on workshop covering the fundamentals of Ruby on Rails. Perfect for beginners who want to build their first web application. We'll cover MVC architecture, Active Record, and deploying to production.",
    date: DateTime.new(2026, 4, 15, 10, 0, 0),
    capacity: 30
  },
  {
    title: "Tech Networking Mixer",
    description: "Join fellow developers, designers, and tech enthusiasts for an evening of networking and knowledge sharing. Light refreshments will be provided.",
    date: DateTime.new(2026, 4, 22, 18, 0, 0),
    capacity: 100
  },
  {
    title: "Docker & Kubernetes Deep Dive",
    description: "An advanced session on container orchestration. Learn how to deploy, scale, and manage containerized applications using Docker and Kubernetes in production environments.",
    date: DateTime.new(2026, 5, 5, 9, 0, 0),
    capacity: 50
  },
  {
    title: "Open Source Hackathon",
    description: "A full-day hackathon focused on contributing to open source projects. Bring your laptop and your enthusiasm! Mentors will be available to help first-time contributors.",
    date: DateTime.new(2026, 5, 18, 9, 0, 0),
    capacity: 75
  },
  {
    title: "JavaScript Frameworks Panel",
    description: "Industry experts discuss the current state of JavaScript frameworks — React, Vue, Svelte, and more. Includes a Q&A session and live coding demos.",
    date: DateTime.new(2026, 6, 1, 14, 0, 0),
    capacity: 200
  },
  {
    title: "Pair Programming Social",
    description: "Practice pair programming with other developers in a relaxed, social setting. All skill levels welcome. We'll rotate pairs every 30 minutes on fun coding challenges.",
    date: DateTime.new(2026, 6, 10, 17, 0, 0),
    capacity: 40
  }
]

events.each do |event_attrs|
  Event.find_or_create_by!(title: event_attrs[:title]) do |event|
    event.assign_attributes(event_attrs)
  end
end

puts "Seeded #{Event.count} events."
