class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.references :message_history, index: true, foreign_key: true, null: false
      t.text :body, null: false
      t.boolean :seen, default: false
      t.boolean :assistant, default: false
      t.timestamps
    end
  end
end
