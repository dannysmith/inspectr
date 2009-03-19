class CreatePayments < ActiveRecord::Migration
  def self.up
    create_table :payments do |t|
      t.integer :cadet_id
      t.float :ammount
      t.datetime :date

      t.timestamps
    end
  end

  def self.down
    drop_table :payments
  end
end
