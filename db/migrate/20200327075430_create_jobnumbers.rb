class CreateJobnumbers < ActiveRecord::Migration[5.2]
  def change
    create_table :jobnumbers do |t|
      t.string :number, null: false, limit: 6
      t.integer :category, null: false, limit: 4
      t.timestamps
    end
  end
end
