class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.references :chat, index: true, foreign_key: true, null: false
      t.jsonb :body, null: false
      t.boolean :assistant, default: false, null: false
      t.timestamps
    end
  end
end
