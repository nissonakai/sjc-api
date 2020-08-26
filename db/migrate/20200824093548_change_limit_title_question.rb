class ChangeLimitTitleQuestion < ActiveRecord::Migration[5.2]
  def up
    change_column :questions, :title, :string, limit: 50
  end
  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
