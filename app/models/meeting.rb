class Meeting < ActiveRecord::Base
  has_many :availabilities
  accepts_nested_attributes_for :availabilities 

  before_create :set_uuid

  def set_uuid
    self.uuid = Meeting.create_uuid(10)
  end

  def self.create_uuid(length)
    initial_string = ActiveSupport::SecureRandom.base64(128).gsub(/[\/=\+]/, "")
    start_index = ActiveSupport::SecureRandom.random_number(initial_string.length - length + 1)
    end_index = start_index + length - 1
    initial_string[start_index .. end_index]
  end
end
