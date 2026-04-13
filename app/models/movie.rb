class Movie < ApplicationRecord
    validates :title, presence: true
    def self.all_ratings
        %w(G PG PG-13 NC-17 R)
    end
end
