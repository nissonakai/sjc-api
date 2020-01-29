class Survey < ApplicationRecord
    validates :name, presence: true, length: { maximum: 12 }, uniqueness: true
    has_many :questions, dependent: :destroy
end
