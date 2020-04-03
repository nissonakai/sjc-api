class AddAreasToJobnumber < ActiveRecord::Migration[5.2]
  def change
    add_column :jobnumbers, :area, :integer, null: false, default: 0, less_than_or_equal_to: 7
  end
end
