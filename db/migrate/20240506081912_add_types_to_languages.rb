class AddTypesToLanguages < ActiveRecord::Migration[7.1]
  def change
    add_column :languages, :for_learning, :boolean, null: false, default: false
    add_column :languages, :for_interface, :boolean, null: false, default: false
  end
end
