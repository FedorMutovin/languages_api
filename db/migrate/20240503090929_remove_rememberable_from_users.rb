class RemoveRememberableFromUsers < ActiveRecord::Migration[7.1]
  def up
    remove_column :users, :remember_created_at, :datetime
  end

  def down
    add_column :users, :remember_created_at, :datetime
  end
end
