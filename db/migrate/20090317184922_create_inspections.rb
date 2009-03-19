class CreateInspections < ActiveRecord::Migration
  def self.up
    create_table :inspections do |t|
      t.integer :cadet_id
      t.date :date
      t.integer :score
      t.boolean :authorized_absent

      t.timestamps
    end
  end

  def self.down
    drop_table :inspections
  end
end
