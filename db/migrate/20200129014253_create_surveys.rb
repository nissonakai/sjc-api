class CreateSurveys < ActiveRecord::Migration[5.2]
  def change
    create_table :surveys do |t|
      t.string :name, limit: 12, null: false

      t.timestamps
    end
  end
end
