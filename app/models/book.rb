class Book < ApplicationRecord
    validates :name, presence: true
    validates :image, presence: true
    validates :author, presence: true
    has_many :reviews
    has_one :rental
    def average
        self.inject(:+) / self.length
    end
end
