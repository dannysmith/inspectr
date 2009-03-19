class AddFieldsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :login_attempts, :integer, {:null => false, :default => 0} 
    add_column :users, :amount_per_month, :float
  end

  def self.down
    remove_column :users, :login_attempts
    remove_column :users, :amount_per_month
  end
end
