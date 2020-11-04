class Review < ApplicationRecord
    validates :name, presence: true
    validates :title, presence: true
    validates :text, presence: true, length: { in: 1..400 }
    belongs_to :book
end