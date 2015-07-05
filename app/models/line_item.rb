class LineItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :order
  attr_accessible :quantity, :item_id
  
  def extended_price
    quantity * item.price
  end
end
