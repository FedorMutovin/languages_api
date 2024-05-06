class RemoveLanguageReferenceFromAccounts < ActiveRecord::Migration[7.1]
  def up
    remove_reference :accounts, :interface_language
  end

  def down
    add_reference :accounts, :interface_language, foreign_key: true
  end
end
