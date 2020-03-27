class Jobnumber < ApplicationRecord
    validates :number, presence: true, length: { is: 6 }
    validates :category, presence: true, numericality: { only_integer: true, less_than_or_equal_to: 4 }
    validate :valid_number?

    def valid_number?
        unless number =~ /[0-9]{6}/
            errors.add(:number, "は6桁の数字で入力してください")
        end
    end
end
