class ValuesQuestion < Question
    after_initialize :set_default_category
    with_options presence: true do
        validates :choice1
        validates :choice2
        validates :choice3
        validates :choice4
    end

    private

    def set_default_category
        self.category ||= 5
    end
end