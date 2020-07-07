class AddGroupToQuestion < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :group, :integer, null: false, default: 1
  end
end
