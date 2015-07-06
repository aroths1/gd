class Order < ActiveRecord::Base
  has_many :line_items, :dependent => :destroy
  belongs_to :user
  belongs_to :trip
  
  attr_accessible :paid, :user_id, :trip_id, :line_items, :line_items_attributes
  accepts_nested_attributes_for :line_items
  
  def total_amount_due
    sum = 0
    self.line_items.each {|line_item| sum += line_item.extended_price}
    sum
  end
  
  def item_count(item)
    sum = 0
    self.line_items.each {|line_item| sum += line_item.quantity if line_item.item_id == item.id}
    sum
  end
end
