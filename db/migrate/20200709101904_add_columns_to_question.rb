class AddColumnsToQuestion < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :count1, :integer
    add_column :questions, :count2, :integer
    add_column :questions, :count3, :integer
    add_column :questions, :count4, :integer
    add_column :questions, :count5, :integer
    add_column :questions, :count6, :integer
    add_column :questions, :choice1, :string, default: "test1", null: false
    add_column :questions, :choice2, :string, default: "test2", null: false
    add_column :questions, :choice3, :string
    add_column :questions, :choice4, :string
    change_column :questions, :category, :integer
  end
end
