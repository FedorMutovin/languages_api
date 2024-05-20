class CreateLanguages < ActiveRecord::Migration[7.1]
  def change
    create_table :languages do |t|
      t.string :name, null: false, index: { unique: true }
      t.string :locale, null: false, index: { unique: true }
      t.boolean :for_learning, null: false, default: false
      t.boolean :for_interface, null: false, default: false
      
      t.timestamps
    end
  end
end
