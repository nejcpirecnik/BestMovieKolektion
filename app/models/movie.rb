class Movie < ApplicationRecord
    has_many :tickets
    has_many :shows
end
