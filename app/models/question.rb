class Question < ApplicationRecord
    default_scope -> { order(created_at: :desc) }
    validates :title, presence: true, length: { maximum: 12 }
    validates :red, presence: true, length: { maximum: 12 }
    validates :blue, presence: true, length: { maximum: 12 }
end
