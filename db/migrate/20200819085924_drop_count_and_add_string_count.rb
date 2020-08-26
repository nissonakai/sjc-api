class DropCountAndAddStringCount < ActiveRecord::Migration[5.2]
  def change
    remove_column :questions, :count1, :integer
    remove_column :questions, :count2, :integer
    remove_column :questions, :count3, :integer
    remove_column :questions, :count4, :integer
    remove_column :questions, :count5, :integer
    remove_column :questions, :count6, :integer
    add_column :questions, :countA, :string, null: false, default: "000000", limit: 6
    add_column :questions, :countB, :string, null: false, default: "000000", limit: 6
  end
end
