class ChangeValueQuestionsToQuestions < ActiveRecord::Migration[5.2]
  def change
    rename_table :values_questions, :questions
  end
end
