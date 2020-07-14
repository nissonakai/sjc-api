class Question < ApplicationRecord
    default_scope -> { order(created_at: :desc) }
    validates :title, presence: true, length: { maximum: 25 }, uniqueness: true
    belongs_to :survey

    class << self
        def find_sti_class(type)
            class_name = "#{type.camelize}Question"
            super(class_name)
        end

        def sti_name
            @sti_name ||= self.name == 'ValuesQuestion' ? 'values' : 'personality'
        end
    end
end
