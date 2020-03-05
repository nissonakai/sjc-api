class Changetitlelimit < ActiveRecord::Migration[5.2]
  def up
    change_column :questions, :title, :string, limit: 25, null: false
  end

  def down
    change_column :questions, :title, :string, limit: 12, null: false
  end
end
