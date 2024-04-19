class CreateAccounts < ActiveRecord::Migration[7.1]
  def change
    create_table :accounts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :interface_language, foreign_key: { to_table: :languages }
      t.timestamps
    end
  end
end
