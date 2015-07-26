class LineItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :order
  attr_accessible :quantity, :item_id
  validates :quantity, :item_id, :order_id, presence: true
  validates :quantity, numericality: {only_integer: true, greater_than: 0}
  
  def extended_price
    quantity * item.price
  end
  
  def price
    self.item.price
  end
  
  def name
    self.item.name
  end
  
  def ==(x)
    self.item_id == x.id
  end
  
  def <=>(x)
    self.item_id <=> x.item_id
  end
end
