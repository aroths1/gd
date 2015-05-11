class Trip < ActiveRecord::Base
  belongs_to :group
  belongs_to :destination_specific_activity
  belongs_to :leader, class_name: 'Person', foreign_key: :leader
  attr_accessible :date, :leader
end
