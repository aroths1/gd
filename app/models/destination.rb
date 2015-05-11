class Destination < ActiveRecord::Base
  has_many :activities, through: :destination_specific_activities
  attr_accessible :name
end
