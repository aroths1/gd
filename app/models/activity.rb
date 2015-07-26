class Activity < ActiveRecord::Base
  has_many :destination_specific_activities #, inverse_of: :activity
  has_many :destinations, through: :destination_specific_activities
  attr_accessible :name
  validates :name, presence: true
  validates :name, uniqueness: true
  def to_s
    self.name
  end
end
