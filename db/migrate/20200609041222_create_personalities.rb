class CreatePersonalities < ActiveRecord::Migration[5.2]
  def change
    create_table :personalities do |t|
      t.integer :type1, null: false, default: 0, less_than_or_equal_to: 3
      t.integer :type2, null: false, default: 0, less_than_or_equal_to: 3
      t.integer :type3, null: false, default: 0, less_than_or_equal_to: 3
      t.integer :type4, null: false, default: 0, less_than_or_equal_to: 3
      t.integer :type5, null: false, default: 0, less_than_or_equal_to: 3
      t.integer :type6, null: false, default: 0, less_than_or_equal_to: 3

      t.timestamps
    end
  end
end
