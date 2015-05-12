class DestinationSpecificActivity < ActiveRecord::Base
  belongs_to :activity
  belongs_to :destination
  has_many :trips
  has_many :items
  attr_accessible :end_date, :start_date, :activity, :destination
  
  def to_s
    self.activity.name #+ ': ' + self.start_date.to_s + ' - ' + self.end_date.to_s
  end
end
