class AddCurrentFieldToAccountLearningLanguages < ActiveRecord::Migration[7.1]
  def change
    add_column :account_learning_languages, :current, :boolean, default: false, null: false
  end
end
