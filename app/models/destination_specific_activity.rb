class DestinationSpecificActivity < ActiveRecord::Base
  belongs_to :activity
  belongs_to :destination
  has_many :trips #, inverse_of: :destination_specific_actitivity
  has_many :items #, inverse_of: :destination_specific_actitivity
  attr_accessible :end_date, :start_date, :activity, :destination
  validates :end_date, :start_date, :activity_id, :destination_id, presence: true
  validate :end_date_cannot_be_before_start_date
  
  def end_date_cannot_be_before_start_date
    if self.end_date < self.start_date
      errors.add(:end_date, "can't be before start date")
    end
  end
  
  def to_s
    self.activity.name #+ ': ' + self.start_date.to_s + ' - ' + self.end_date.to_s
  end
end
