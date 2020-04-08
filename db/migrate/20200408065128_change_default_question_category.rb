class ChangeDefaultQuestionCategory < ActiveRecord::Migration[5.2]
  def up
    change_column :questions, :category, :integer, default: 1, null: false
  end

  def down
    change_column :questions, :category, :integer, default: 0, null: false
  end
end
