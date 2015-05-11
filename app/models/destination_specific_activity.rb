class DestinationSpecificActivity < ActiveRecord::Base
  belongs_to :activity
  belongs_to :destination
  has_many :trips
  has_many :items
  attr_accessible :end_date, :start_date, :activity, :destination
end
