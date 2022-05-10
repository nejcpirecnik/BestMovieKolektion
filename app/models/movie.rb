class Movie < ApplicationRecord
    validates_presence_of :name

    has_many :tickets
    has_many :shows
end
