class CreateMessageHistoryCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :message_history_categories do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
