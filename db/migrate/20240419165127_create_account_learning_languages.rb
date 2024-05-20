class CreateAccountLearningLanguages < ActiveRecord::Migration[7.1]
  def change
    create_table :account_learning_languages do |t|
      t.references :account, null: false, foreign_key: true
      t.references :language, null: false, foreign_key: true
      
      t.timestamps
    end

    add_index :account_learning_languages, [:account_id, :language_id], unique: true
  end
end
