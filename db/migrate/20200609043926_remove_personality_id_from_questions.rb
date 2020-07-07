class RemovePersonalityIdFromQuestions < ActiveRecord::Migration[5.2]
  def change
    remove_reference :questions, :personality, foregin_key: true
  end
end
