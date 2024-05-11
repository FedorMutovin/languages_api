class CreateMessageHistories < ActiveRecord::Migration[7.1]
  def change
    create_table :message_histories do |t|
      t.references :language_assistant, null: false, foreign_key: true
      t.references :message_history_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
