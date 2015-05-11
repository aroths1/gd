class DestinationSpecificActivity < ActiveRecord::Base
  belongs_to :activity
  belongs_to :destination
  has_many :trips
  attr_accessible :end_date, :start_date
end
