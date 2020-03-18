class RemoveRedBlueFromQuestions < ActiveRecord::Migration[5.2]
  def change
    remove_column :questions, :red, :string
    remove_column :questions, :blue, :string
  end
end
