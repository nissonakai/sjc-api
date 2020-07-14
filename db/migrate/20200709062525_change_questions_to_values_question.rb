class ChangeQuestionsToValuesQuestion < ActiveRecord::Migration[5.2]
  def change
    rename_table :questions, :values_questions
  end
end
