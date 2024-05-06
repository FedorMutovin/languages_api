class AddNullFalseForLocaleInLanguages < ActiveRecord::Migration[7.1]
  def change
    change_column_null :languages, :locale, false
  end
end
