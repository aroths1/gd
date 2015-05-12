class LineItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :order
  attr_accessible :quantity
end
