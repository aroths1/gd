class Trip < ActiveRecord::Base
  belongs_to :group
  belongs_to :destination_specific_activity
  belongs_to :leader, class_name: 'User', foreign_key: :leader
  has_many :orders
  attr_accessible :date, :leader, :group, :destination_specific_activity
  
  def to_s
    self.destination_specific_activity.activity.to_s.capitalize + ' with ' + self.group.to_s + ' on ' + self.date.to_s
  end
  
  def total_amount_due
    sum = 0
    self.orders.each {|order| sum += order.total_amount_due}
    sum
  end
end
