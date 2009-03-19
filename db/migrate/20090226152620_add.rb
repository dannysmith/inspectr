class Add < ActiveRecord::Migration
  def self.up
    add_column :cadets, :balance, :float, :default  => 0.0
  end

  def self.down
    remove_column :cadets, :balance
  end
end
