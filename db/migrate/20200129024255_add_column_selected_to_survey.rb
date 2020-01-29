class AddColumnSelectedToSurvey < ActiveRecord::Migration[5.2]
  def change
    add_column :surveys, :selected, :boolean, default: false, null: false
  end
end
