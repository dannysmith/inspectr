class CreateCadets < ActiveRecord::Migration
  def self.up
    create_table :cadets do |t|
      t.string :surname
      t.string :firstname
      t.integer :user_id
      t.string :email
      t.boolean :standing_order
      t.datetime :date_added
      t.boolean :discharged
      t.timestamps
    end
  end
  
  def self.down
    drop_table :cadets
  end
end
