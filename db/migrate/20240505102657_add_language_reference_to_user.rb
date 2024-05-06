class AddLanguageReferenceToUser < ActiveRecord::Migration[7.1]
  def change
    add_reference :users, :language, foreign_key: true
  end
end
