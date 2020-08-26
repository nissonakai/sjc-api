class PersonalityQuestion < Question
    after_initialize :set_default_category
    with_options presence: true do
        validates :choice1
        validates :choice2
    end

    with_options presence: true, length: { is: 6 } do
        validates :countA
        validates :countB
    end

    validate :less_than_limit_count
    validate :not_all_zero?

    def less_than_limit_count
        def check(count)
            count.split("").all? {|c| 0 <= c.to_i <= 3 }
        end
        if !check(countA)
            errors.add(:countA, "には4点以上の配点が含まれています")
        elsif !check(countB)
            errors.add(:countB, "には4点以上の配点が含まれています")
        end
    end

    def not_all_zero?
        if countA == "000000"
            errors.add(:countA, "は配点が全てゼロです")
        elsif countB == "000000"
            errors.add(:countB, "は配点が全てゼロです")
        end
    end

    private

    def set_default_category
        self.category ||= 5
    end
end