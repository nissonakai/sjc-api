class Personality < ApplicationRecord
    belongs_to :question
    with_options numericality: { only_integer: true, less_than_or_equal_to: 3 }, presence: true do
        validates :type1
        validates :type2
        validates :type3
        validates :type4
        validates :type5
        validates :type6
    end 
end
