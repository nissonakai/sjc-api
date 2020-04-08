class Question < ApplicationRecord
    default_scope -> { order(created_at: :desc) }
    validates :title, presence: true, length: { maximum: 25 }, uniqueness: true
    validates :category, numericality: { only_integer: true, less_than_or_equal_to: 5, oter_than: 0 }
    belongs_to :survey
end
