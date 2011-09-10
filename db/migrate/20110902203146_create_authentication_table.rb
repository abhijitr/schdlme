class CreateAuthenticationTable < ActiveRecord::Migration
  def self.up
    create_table :authentications do |t|
	  t.integer :user_id
	  t.string :provider
	  t.string :uid
	  t.string :token
	  t.string :secret

	  t.timestamps
	end
  
  end

  def self.down
    drop_table :authentications
  end
end