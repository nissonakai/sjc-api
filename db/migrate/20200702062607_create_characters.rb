class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.integer :type1, default: 0, null: false, less_than_or_equal_to: 1
      t.integer :type2, default: 0, null: false, less_than_or_equal_to: 1
      t.integer :type3, default: 0, null: false, less_than_or_equal_to: 1
      t.integer :type4, default: 0, null: false, less_than_or_equal_to: 1
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
