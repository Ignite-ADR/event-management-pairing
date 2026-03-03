class Event < ApplicationRecord
  validates :title, presence: true
  validates :date, presence: true
  validates :capacity, presence: true, numericality: { greater_than: 0 }
end
