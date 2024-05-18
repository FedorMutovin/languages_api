class CreateRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :requests do |t|
      t.references :account, null: false, foreign_key: true, index: true
      t.references :request_message, null: false, foreign_key: { to_table: :messages }, index: true
      t.references :response_message, null: false, foreign_key: { to_table: :messages }, index: true
      t.string :action, null: false
      t.integer :prompt_tokens, null: false
      t.integer :completion_tokens, null: false
      t.integer :total_tokens, null: false
      t.timestamps
    end
  end
end
