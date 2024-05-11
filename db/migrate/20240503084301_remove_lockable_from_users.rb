class RemoveLockableFromUsers < ActiveRecord::Migration[7.1]
  def up
    remove_column :users, :failed_attempts, :integer
    remove_column :users, :unlock_token, :string
    remove_column :users, :locked_at, :datetime
  end

  def down
    add_column :users, :failed_attempts, :integer, default: 0, null: false
    add_column :users, :unlock_token, :string
    add_column :users, :locked_at, :datetime
  end
end
