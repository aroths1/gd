class LineItem < ActiveRecord::Base
  belongs_to :participant
  belongs_to :item
  attr_accessible :quantity
end
