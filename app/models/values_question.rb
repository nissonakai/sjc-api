class ValuesQuestion < Question
    validates :category, numericality: { only_integer: true, less_than_or_equal_to: 4, oter_than: 0 }
    with_options presence: true do
        validates :choice1
        validates :choice2
        validates :choice3
        validates :choice4
    end
end