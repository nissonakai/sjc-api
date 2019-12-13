class AddToQuestionsOptions < ActiveRecord::Migration[5.2]
  def up
    change_column :questions, :title, :string, limit: 12, null: false
    change_column :questions, :red, :string, limit: 12, null: false
    change_column :questions, :blue, :string, limit: 12, null: false
  end

  def down
    change_column :questions, :title, :string
    change_column :questions, :red, :string
    change_column :questions, :blue, :string
  end
end
