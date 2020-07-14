class RemoveGroupFromValuesQuestions < ActiveRecord::Migration[5.2]
  def up
    remove_column :values_questions, :group, :integer
  end

  def down
    add_column :values_questions, :group, :integer
  end
end
