class Destination < ActiveRecord::Base
  has_many :activities, through: :destination_specific_activities
  has_many :destination_specific_activities #, inverse_of: :destination
  attr_accessible :name
  validates :name, presence: true
  validates :name, uniqueness: true
  
  def to_s
    self.name
  end
end
