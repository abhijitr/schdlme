class CreateAvailabilities < ActiveRecord::Migration
  def self.up
    create_table :availabilities do |t|
      t.references :meeting
      t.datetime :start
	  t.datetime :end
	  t.integer :duration
	  t.timestamps
    end
  end

  def self.down
    drop_table :availabilities
  end
end
