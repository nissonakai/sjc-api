class Question < ApplicationRecord
    default_scope -> { order(created_at: :desc) }
    validates :title, presence: true, length: { maximum: 25 }, uniqueness: true
    validates :category, presence: true
    belongs_to :survey
end
