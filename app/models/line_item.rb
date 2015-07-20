class LineItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :order
  attr_accessible :quantity, :item_id
  
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
