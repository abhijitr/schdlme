class Meeting < ActiveRecord::Base
  has_many :availabilities
end
