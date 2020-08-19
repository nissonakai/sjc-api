class ChangeCategoryDefault < ActiveRecord::Migration[5.2]
  def up
    change_column :questions, :category, :integer, null: false, default: nil
  end
  def down
    change_column :questions, :category, :integer, null: false, default: 1
  end
end
