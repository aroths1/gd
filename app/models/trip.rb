class Trip < ActiveRecord::Base
  belongs_to :group
  belongs_to :destination_specific_activity
  attr_accessible :date, :leader
end
