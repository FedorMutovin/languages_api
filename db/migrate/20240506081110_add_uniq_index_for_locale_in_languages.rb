class AddUniqIndexForLocaleInLanguages < ActiveRecord::Migration[7.1]
  def change
    add_index :languages, :locale, unique: true
  end
end
