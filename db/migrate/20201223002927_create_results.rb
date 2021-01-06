class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|
      t.string :age, null: false
      t.string :sex, null: false
      t.string :area, null: false
      t.string :status, null: false
      t.string :distance, null: false
      t.string :importance, null: false
      t.string :values_result, null: false
      t.string :personality_result, null: false

      t.timestamps
    end
  end
end
