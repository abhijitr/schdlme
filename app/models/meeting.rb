class Meeting < ActiveRecord::Base
  has_many :availabilities
  accepts_nested_attributes_for :availabilities 
end
