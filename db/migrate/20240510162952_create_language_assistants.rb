class CreateLanguageAssistants < ActiveRecord::Migration[7.1]
  def change
    create_table :language_assistants do |t|
      t.references :account, null: false, foreign_key: true
      t.boolean :enabled, default: true, null: false
      t.timestamps
    end
  end
end
