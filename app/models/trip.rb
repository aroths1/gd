class Trip < ActiveRecord::Base
  belongs_to :group
  belongs_to :destination_specific_activity
  belongs_to :leader, class_name: 'User', foreign_key: :leader
  has_many :orders, dependent: :destroy
  has_many :contacts, dependent: :destroy
  attr_accessible :date, :leader, :group, :destination_specific_activity, :payment_instructions
  validates :date, :leader, :group_id, :destination_specific_activity_id, presence: true
  validate :date_cannot_be_in_past
  
  def date_cannot_be_in_past
    if self.date < Date.today
      errors.add(:date, "cannot be in the past")
    end
  end
  
  def to_s
    self.destination_specific_activity.activity.to_s.capitalize + ' with ' + self.group.to_s + ' on ' + self.date.to_s
  end
  
  def total_amount_due
    sum = 0
    self.orders.each {|order| sum += order.total_amount_due}
    sum
  end
  
  def item_count(item)
    sum = 0
    self.orders.each {|order| sum += order.item_count(item)}
    sum
  end
  
  def user_registered?(user)
    result = Order.where("user_id = :user_id and trip_id = :trip_id", {user_id: user.id, trip_id: self.id})
    if result.empty?
      return false
    else
      return true
    end
  end
  
  def is_leader?(user)
    self.leader.id == user.id
  end
  
  def activity
    self.destination_specific_activity.activity.name
  end
  
  def destination
    self.destination_specific_activity.destination
  end
  
  def publicize_text
    text = "On #{self.date} #{self.group} is planning a trip to go #{self.activity} at #{self.destination}."
    text += " #{self.leader} will be leading the trip. "
    #text += "Get details and sign up online at #{Rails.application.routes.url_helpers.public_trip_url(self.id, host: 'groupsydaisy.com')}."
  end
end
