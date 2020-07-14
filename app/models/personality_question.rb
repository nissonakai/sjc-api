class PersonalityQuestion < Question
    with_options numericality: { only_integer: true, less_than_or_equal_to: 3 }, presence: true do
        validates :count1
        validates :count2
        validates :count3
        validates :count4
        validates :count5
        validates :count6
    end
    with_options presence: true do
        validates :choice1
        validates :choice2
        validates :choice3
        validates :choice4
    end 
end