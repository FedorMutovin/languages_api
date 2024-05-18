class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.references :account, index: true, foreign_key: true, null: false
      t.text :body, null: false
      t.boolean :assistant, default: false, null: false
      t.timestamps
    end
  end
end
