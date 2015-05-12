class Order < ActiveRecord::Base
  belongs_to :participant
  has_many :line_items
  
  attr_accessible :paid, :participant
end
