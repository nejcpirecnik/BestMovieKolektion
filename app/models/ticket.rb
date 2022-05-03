class Ticket < ApplicationRecord
    belongs_to :movie
    belongs_to :user
    belongs_to :seat
    has_many :shows
end