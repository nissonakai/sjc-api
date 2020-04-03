class RenameAreaColumnToAreaId < ActiveRecord::Migration[5.2]
  def change
    rename_column :jobnumbers, :area, :area_id
  end
end
