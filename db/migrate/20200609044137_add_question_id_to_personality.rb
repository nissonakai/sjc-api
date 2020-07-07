class AddQuestionIdToPersonality < ActiveRecord::Migration[5.2]
  def change
    add_reference :personalities, :question, foreign_key: true, null: false
  end
end
