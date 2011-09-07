class AddUuidToMeetings < ActiveRecord::Migration
  def self.up
    add_column :meetings, :uuid, :string
  end

  def self.down
    remove_column :meetings, :uuid
  end
end
