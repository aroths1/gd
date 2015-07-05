class Activity < ActiveRecord::Base
  has_many :destination_specific_activities
  has_many :destinations, through: :destination_specific_activities
  attr_accessible :name
  
  def to_s
    self.name
  end
end
