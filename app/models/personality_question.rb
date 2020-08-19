class PersonalityQuestion < Question
    after_initialize :set_default_category
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
    end

    private

    def set_default_category
        self.category ||= 5
    end
end