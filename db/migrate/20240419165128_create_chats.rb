class CreateChats < ActiveRecord::Migration[7.1]
  def change
    create_table :chats do |t|
      t.references :account_learning_language, foreign_key: true, null: false, index: true
      t.string :topic, null: false
      t.boolean :main, default: false, null: false
      t.timestamps
    end
  end
end
