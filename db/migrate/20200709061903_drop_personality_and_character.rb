class DropPersonalityAndCharacter < ActiveRecord::Migration[5.2]
  def change
    drop_table :personalities
    drop_table :characters
  end
end
