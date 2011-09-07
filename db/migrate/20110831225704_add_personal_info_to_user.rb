class AddPersonalInfoToUser < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
	  t.string :first_name
	  t.string :last_name
	  t.string :name
	  t.string :uid
	end
  end

  def self.down
    change_table :users do |t|
	  t.remove :first_name, :last_name, :name, :uid
	end
  end
end
