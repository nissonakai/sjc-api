class Question < ApplicationRecord
    default_scope -> { order(created_at: :desc) }
    validates :title, presence: true, length: { maximum: 25 }, uniqueness: true
    validates :category, numericality: { only_integer: true, less_than_or_equal_to: 5, oter_than: 0 }
    validates :group, presence: true, numericality: { only_integer: true, less_than_or_equal_to: 2, oter_than: 0 }
    belongs_to :survey
    has_one :personality
    accepts_nested_attributes_for :personality
    has_one :character
    accepts_nested_attributes_for :character
end
