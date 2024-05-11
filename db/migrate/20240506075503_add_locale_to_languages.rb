class AddLocaleToLanguages < ActiveRecord::Migration[7.1]
  def change
    add_column :languages, :locale, :string
  end
end
